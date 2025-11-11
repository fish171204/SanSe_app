import '../../models/notification/notification_model.dart';

abstract class NotificationRepository {
  Future<List<NotificationCard>> getNotifications();
  Future<void> markAsRead(String notificationId);
  Future<void> deleteNotification(String notificationId);
  Future<void> markAllAsRead();
}

class NotificationRepositoryImpl implements NotificationRepository {
  @override
  Future<List<NotificationCard>> getNotifications() async {
    // Simulate API call delay
    await Future.delayed(const Duration(milliseconds: 500));

    // Return mock data - replace with actual API call
    return _generateMockNotifications();
  }

  @override
  Future<void> markAsRead(String notificationId) async {
    // Simulate API call
    await Future.delayed(const Duration(milliseconds: 200));
  }

  @override
  Future<void> deleteNotification(String notificationId) async {
    // Simulate API call
    await Future.delayed(const Duration(milliseconds: 200));
  }

  @override
  Future<void> markAllAsRead() async {
    // Simulate API call
    await Future.delayed(const Duration(milliseconds: 300));
  }

  List<NotificationCard> _generateMockNotifications() {
    final now = DateTime.now();
    return [
      // Emergency notifications
      NotificationCard(
        id: '1',
        title: '3 cha con sống trong căn nhà 2m2, cơm ăn bữa đói bữa no',
        message: 'Trường hợp khẩn cấp cần hỗ trợ ngay lập tức',
        type: 'emergency',
        timestamp: now.subtract(const Duration(hours: 1)),
        isRead: false,
        organization: 'Quỹ Cứu Trợ Người ...',
        amount: '10.000.000 VND',
        imageAsset: 'assets/images/HinhAnh_0.png',
      ),
      NotificationCard(
        id: '2',
        title:
            'Cụ bà 90 tuổi bị 4 con bỏ rơi, tự bò ngoài đường bắt xe đi khám bệnh',
        message: 'Trường hợp khẩn cấp cần hỗ trợ ngay lập tức',
        type: 'emergency',
        timestamp: now.subtract(const Duration(hours: 2)),
        isRead: false,
        organization: 'Quỹ Thiện Tâm',
        amount: '3.000.000 VND',
        imageAsset: 'assets/images/HinhAnh1.png',
      ),
      // Normal notifications
      NotificationCard(
        id: '3',
        title: 'Tính mạng mong manh của bé gái 3 tuổi mắc bệnh xơ gan',
        message: 'Hoàn cảnh khó khăn cần hỗ trợ',
        type: 'normal',
        timestamp: now.subtract(const Duration(hours: 3)),
        isRead: false,
        organization: 'Lê Thị Thuý Kiều',
        amount: '5.000.000 VND',
        imageAsset: 'assets/images/HinhAnh_Demo.jpg',
      ),
      NotificationCard(
        id: '4',
        title:
            'Cụ bà 90 tuổi bị 4 con bỏ rơi, tự bò ngoài đường bắt xe đi khám bệnh',
        message: 'Hoàn cảnh khó khăn cần hỗ trợ',
        type: 'normal',
        timestamp: now.subtract(const Duration(hours: 4)),
        isRead: true,
        organization: 'Quỹ Thiện Tâm',
        amount: '3.000.000 VND',
        imageAsset: 'assets/images/nguoikhokhan8.jpg',
      ),
      NotificationCard(
        id: '5',
        title: '3 cha con sống trong căn nhà 2m2, cơm ăn bữa đói bữa no',
        message: 'Hoàn cảnh khó khăn cần hỗ trợ',
        type: 'normal',
        timestamp: now.subtract(const Duration(hours: 5)),
        isRead: false,
        organization: 'Nguyễn Văn Huy',
        amount: '10.000.000 VND',
        imageAsset: 'assets/images/HinhAnh_0.png',
      ),
      NotificationCard(
        id: '6',
        title:
            'Mẹ già 80 tuổi còng lưng chăm con trai suy thận, con gái mắc bệnh ung thư',
        message: 'Hoàn cảnh khó khăn cần hỗ trợ',
        type: 'normal',
        timestamp: now.subtract(const Duration(days: 1)),
        isRead: false,
        organization: 'Trương Anh Vịnh',
        amount: '60.000.000 VND',
        imageAsset: 'assets/images/nguoikhokhan9.jpg',
      ),
      NotificationCard(
        id: '7',
        title: 'Dự Án Xây Cầu Tại Xã Rạch Chèo; huyện Phú Tân; Tỉnh Cà Mau',
        message: 'Hoàn cảnh khó khăn cần hỗ trợ',
        type: 'normal',
        timestamp: now.subtract(const Duration(days: 1)),
        isRead: false,
        organization: 'Trường Thành',
        amount: '500.000.000 VND',
        imageAsset: 'assets/images/chiendich5.jpg',
      ),
      NotificationCard(
        id: '8',
        title:
            'Lời khẩn cầu của một người mẹ tìm liều thuốc mắc nhất thế giới để cứu mạng con trai!',
        message: 'Hoàn cảnh khó khăn cần hỗ trợ',
        type: 'normal',
        timestamp: now.subtract(const Duration(days: 2)),
        isRead: true,
        organization: 'Quynh Thai',
        amount: '40.000.000.000 VND',
        imageAsset: 'assets/images/chiendich8.jpg',
      ),
      NotificationCard(
        id: '9',
        title:
            'Dự Án Hiện Thực Hoá Ước Mơ Nhà GĐ Phạm Văn Hiệu huyện Ba Tơ Quảng Ngãi vs GĐ Đỗ Văn Minh',
        message: 'Hoàn cảnh khó khăn cần hỗ trợ',
        type: 'normal',
        timestamp: now.subtract(const Duration(days: 2)),
        isRead: false,
        organization: 'Cộng đồng kết nối hạ tầngtầng',
        amount: '100.000.000 VND',
        imageAsset: 'assets/images/chiendich7.jpg',
      ),
    ];
  }
}
