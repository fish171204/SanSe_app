import 'dart:math' as math;
import 'package:google_maps_flutter/google_maps_flutter.dart';

/// 1. Model dữ liệu gốc
class MapItem {
  final String id;
  final LatLng position;
  final int value; // Giá trị của label (ví dụ: 1)

  MapItem({required this.id, required this.position, this.value = 1});
}

/// 2. Model đại diện cho 1 nhóm (Cluster)
class Cluster {
  LatLng center;
  List<MapItem> items;
  int totalValue; // Tổng giá trị (label 1 + label 1 = 2)

  Cluster({
    required this.center,
    required this.items,
    required this.totalValue,
  });

  // Tính lại tâm của cluster dựa trên trung bình cộng các điểm con
  void recalculateCenter() {
    double lat = 0, lng = 0;
    for (var item in items) {
      lat += item.position.latitude;
      lng += item.position.longitude;
    }
    center = LatLng(lat / items.length, lng / items.length);
  }
}

/// 3. Helper tính toán khoảng cách và gộp nhóm
class ClusterHelper {
  // Hàm chính: Gộp các điểm dựa trên bán kính (km)
  static List<Cluster> clusterPoints(List<MapItem> items, double radiusKm) {
    List<Cluster> clusters = [];

    for (var item in items) {
      bool added = false;
      for (var cluster in clusters) {
        // Kiểm tra khoảng cách từ điểm mới đến các điểm trong cluster
        if (cluster.items.any(
            (i) => _calculateDistance(i.position, item.position) < radiusKm)) {
          cluster.items.add(item);
          cluster.totalValue += item.value; // Cộng dồn giá trị
          cluster.recalculateCenter();
          added = true;
          break;
        }
      }
      if (!added) {
        clusters.add(Cluster(
          center: item.position,
          items: [item],
          totalValue: item.value,
        ));
      }
    }
    return clusters;
  }

  // Tính khoảng cách giữa 2 điểm theo công thức Haversine (trả về KM)
  static double _calculateDistance(LatLng p1, LatLng p2) {
    const p = 0.017453292519943295; // Math.PI / 180
    final a = 0.5 -
        math.cos((p2.latitude - p1.latitude) * p) / 2 +
        math.cos(p1.latitude * p) *
            math.cos(p2.latitude * p) *
            (1 - math.cos((p2.longitude - p1.longitude) * p)) /
            2;
    return 12742 * math.asin(math.sqrt(a)); // 2 * R; R = 6371 km
  }
}
