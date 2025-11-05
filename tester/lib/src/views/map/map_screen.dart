import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tester/src/config/environment.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? _mapController;
  bool _isLoading = true;

  // Vị trí mặc định (Hồ Chí Minh)
  static const CameraPosition _initialPosition = CameraPosition(
    target: LatLng(10.8231, 106.6297),
    zoom: 14.0,
  );

  // Set of markers cho người khó khăn
  final Set<Marker> _markers = {
    const Marker(
      markerId: MarkerId('person1'),
      position: LatLng(10.8231, 106.6297),
      infoWindow: InfoWindow(
        title: 'Gia đình Nguyễn Văn A',
        snippet: 'Cần hỗ trợ lương thực, thực phẩm',
      ),
    ),
    const Marker(
      markerId: MarkerId('person2'),
      position: LatLng(10.8331, 106.6397),
      infoWindow: InfoWindow(
        title: 'Bà Trần Thị B',
        snippet: 'Cần hỗ trợ y tế, thuốc men',
      ),
    ),
    const Marker(
      markerId: MarkerId('person3'),
      position: LatLng(10.8131, 106.6197),
      infoWindow: InfoWindow(
        title: 'Ông Lê Văn C',
        snippet: 'Cần hỗ trợ sửa chữa nhà cửa',
      ),
    ),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bản đồ người khó khăn'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: _initialPosition,
            onMapCreated: (GoogleMapController controller) {
              _mapController = controller;
              setState(() {
                _isLoading = false;
              });
            },
            markers: _markers,
            mapType: MapType.normal,
            myLocationEnabled: false,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: true,
            compassEnabled: true,
            rotateGesturesEnabled: true,
            scrollGesturesEnabled: true,
            tiltGesturesEnabled: true,
            zoomGesturesEnabled: true,
          ),
          if (_isLoading)
            Container(
              color: Colors.white,
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 16),
                    Text('Đang tải bản đồ...'),
                  ],
                ),
              ),
            ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "zoom_in",
            onPressed: () {
              _mapController?.animateCamera(CameraUpdate.zoomIn());
            },
            child: const Icon(Icons.zoom_in),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: "zoom_out",
            onPressed: () {
              _mapController?.animateCamera(CameraUpdate.zoomOut());
            },
            child: const Icon(Icons.zoom_out),
          ),
        ],
      ),
    );
  }
}
