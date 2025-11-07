import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? _mapController;
  final _searchCtrl = TextEditingController();

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

  // Demo markers (bạn thay bằng data thật)
  final Set<Marker> _markers = {
    const Marker(
      markerId: MarkerId('demo1'),
      position: LatLng(21.03, 105.85), // Hà Nội
      infoWindow: InfoWindow(title: 'Chiến dịch 90'),
    ),
    const Marker(
      markerId: MarkerId('demo2'),
      position: LatLng(10.78, 106.69), // HCM
      infoWindow: InfoWindow(title: 'Chiến dịch 286'),
    ),
    const Marker(
      markerId: MarkerId('demo3'),
      position: LatLng(16.05, 108.21), // Đà Nẵng
      infoWindow: InfoWindow(title: 'Chiến dịch 61'),
    ),
  };

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
            markers: _markers,
            mapType: MapType.normal,
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

          // TOP controls (search + chips + dropdown)
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Search bar
                  Material(
                    elevation: 2,
                    borderRadius: BorderRadius.circular(24),
                    child: TextField(
                      controller: _searchCtrl,
                      textInputAction: TextInputAction.search,
                      decoration: InputDecoration(
                        hintText: 'Tìm kiếm theo tên chiến dịch, địa điểm',
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
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.08),
                              blurRadius: 6,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
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
