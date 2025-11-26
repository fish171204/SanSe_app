import 'dart:async';
import 'dart:math' as math;
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' hide Cluster;
import 'cluster_utils.dart'; // Import file utils ở trên

class MapController {
  GoogleMapController? _mapController;
  final _searchCtrl = TextEditingController();
  MapType _mapType = MapType.normal;

  static const _vnCenter = LatLng(15.9, 105.8);
  static const CameraPosition _initialCam = CameraPosition(
    target: _vnCenter,
    zoom: 5.6,
  );

  bool _loading = true;

  // --- State Filter UI ---
  final List<String> _tags = ['Xóa nghèo', 'Xóa đói', 'Trẻ em', 'Người'];
  final Set<String> _selectedTags = {'Xóa nghèo'};
  String _campaignType = 'Người khó khăn';

  // Logic Clustering
  double _currentZoom = 5.6;
  List<MapItem> _sourceItems = [];
  Set<Marker> _markers = {};

  // Callback để báo UI update Marker
  final Function(Set<Marker>) onMarkerUpdate;

  // --- THÊM MỚI: Callback khi nhấn vào Cluster/Marker ---
  // Trả về danh sách các MapItem nằm trong cụm đó
  final Function(List<MapItem>)? onClusterTap;

  MapController({
    required this.onMarkerUpdate,
    this.onClusterTap, // Nhận callback từ UI
  });

  // Getters & Setters (Giữ nguyên như cũ)
  TextEditingController get searchController => _searchCtrl;
  MapType get mapType => _mapType;
  CameraPosition get initialCamera => _initialCam;
  bool get loading => _loading;
  Set<Marker> get markers => _markers;
  List<String> get tags => _tags;
  Set<String> get selectedTags => _selectedTags;
  String get campaignType => _campaignType;

  void setMapController(GoogleMapController controller) {
    _mapController = controller;
    _loading = false;
  }

  void setCampaignType(String type) => _campaignType = type;
  void toggleTag(String tag, bool selected) {
    if (selected) {
      _selectedTags.add(tag);
    } else {
      _selectedTags.remove(tag);
    }
  }

  // --- LOGIC QUAN TRỌNG: XỬ LÝ CAMERA MOVE ---
  void onCameraMove(CameraPosition position) {
    // Chỉ tính toán lại nếu zoom thay đổi đáng kể (tránh lag)
    if ((position.zoom - _currentZoom).abs() > 0.5) {
      // [DEBUG LOG] In ra mức zoom hiện tại
      print('--------------------------------------------------');
      print(
          '📷 Camera Move -> New Zoom Level: ${position.zoom.toStringAsFixed(2)}');

      _currentZoom = position.zoom;
      _updateMarkers();
    }
  }

  // Xác định bán kính gộp (km) dựa trên mức zoom
  // Zoom (-) nhỏ -> Bán kính gộp LỚN -> Gom nhiều điểm
  // Zoom (+) lớn -> Bán kính gộp NHỎ -> Tách ra
  double _getClusterRadius(double zoom) {
    if (zoom >= 16.0) return 0.00001; // Rất gần: Hầu như không gộp
    if (zoom >= 15.0) return 0.1;
    if (zoom >= 14.0) return 0.2;
    if (zoom >= 13.0) return 0.5; // Bắt đầu gộp các xã/phường
    if (zoom >= 11.0) return 2.4;
    if (zoom >= 10.0) return 4;
    if (zoom >= 9.0) return 5; // Gộp tỉnh
    return 12; // Zoom xa: Gộp vùng miền
  }

  Future<void> _updateMarkers() async {
    double radiusKm = _getClusterRadius(_currentZoom);

    // [DEBUG LOG] In ra bán kính đang dùng để gộp
    print(
        '🔍 Clustering Radius: $radiusKm km (for Zoom ${_currentZoom.toStringAsFixed(2)})');

    // 1. Gọi hàm gộp điểm
    List<Cluster> clusters =
        ClusterHelper.clusterPoints(_sourceItems, radiusKm);

    // [DEBUG LOG] Kết quả sau khi gộp
    print(
        '📊 Clustering Result: ${_sourceItems.length} Items -> ${clusters.length} Clusters/Markers');

    Set<Marker> newMarkers = {};

    // 2. Tạo Marker từ các Cluster đã gộp
    for (var cluster in clusters) {
      bool isCluster = cluster.items.length > 1;

      // Tính scale icon: Nếu là cluster (nhiều điểm) thì icon to hơn chút
      double scale = isCluster ? 0.85 : 0.75;

      // Vẽ icon hiển thị tổng số (totalValue)
      BitmapDescriptor icon = await createClusterMarker(
        count: cluster.totalValue,
        scale: scale,
        isCluster: isCluster,
      );

      newMarkers.add(Marker(
        markerId: MarkerId(
            "cluster_${cluster.center.latitude}_${cluster.center.longitude}"),
        position: cluster.center,
        icon: icon,
        zIndex: cluster.items.length.toDouble(),
        // --- SỬA ĐỔI SỰ KIỆN ONTAP ---
        onTap: () {
          // Thay vì zoom, ta gọi callback để show Dialog
          if (onClusterTap != null) {
            onClusterTap!(cluster.items);
          }
        },
      ));
    }

    _markers = newMarkers;
    onMarkerUpdate(_markers);
  }

  // --- HÀM TẠO DỮ LIỆU GIẢ LẬP ---
  void loadDemoData() {
    _sourceItems = [
      // Cụm HCM (Sẽ gộp khi zoom xa, tách khi zoom gần)
      MapItem(
          id: '1',
          position: const LatLng(10.762622, 106.660172),
          value: 1), // Q10
      MapItem(
          id: '2',
          position: const LatLng(10.776530, 106.700980),
          value: 1), // Q1
      MapItem(
          id: '3',
          position: const LatLng(10.801466, 106.714232),
          value: 1), // Bình Thạnh
      MapItem(
          id: '4',
          position: const LatLng(10.739290, 106.679260),
          value: 1), // Q7

      // Cụm Hà Nội
      MapItem(id: '5', position: const LatLng(21.028511, 105.804817), value: 1),
      MapItem(id: '6', position: const LatLng(21.003117, 105.820140), value: 1),
      MapItem(id: '8', position: const LatLng(21.003117, 105.821232), value: 1),
      MapItem(id: '9', position: const LatLng(21.003117, 105.825770), value: 1),
      MapItem(
          id: '10', position: const LatLng(21.003117, 105.920140), value: 1),
      MapItem(
          id: '11', position: const LatLng(21.003117, 105.720140), value: 1),
      MapItem(
          id: '12', position: const LatLng(21.003117, 105.620140), value: 1),

      // Cụm Đà Nẵng
      MapItem(id: '7', position: const LatLng(16.0544, 108.2022), value: 1),
    ];
    print('📥 Loaded ${_sourceItems.length} demo items');
    _updateMarkers(); // Chạy lần đầu
  }

  // --- HÀM VẼ ICON ---
  Future<BitmapDescriptor> createClusterMarker({
    required int count,
    required double scale,
    bool isCluster = false,
  }) async {
    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);

    // Load icon (giả lập nếu không có asset)
    ui.Image? iconImage;
    try {
      final ByteData data =
          await rootBundle.load('assets/app/app_map_icon.png');
      final ui.Codec codec = await ui.instantiateImageCodec(
        data.buffer.asUint8List(),
        targetHeight: (60 * scale).toInt(),
      );
      final ui.FrameInfo frame = await codec.getNextFrame();
      iconImage = frame.image;
    } catch (e) {
      // Fallback nếu không có ảnh
    }

    double iconWidth = iconImage?.width.toDouble() ?? 0;
    double iconHeight = iconImage?.height.toDouble() ?? 40;

    // Layout text
    final textPainter = TextPainter(
      text: TextSpan(
        text: '$count',
        style: TextStyle(
          fontSize: 40 * scale,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();

    // Tính kích thước bong bóng
    final double padding = 20 * scale;
    final double width = iconWidth + textPainter.width + (padding * 3);
    final double height =
        math.max(iconHeight, textPainter.height) + (padding * 1.5);
    final double arrowH = 12 * scale;

    // Màu sắc: Cluster màu cam nhạt, Item đơn lẻ màu trắng
    final Paint paint = Paint()
      ..color = isCluster ? Colors.orange.shade100 : Colors.white;

    // Viền: Cluster màu cam đậm, Item đơn lẻ màu xám
    final Paint borderPaint = Paint()
      ..color = isCluster ? Colors.deepOrange : Colors.grey.shade300
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3 * scale;

    final RRect rect =
        RRect.fromLTRBR(0, 0, width, height, Radius.circular(16 * scale));

    canvas.drawRRect(rect, paint);
    canvas.drawRRect(rect, borderPaint);

    // Vẽ mũi tên
    final Path path = Path()
      ..moveTo(width / 2 - 10 * scale, height)
      ..lineTo(width / 2, height + arrowH)
      ..lineTo(width / 2 + 10 * scale, height)
      ..close();
    canvas.drawPath(path, paint);
    canvas.drawPath(path, borderPaint);

    // Vẽ Icon và Text
    if (iconImage != null) {
      canvas.drawImage(
          iconImage, Offset(padding, (height - iconHeight) / 2), Paint());
    }

    textPainter.paint(
      canvas,
      Offset(padding + iconWidth + (iconWidth > 0 ? 10 : 0),
          (height - textPainter.height) / 2),
    );

    final img = await pictureRecorder
        .endRecording()
        .toImage(width.toInt(), (height + arrowH).toInt());
    final byteData = await img.toByteData(format: ui.ImageByteFormat.png);
    return BitmapDescriptor.fromBytes(byteData!.buffer.asUint8List());
  }

  // Các hàm helper khác
  void setMapType(MapType type) => _mapType = type;
  void toggleMapType() =>
      _mapType = (_mapType == MapType.normal) ? MapType.hybrid : MapType.normal;
  Future<void> goToVN() async => await _mapController
      ?.animateCamera(CameraUpdate.newCameraPosition(_initialCam));
  Future<void> zoomIn() async =>
      await _mapController?.animateCamera(CameraUpdate.zoomIn());
  Future<void> zoomOut() async =>
      await _mapController?.animateCamera(CameraUpdate.zoomOut());
  void dispose() => _searchCtrl.dispose();
}
