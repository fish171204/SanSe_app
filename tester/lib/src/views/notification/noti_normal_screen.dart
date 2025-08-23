import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tester/src/views/MainNguoiKK.dart';
import 'package:tester/src/views/MainNhaHT.dart';
import 'package:tester/src/views/DangKyNhap.dart';
import 'package:tester/src/views/SharedPreferences.dart';
import 'package:tester/src/views/MyNavigationBar.dart';
import 'package:tester/src/views/XemBaiDangKhoKhanDemo.dart';
import 'package:tester/src/views/notification/cubit/notification_cubit.dart';
import 'package:tester/src/views/notification/cubit/notification_state.dart';
import 'package:tester/src/views/notification/widgets/notification_app_bar.dart';
import 'package:tester/src/views/notification/widgets/notification_filter_button.dart';
import 'package:tester/src/views/notification/widgets/notification_filter_bottom_sheet.dart';
import 'package:tester/src/views/notification/widgets/notification_list_view.dart';
import 'package:tester/src/repositories/notification/notification_repository.dart';
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
    return BlocProvider(
      create: (context) =>
          NotificationCubit(NotificationRepositoryImpl())..loadNotifications(),
      child: BlocBuilder<NotificationCubit, NotificationState>(
        builder: (context, state) {
          return Scaffold(
            appBar: NotificationAppBar(
              notificationCount: _getNotificationCount(state),
              onBackPressed: () => _handleBackPressed(context),
              isEmergency: false,
            ),
            body: _buildBody(context),
            bottomNavigationBar: MyNavigationBar(
              currentIndex: _currentIndex,
              onTap: _onTabTapped,
            ),
          );
        },
      ),
    );
  }

  int _getNotificationCount(NotificationState state) {
    if (state is NotificationLoaded) {
      return state.filteredNotifications
          .where((notification) =>
              notification.type == 'normal' && !notification.isRead)
          .length;
    }
    return 0;
  }

  Future<void> _handleBackPressed(BuildContext context) async {
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
  }

  Widget _buildBody(BuildContext context) {
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
              NotificationFilterButton(
                onTap: () => _showFilterOptions(context),
              ),
            ],
          ),
        ),
        Expanded(
          child: NotificationListView(
            isEmergency: false,
            onNotificationTap: (notification) =>
                _handleNotificationTap(context, notification),
          ),
        ),
      ],
    );
  }

  void _showFilterOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        return NotificationFilterBottomSheet(
          isEmergency: false,
          onEmergencySelected: () {
            // Navigate to emergency notifications
            Navigator.pushNamed(context, '/notifications/emergency');
          },
        );
      },
    );
  }

  void _handleNotificationTap(
      BuildContext context, model.NotificationCard notification) {
    // Mark as read when tapped
    context.read<NotificationCubit>().markAsRead(notification.id);

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
