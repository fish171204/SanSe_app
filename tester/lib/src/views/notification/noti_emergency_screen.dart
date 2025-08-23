import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tester/src/views/MainNguoiKK.dart';
import 'package:tester/src/views/MainNhaHT.dart';
import 'package:tester/src/views/auth/signup/signup_screen.dart';
import 'package:tester/src/views/SharedPreferences.dart';
import 'package:tester/src/views/MyNavigationBar.dart';
import 'package:tester/src/views/notification/cubit/notification_cubit.dart';
import 'package:tester/src/views/notification/cubit/notification_state.dart';
import 'package:tester/src/views/notification/widgets/notification_app_bar.dart';
import 'package:tester/src/views/notification/widgets/notification_filter_button.dart';
import 'package:tester/src/views/notification/widgets/notification_filter_bottom_sheet.dart';
import 'package:tester/src/views/notification/widgets/notification_list_view.dart';
import 'package:tester/src/repositories/notification/notification_repository.dart';
import 'package:tester/src/models/notification/notification_model.dart'
    as model;

class NotiEmergency extends StatefulWidget {
  const NotiEmergency({super.key});

  @override
  _NotiEmergencyState createState() => _NotiEmergencyState();
}

class _NotiEmergencyState extends State<NotiEmergency> {
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
              isEmergency: true,
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
              notification.type == 'emergency' && !notification.isRead)
          .length;
    }
    return 0;
  }

  Future<void> _handleBackPressed(BuildContext context) async {
    // Similar logic as in noti_normal.dart
    bool isLoggedIn = await SharedPreferencesHelper.getLoginStatus();
    String? userType = await SharedPreferencesHelper.getUserType();

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
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const SignupScreen(),
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
                  'DANH SÁCH HOÀN CẢNH KHẨN CẤP',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.red,
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
            isEmergency: true,
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
          isEmergency: true,
          onNormalSelected: () {
            // Navigate back to normal notifications
            Navigator.pop(context);
          },
        );
      },
    );
  }

  void _handleNotificationTap(
      BuildContext context, model.NotificationCard notification) {
    // Mark as read when tapped
    context.read<NotificationCubit>().markAsRead(notification.id);
  }
}
