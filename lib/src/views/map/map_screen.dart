import 'dart:async';
import 'dart:math' as math;
import 'dart:ui' as ui; // <-- THÊM VÀO
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // <-- THÊM VÀO
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? _mapController;
  final _searchCtrl = TextEditingController();
  MapType _mapType = MapType.normal;

  // Vị trí mặc định: Việt Nam
  static const _vnCenter = LatLng(15.9, 105.8);
  static const CameraPosition _initialCam = CameraPosition(
    target: _vnCenter,
    zoom: 5.6,
  );

  bool _loading = true;

  // State filter
  final List<String> _tags = ['Xóa nghèo', 'Xóa đói', 'Trẻ em', 'Người'];
  final Set<String> _selectedTags = {'Xóa nghèo'};
  String _campaignType = 'Người khó khăn';

  // SỬA Ở ĐÂY: Bỏ 'final' và các marker demo cũ
  Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _buildDemoMarkers(); // Tải các marker demo khi màn hình bật
  }

  /// Hàm này tạo ra các icon cluster demo và cập nhật bản đồ
  /// Hàm này tạo ra các icon cluster demo và cập nhật bản đồ
  /// Hàm này tạo ra các icon cluster demo và cập nhật bản đồ
  /// Hàm này tạo ra các icon cluster demo và cập nhật bản đồ
  Future<void> _buildDemoMarkers() async {
    try {
      // 1. "Vẽ" 3 icon cluster cũ (số lượng lớn)
      final clusterIcon175 = await _createClusterMarker(
        count: 5,
        scale: 0.75,
      );
      final clusterIcon43 = await _createClusterMarker(
        count: 3,
        scale: 0.75,
      );
      final clusterIcon288 = await _createClusterMarker(
        count: 2,
        scale: 0.75,
      );

      // 2. "Vẽ" các icon cluster mới (số lượng nhỏ 1, 2, 3)
      final clusterIcon1 = await _createClusterMarker(count: 1, scale: 0.75);
      final clusterIcon2 = await _createClusterMarker(count: 2, scale: 0.75);
      final clusterIcon3 = await _createClusterMarker(count: 3, scale: 0.75);

      // 3. Tạo 3 marker cũ
      final marker1 = Marker(
        markerId: const MarkerId('cluster_175'),
        position: const LatLng(21.9, 105.0), // Vị trí demo (gần Hà Nội)
        icon: clusterIcon175,
        anchor: const Offset(0.5, 1.0),
      );

      final marker2 = Marker(
        markerId: const MarkerId('cluster_43'),
        position: const LatLng(21.7, 104.5), // Vị trí demo
        icon: clusterIcon43,
        anchor: const Offset(0.5, 1.0),
      );

      final marker3 = Marker(
        markerId: const MarkerId('cluster_288'),
        position: const LatLng(10.78, 106.69), // Vị trí demo (gần HCM)
        icon: clusterIcon288,
        anchor: const Offset(0.5, 1.0),
      );

      // 4. Tạo 10 marker ảo mới với SỐ LƯỢNG NHỎ
      // --- 5 GẦN HCM (Base: 10.78, 106.69) ---
      final marker4 = Marker(
        markerId: const MarkerId('cluster_hcm_1'), // ID duy nhất
        position: const LatLng(11.13, 106.65), // Bình Dương
        icon: clusterIcon2, // Dùng icon số 2
        anchor: const Offset(0.5, 1.0),
      );
      final marker5 = Marker(
        markerId: const MarkerId('cluster_hcm_2'), // ID duy nhất
        position: const LatLng(10.95, 106.82), // Đồng Nai
        icon: clusterIcon3, // Dùng icon số 3
        anchor: const Offset(0.5, 1.0),
      );
      final marker6 = Marker(
        markerId: const MarkerId('cluster_hcm_3'), // ID duy nhất
        position: const LatLng(10.34, 107.08), // Vũng Tàu
        icon: clusterIcon1, // Dùng icon số 1
        anchor: const Offset(0.5, 1.0),
      );
      final marker7 = Marker(
        markerId: const MarkerId('cluster_hcm_4'), // ID duy nhất
        position: const LatLng(11.31, 106.10), // Tây Ninh
        icon: clusterIcon2, // Dùng icon số 2
        anchor: const Offset(0.5, 1.0),
      );
      final marker8 = Marker(
        markerId: const MarkerId('cluster_hcm_5'), // ID duy nhất
        position: const LatLng(10.53, 106.41), // Long An
        icon: clusterIcon1, // Dùng icon số 1
        anchor: const Offset(0.5, 1.0),
      );

      // --- 5 GẦN DAK LAK (Base: 12.67, 108.04) ---
      final marker9 = Marker(
        markerId: const MarkerId('cluster_dl_1'), // ID duy nhất
        position: const LatLng(13.98, 108.00), // Gia Lai
        icon: clusterIcon3, // Dùng icon số 3
        anchor: const Offset(0.5, 1.0),
      );
      final marker10 = Marker(
        markerId: const MarkerId('cluster_dl_2'), // ID duy nhất
        position: const LatLng(12.00, 107.68), // Dak Nông
        icon: clusterIcon1, // Dùng icon số 1
        anchor: const Offset(0.5, 1.0),
      );
      final marker11 = Marker(
        markerId: const MarkerId('cluster_dl_3'), // ID duy nhất
        position: const LatLng(12.25, 109.19), // Khánh Hòa
        icon: clusterIcon2, // Dùng icon số 2
        anchor: const Offset(0.5, 1.0),
      );
      final marker12 = Marker(
        markerId: const MarkerId('cluster_dl_4'), // ID duy nhất
        position: const LatLng(11.54, 108.43), // Lâm Đồng
        icon: clusterIcon3, // Dùng icon số 3
        anchor: const Offset(0.5, 1.0),
      );
      final marker13 = Marker(
        markerId: const MarkerId('cluster_dl_5'), // ID duy nhất
        position: const LatLng(13.09, 109.29), // Phú Yên
        icon: clusterIcon1, // Dùng icon số 1
        anchor: const Offset(0.5, 1.0),
      );

      // 5. Cập nhật state để hiển thị TẤT CẢ markers
      if (mounted) {
        setState(() {
          _markers = {
            // 3 marker cũ
            marker1,
            marker2,
            marker3,
            // 10 marker mới
            marker4,
            marker5,
            marker6,
            marker7,
            marker8,
            marker9,
            marker10,
            marker11,
            marker12,
            marker13,
          };
        });
      }
    } catch (e) {
      // Nếu có bất kỳ lỗi nào (ví dụ: không tìm thấy asset), nó sẽ in ở đây
      print('!!! LỖI KHI TẠO MARKER: $e');
    }
  }

  // HÀM VẼ CỦA BẠN (ĐÃ ĐƯA VÀO CLASS)
  // HÀM VẼ CỦA BẠN (ĐÃ ĐƯỢC CẬP NHẬT ĐỂ TỰ ĐỘNG GIẢM CHIỀU RỘNG)
  Future<BitmapDescriptor> _createClusterMarker({
    required int count,
    required double scale,
  }) async {
    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);

    // === PHẦN TÍNH TOÁN KÍCH THƯỚC ĐỘNG ===

    // 1. Tải icon và lấy kích thước
    // (Đảm bảo asset 'assets/app/app_map_icon.png' tồn tại)
    final ByteData data = await rootBundle.load('assets/app/app_map_icon.png');
    final ui.Codec codec = await ui.instantiateImageCodec(
      data.buffer.asUint8List(),
      targetHeight: (60 * scale).toInt(), // Giữ nguyên chiều cao icon
    );
    final ui.FrameInfo frame = await codec.getNextFrame();
    final ui.Image iconImage = frame.image;
    final double iconWidth = iconImage.width.toDouble();
    final double iconHeight = iconImage.height.toDouble();

    // 2. Layout text và lấy kích thước
    final textPainter = TextPainter(
      text: TextSpan(
        text: '$count', // Text là số
        style: TextStyle(
          fontSize: 52 * scale,
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    final double textWidth = textPainter.width;
    final double textHeight = textPainter.height;

    // 3. Tính toán kích thước canvas mới
    final double paddingHorizontal = 20 * scale; // Padding trái/phải
    final double paddingMiddle = 16 * scale; // Padding giữa icon và text
    final double paddingVertical = 20 * scale; // Padding trên/dưới

    // THAY ĐỔI CHÍNH: Chiều rộng giờ là động
    final double width = paddingHorizontal +
        iconWidth +
        paddingMiddle +
        textWidth +
        paddingHorizontal;

    // THAY ĐỔI CHÍNH: Chiều cao cũng động theo nội dung
    final double height =
        math.max(iconHeight, textHeight) + (paddingVertical * 2);

    final double arrowHeight = 12 * scale; // Giữ nguyên mũi tên

    // === KẾT THÚC PHẦN TÍNH TOÁN ===

    // 4. Vẽ bubble (bong bóng)
    final Paint paint = Paint()..color = Colors.white;
    final RRect bubbleRect = RRect.fromLTRBR(
      0,
      0,
      width, // Dùng width mới
      height, // Dùng height mới
      Radius.circular(16 * scale),
    );
    canvas.drawRRect(bubbleRect, paint);

    // 5. Vẽ mũi tên (căn giữa theo width mới)
    final Path arrowPath = Path()
      ..moveTo(width / 2 - 12 * scale, height)
      ..lineTo(width / 2, height + arrowHeight)
      ..lineTo(width / 2 + 12 * scale, height)
      ..close();
    canvas.drawPath(arrowPath, paint);

    // 6. Vẽ icon (căn giữa dọc, đặt bên trái)
    final double iconVerticalOffset = (height - iconHeight) / 2;
    canvas.drawImage(
        iconImage, Offset(paddingHorizontal, iconVerticalOffset), Paint());

    // 7. Vẽ text (căn giữa dọc, đặt bên phải icon)
    final double textVerticalOffset = (height - textHeight) / 2;
    final double textHorizontalOffset =
        paddingHorizontal + iconWidth + paddingMiddle;
    textPainter.paint(canvas, Offset(textHorizontalOffset, textVerticalOffset));

    // 8. Xuất ảnh
    final img = await pictureRecorder.endRecording().toImage(
        width.toInt(), (height + arrowHeight).toInt()); // Dùng kích thước mới
    final byteData = await img.toByteData(format: ui.ImageByteFormat.png);
    return BitmapDescriptor.fromBytes(byteData!.buffer.asUint8List());
  }

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  Future<void> _goToVN() async {
    await _mapController?.animateCamera(
      CameraUpdate.newCameraPosition(_initialCam),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: _initialCam,
            onMapCreated: (c) {
              _mapController = c;
              setState(() => _loading = false);
            },
            markers: _markers, // Đã được cập nhật từ initState
            mapType: _mapType,
            myLocationEnabled: false,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
          ),

          // Loading overlay
          if (_loading)
            Container(
              color: Colors.white,
              child: const Center(child: CircularProgressIndicator()),
            ),

          // ... (Toàn bộ phần còn lại của code UI của bạn giữ nguyên) ...
          // TOP controls (back button + search + chips + dropdown)
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
                            controller: _searchCtrl,
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
                        final tag = _tags[i];
                        final selected = _selectedTags.contains(tag);
                        return FilterChip(
                          selected: selected,
                          label: Text(tag),
                          onSelected: (v) {
                            setState(() {
                              if (v) {
                                _selectedTags.add(tag);
                              } else {
                                _selectedTags.remove(tag);
                              }
                            });
                            // TODO: filter map by selected tags
                          },
                        );
                      },
                      separatorBuilder: (_, __) => const SizedBox(width: 8),
                      itemCount: _tags.length,
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
                          setState(() => _campaignType = value);
                          // TODO: filter by campaign type
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                _campaignType == 'Người khó khăn'
                                    ? Icons.person_search
                                    : _campaignType == 'Chiến dịch'
                                        ? Icons.campaign
                                        : Icons.event,
                                size: 18,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                _campaignType,
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
                    await _mapController?.animateCamera(
                      CameraUpdate.zoomIn(),
                    );
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
                    await _mapController?.animateCamera(
                      CameraUpdate.zoomOut(),
                    );
                  },
                  child: const Icon(Icons.remove),
                ),
                const SizedBox(height: 8),

                // 🔁 Toggle map type (Normal <-> Satellite)
                FloatingActionButton.small(
                  heroTag: 'mapType', // nút mới
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black87,
                  elevation: 3,
                  onPressed: () {
                    setState(() {
                      _mapType = (_mapType == MapType.normal)
                          ? MapType.satellite
                          : MapType.normal;
                    });
                  },
                  tooltip: 'Đổi chế độ bản đồ',
                  child: Icon(
                    _mapType == MapType.normal
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
                  onPressed: _goToVN, // TODO: move to user location
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
                    // Nút “X chiến dịch xung quanh”
                    Expanded(
                      child: _BadgeButton(
                        icon: Icons.place_outlined,
                        label:
                            '147 chiến dịch xung quanh', // TODO: bind số thật
                        color: Colors.white,
                        foreground: Colors.black87,
                        onTap: () {
                          // TODO: open nearby list
                        },
                      ),
                    ),
                    const SizedBox(width: 12),
                    // Nút “Cứu trợ”
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

/// Nút trắng có icon + label (giống “147 chiến dịch xung quanh”)
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

/// Nút tròn cam (giống “Cứu trợ”)
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
