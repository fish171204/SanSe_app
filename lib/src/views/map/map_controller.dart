import 'dart:async';
import 'dart:math' as math;
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController {
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

  // Markers
  Set<Marker> _markers = {};

  // Getters
  TextEditingController get searchController => _searchCtrl;
  MapType get mapType => _mapType;
  CameraPosition get initialCamera => _initialCam;
  bool get loading => _loading;
  List<String> get tags => _tags;
  Set<String> get selectedTags => _selectedTags;
  String get campaignType => _campaignType;
  Set<Marker> get markers => _markers;
  GoogleMapController? get mapController => _mapController;

  // Setters
  void setMapController(GoogleMapController controller) {
    _mapController = controller;
    _loading = false;
  }

  void setMapType(MapType type) {
    _mapType = type;
  }

  void setCampaignType(String type) {
    _campaignType = type;
  }

  void toggleMapType() {
    _mapType =
        (_mapType == MapType.normal) ? MapType.satellite : MapType.normal;
  }

  void toggleTag(String tag, bool selected) {
    if (selected) {
      _selectedTags.add(tag);
    } else {
      _selectedTags.remove(tag);
    }
  }

  void updateMarkers(Set<Marker> newMarkers) {
    _markers = newMarkers;
  }

  /// Hàm này tạo ra các icon cluster demo và cập nhật bản đồ
  Future<Set<Marker>> buildDemoMarkers() async {
    try {
      // 1. "Vẽ" 3 icon cluster cũ (số lượng lớn)
      final clusterIcon175 = await createClusterMarker(
        count: 10,
        scale: 0.75,
      );
      final clusterIcon43 = await createClusterMarker(
        count: 6,
        scale: 0.75,
      );
      final clusterIcon288 = await createClusterMarker(
        count: 4,
        scale: 0.75,
      );

      // 2. "Vẽ" các icon cluster mới (số lượng nhỏ 1, 2, 3)
      final clusterIcon1 = await createClusterMarker(count: 1, scale: 0.75);
      final clusterIcon2 = await createClusterMarker(count: 2, scale: 0.75);
      final clusterIcon3 = await createClusterMarker(count: 3, scale: 0.75);

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

      // 5. Return tất cả markers
      return {
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
    } catch (e) {
      // Nếu có bất kỳ lỗi nào (ví dụ: không tìm thấy asset), nó sẽ in ở đây
      print('!!! LỖI KHI TẠO MARKER: $e');
      return {};
    }
  }

  // HÀM VẼ CỦA BẠN (ĐÃ ĐƯỢC CẬP NHẬT ĐỂ TỰ ĐỘNG GIẢM CHIỀU RỘNG)
  Future<BitmapDescriptor> createClusterMarker({
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

  Future<void> goToVN() async {
    await _mapController?.animateCamera(
      CameraUpdate.newCameraPosition(_initialCam),
    );
  }

  Future<void> zoomIn() async {
    await _mapController?.animateCamera(
      CameraUpdate.zoomIn(),
    );
  }

  Future<void> zoomOut() async {
    await _mapController?.animateCamera(
      CameraUpdate.zoomOut(),
    );
  }

  void dispose() {
    _searchCtrl.dispose();
  }
}
