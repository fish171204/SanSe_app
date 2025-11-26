import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tester/src/views/map/cluster_utils.dart';
import 'package:tester/src/views/map/map_campaign_model.dart';
import 'map_controller.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late MapController _controller;

  @override
  void initState() {
    super.initState();

    // 1. Khởi tạo Controller
    _controller = MapController(
      onMarkerUpdate: (markers) {
        if (mounted) setState(() {});
      },
      // --- XỬ LÝ SỰ KIỆN NHẤN VÀO MARKER/CLUSTER ---
      onClusterTap: (items) {
        _showCampaignListDialog(context, items);
      },
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.loadDemoData();
    });
  }

  void _showCampaignListDialog(BuildContext context, List<MapItem> items) {
    // Lọc ra danh sách CampaignModel tương ứng với MapItem.id
    // Ở đây mình lấy ngẫu nhiên hoặc theo ID nếu trùng khớp
    // Logic thực tế: Dùng items[i].id để query DB lấy CampaignModel
    List<MapCampaignModel> campaignsToShow = [];

    for (var item in items) {
      // Tìm campaign có id trùng với marker id
      // Nếu không thấy thì lấy đại cái đầu tiên để demo hiển thị cho đẹp
      var camp = dummyCampaigns.firstWhere(
        (c) => c.id == item.id,
        orElse: () => dummyCampaigns[0],
      );
      campaignsToShow.add(camp);
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Cho phép sheet cao lên
      backgroundColor: Colors.transparent,
      isDismissible: true, // QUAN TRỌNG: Cho phép bấm ra ngoài để đóng
      enableDrag: true, // Cho phép kéo xuống để đóng
      builder: (context) {
        // Tính toán chiều cao khởi tạo dựa trên số lượng item
        // Ít item thì hiện thấp, nhiều item thì hiện cao
        double initialSize = (campaignsToShow.length <= 2) ? 0.4 : 0.6;

        return DraggableScrollableSheet(
          initialChildSize: initialSize,
          minChildSize: 0.2,
          maxChildSize: 0.85,
          expand:
              false, // QUAN TRỌNG: Để nó không chiếm hết màn hình, giúp vùng click bên ngoài hoạt động tốt hơn
          builder: (context, scrollController) {
            return Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  // Thanh kéo nhỏ ở trên (Handle)
                  Center(
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 12),
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),

                  // Header: Tiêu đề + Nút đóng
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Danh sách (${campaignsToShow.length})',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // Nút đóng nhỏ (User experience tốt hơn)
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: const Padding(
                          padding: EdgeInsets.all(4.0),
                          child:
                              Icon(Icons.close, size: 24, color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // List Items
                  Expanded(
                    child: ListView.separated(
                      controller: scrollController,
                      itemCount: campaignsToShow.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        return CampaignCard(data: campaignsToShow[index]);
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: _controller.initialCamera,
            mapType: _controller.mapType,
            markers: _controller.markers, // Lấy marker từ controller
            myLocationEnabled: false,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,

            onMapCreated: (c) {
              _controller.setMapController(c);
              setState(() {});
            },
            // --- QUAN TRỌNG: Bắt sự kiện zoom để tính lại cluster ---
            onCameraMove: _controller.onCameraMove,
            // -------------------------------------------------------
          ),

          // Loading overlay
          if (_controller.loading)
            Container(
              color: Colors.white,
              child: const Center(child: CircularProgressIndicator()),
            ),

          // TOP controls (back button + search + chips + dropdown)
          // (Phần này giữ nguyên UI như yêu cầu của bạn)
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Back button và Search bar
                  Row(
                    children: [
                      // Back button
                      Container(
                        margin: const EdgeInsets.only(right: 8),
                        child: FloatingActionButton.small(
                          heroTag: 'back',
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black87,
                          elevation: 2,
                          onPressed: () => Navigator.pop(context),
                          child: const Icon(Icons.arrow_back, size: 20),
                        ),
                      ),
                      // Search bar
                      Expanded(
                        child: Material(
                          elevation: 2,
                          borderRadius: BorderRadius.circular(24),
                          child: TextField(
                            controller: _controller.searchController,
                            textInputAction: TextInputAction.search,
                            decoration: InputDecoration(
                              hintText:
                                  'Tìm kiếm theo tên chiến dịch, địa điểm',
                              prefixIcon: const Icon(Icons.search),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(24),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                            ),
                            onSubmitted: (q) {
                              // TODO: trigger search
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // Horizontal chips
                  SizedBox(
                    height: 36,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, i) {
                        final tag = _controller.tags[i];
                        final selected = _controller.selectedTags.contains(tag);
                        return FilterChip(
                          selected: selected,
                          label: Text(tag),
                          onSelected: (v) {
                            setState(() {
                              _controller.toggleTag(tag, v);
                            });
                            // TODO: filter map by selected tags
                          },
                        );
                      },
                      separatorBuilder: (_, __) => const SizedBox(width: 8),
                      itemCount: _controller.tags.length,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Campaign dropdown (small pill)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Material(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      elevation: 2,
                      child: PopupMenuButton<String>(
                        offset: const Offset(0, 40),
                        color: Colors.white,
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        itemBuilder: (context) => const [
                          PopupMenuItem(
                            value: 'Người khó khăn',
                            child: Row(
                              children: [
                                Icon(Icons.person_search, size: 18),
                                SizedBox(width: 6),
                                Text('Người khó khăn'),
                              ],
                            ),
                          ),
                          PopupMenuItem(
                            value: 'Chiến dịch',
                            child: Row(
                              children: [
                                Icon(Icons.campaign, size: 18),
                                SizedBox(width: 6),
                                Text('Chiến dịch'),
                              ],
                            ),
                          ),
                          PopupMenuItem(
                            value: 'Sự kiện',
                            child: Row(
                              children: [
                                Icon(Icons.event, size: 18),
                                SizedBox(width: 6),
                                Text('Sự kiện'),
                              ],
                            ),
                          ),
                        ],
                        onSelected: (value) {
                          setState(() {
                            _controller.setCampaignType(value);
                          });
                          // TODO: filter by campaign type
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                _controller.campaignType == 'Người khó khăn'
                                    ? Icons.person_search
                                    : _controller.campaignType == 'Chiến dịch'
                                        ? Icons.campaign
                                        : Icons.event,
                                size: 18,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                _controller.campaignType,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(width: 4),
                              const Icon(Icons.keyboard_arrow_down, size: 16),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Zoom controls và Locate button (bottom-right)
          Positioned(
            right: 12,
            bottom: 120,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Zoom in button
                FloatingActionButton.small(
                  heroTag: 'zoomIn',
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black87,
                  elevation: 3,
                  onPressed: () async {
                    await _controller.zoomIn();
                  },
                  child: const Icon(Icons.add),
                ),
                const SizedBox(height: 8),

                // Zoom out button
                FloatingActionButton.small(
                  heroTag: 'zoomOut',
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black87,
                  elevation: 3,
                  onPressed: () async {
                    await _controller.zoomOut();
                  },
                  child: const Icon(Icons.remove),
                ),
                const SizedBox(height: 8),

                // 🔁 Toggle map type (Normal <-> Satellite)
                FloatingActionButton.small(
                  heroTag: 'mapType',
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black87,
                  elevation: 3,
                  onPressed: () {
                    setState(() {
                      _controller.toggleMapType();
                    });
                  },
                  tooltip: 'Đổi chế độ bản đồ',
                  child: Icon(
                    _controller.mapType == MapType.normal
                        ? Icons.satellite_alt
                        : Icons.layers_outlined,
                  ),
                ),
                const SizedBox(height: 8),

                // Locate button
                FloatingActionButton.small(
                  heroTag: 'locate',
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black87,
                  elevation: 3,
                  onPressed: _controller.goToVN,
                  child: const Icon(Icons.my_location),
                ),
              ],
            ),
          ),

          // Bottom action bar
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 0, 12, 8),
                child: Row(
                  children: [
                    // Nút "X chiến dịch xung quanh"
                    Expanded(
                      child: _BadgeButton(
                        icon: Icons.place_outlined,
                        label: '12 hoàn cảnh xung quanh', // TODO: bind số thật
                        color: Colors.white,
                        foreground: Colors.black87,
                        onTap: () {
                          // TODO: open nearby list
                        },
                      ),
                    ),
                    const SizedBox(width: 12),
                    // Nút "Cứu trợ"
                    _PrimaryRoundButton(
                      icon: Icons.volunteer_activism,
                      label: 'Cứu trợ',
                      onTap: () {
                        // TODO: open create help / SOS
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Nút trắng có icon + label (giống "147 chiến dịch xung quanh")
class _BadgeButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color color;
  final Color foreground;

  const _BadgeButton({
    required this.icon,
    required this.label,
    required this.onTap,
    this.color = Colors.white,
    this.foreground = Colors.black87,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      borderRadius: BorderRadius.circular(28),
      elevation: 3,
      child: InkWell(
        borderRadius: BorderRadius.circular(28),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 18, color: foreground),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  label,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: foreground,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Nút tròn cam (giống "Cứu trợ")
class _PrimaryRoundButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _PrimaryRoundButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = Colors.orange.shade600;
    return Material(
      color: color,
      borderRadius: BorderRadius.circular(28),
      elevation: 3,
      child: InkWell(
        borderRadius: BorderRadius.circular(28),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              Icon(icon, color: Colors.white, size: 18),
              const SizedBox(width: 8),
              Text(
                label,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
