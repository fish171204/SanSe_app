import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tester/src/views/MainNguoiKK.dart';
import 'package:tester/src/views/MainNhaHT.dart';
import 'package:tester/src/views/DangKyNhap.dart';
import 'package:tester/src/views/SharedPreferences.dart';
import 'package:tester/src/views/MyNavigationBar.dart';
import 'package:tester/src/views/XemBaiDangKhoKhanDemo.dart';
import 'package:tester/src/views/notification/noti_emergency.dart';
import 'package:tester/src/viewmodels/notification/notification_viewmodel.dart';
import 'package:tester/src/repositories/impl/notification_repository_impl.dart';
import 'package:tester/src/models/notification/notification_model.dart'
    as model;

class NotiNormal extends StatefulWidget {
  const NotiNormal({super.key});

  @override
  _NotiNormalState createState() => _NotiNormalState();
}

class _NotiNormalState extends State<NotiNormal> {
  int _currentIndex = 2;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NotificationViewModel(NotificationRepositoryImpl())
        ..loadNotifications(),
      child: Consumer<NotificationViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: _buildAppBar(context, viewModel),
            body: _buildBody(context, viewModel),
            bottomNavigationBar: MyNavigationBar(
              currentIndex: _currentIndex,
              onTap: _onTabTapped,
            ),
          );
        },
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context, NotificationViewModel viewModel) {
    int normalCount = viewModel.normalNotificationCount;

    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: GestureDetector(
        onTap: () async {
          // Lấy trạng thái đăng nhập và loại tài khoản
          bool isLoggedIn = await SharedPreferencesHelper.getLoginStatus();
          String? userType = await SharedPreferencesHelper.getUserType();

          // Điều hướng dựa trên loại tài khoản
          if (isLoggedIn && userType == "nguoikhokhan") {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const MainNguoiKK(),
              ),
            );
          } else if (isLoggedIn && userType == "045304004088") {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const MainNguoiKK()),
            );
          } else if (isLoggedIn && userType == "nhahaotam") {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const MainNguoiHT(),
              ),
            );
          } else if (isLoggedIn && userType == "054204003257") {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const MainNguoiHT()),
            );
          } else {
            // Nếu chưa đăng nhập, điều hướng đến màn hình đăng nhập
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const Dangkynhap(),
              ),
            );
          }
        },
        child: const Icon(Icons.arrow_back, color: Colors.black),
      ),
      title: const Text(
        'Thông báo',
        style: TextStyle(color: Colors.black),
      ),
      actions: [
        Stack(
          children: [
            IconButton(
              icon: const Icon(Icons.notifications, color: Colors.black),
              onPressed: () {},
            ),
            if (normalCount > 0)
              Positioned(
                right: 10,
                top: 10,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '$normalCount',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }

  Widget _buildBody(BuildContext context, NotificationViewModel viewModel) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              const Expanded(
                child: Text(
                  'DANH SÁCH HOÀN CẢNH KHÓ KHĂN',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.blue,
                  ),
                ),
              ),
              InkWell(
                onTap: () => _showFilterOptions(context),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xFFAFCEFF),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(30),
                    color: const Color(0xFFE7F0FF),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 8),
                        width: 20,
                        height: 20,
                        child: Image.asset(
                          "assets/images/danhmuc.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                      const Text(
                        "Bộ lọc",
                        style: TextStyle(
                          color: Color(0xFF0866FF),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: _buildNotificationList(context, viewModel),
        ),
      ],
    );
  }

  Widget _buildNotificationList(
      BuildContext context, NotificationViewModel viewModel) {
    if (viewModel.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (viewModel.hasError) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(viewModel.errorMessage),
            ElevatedButton(
              onPressed: () => viewModel.retry(),
              child: const Text('Thử lại'),
            ),
          ],
        ),
      );
    }

    final normalNotifications = viewModel.normalNotifications;
    if (normalNotifications.isEmpty) {
      return const Center(
        child: Text('Không có thông báo nào'),
      );
    }

    return ListView.builder(
      itemCount: normalNotifications.length,
      itemBuilder: (context, index) {
        final notification = normalNotifications[index];
        return NotificationCardWidget(
          notification: notification,
          onTap: () => _handleNotificationTap(context, notification),
        );
      },
    );
  }

  void _showFilterOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const Text(
                    "Bộ lọc",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    leading:
                        const Icon(Icons.notifications, color: Colors.orange),
                    title: const Text("Hoàn cảnh khó khăn thông thường"),
                    trailing: const Icon(Icons.check, color: Colors.blue),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.notification_important,
                        color: Colors.red),
                    title: const Text("Hoàn cảnh khó khăn khẩn cấp"),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NotiEmergency(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  void _handleNotificationTap(
      BuildContext context, model.NotificationCard notification) {
    // Mark as read when tapped
    context.read<NotificationViewModel>().markAsRead(notification.id);

    // Only navigate if the title matches the specific one
    if (notification.title ==
        'Tính mạng mong manh của bé gái 3 tuổi mắc bệnh xơ gan') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const XemBaiDangKhoKhanDemo(),
        ),
      );
    }
  }
}

class NotificationCard extends StatelessWidget {
  final String title;
  final String organization;
  final String amount;
  final String imageAsset;
  final Color color;

  const NotificationCard({
    super.key,
    required this.title,
    required this.organization,
    required this.amount,
    required this.imageAsset,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Only navigate if the title matches the specific one
        if (title == 'Tính mạng mong manh của bé gái 3 tuổi mắc bệnh xơ gan') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  const XemBaiDangKhoKhanDemo(), // Target screen
            ),
          );
        }
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                ),
                image: DecorationImage(
                  image: AssetImage(imageAsset),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Đăng bởi: $organization',
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Số tiền: $amount',
                      style: TextStyle(
                        fontSize: 12,
                        color: color,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationCardWidget extends StatelessWidget {
  final model.NotificationCard notification;
  final VoidCallback? onTap;

  const NotificationCardWidget({
    super.key,
    required this.notification,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        color: notification.isRead ? Colors.grey[100] : Colors.white,
        child: Row(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                ),
                image: DecorationImage(
                  image: AssetImage(notification.imageAsset ??
                      'assets/images/HinhAnh_Demo.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      notification.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: notification.isRead
                            ? Colors.grey[600]
                            : Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Đăng bởi: ${notification.organization ?? 'Không rõ'}',
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Số tiền: ${notification.amount ?? 'Chưa có thông tin'}',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (!notification.isRead) const SizedBox(height: 4),
                    if (!notification.isRead)
                      Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
