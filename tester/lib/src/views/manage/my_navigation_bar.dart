import 'package:flutter/material.dart';
import 'package:tester/src/views/notification/noti_normal_screen.dart';
import 'package:tester/src/views/user_profile/user_profile_view.dart';
import 'package:tester/src/views/home/home_needy_person.dart';
import 'package:tester/src/views/home/home_benefactor.dart';
import 'package:tester/src/views/auth/login/login_screen.dart';
import 'package:tester/src/views/manage/shared_preferences.dart';
import 'package:tester/src/views/campaign/campaign_list_screen.dart';

class MyNavigationBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;

  const MyNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.currentIndex,
      onTap: (index) async {
        widget.onTap(index);

        // Kiểm tra trạng thái đăng nhập
        bool isLoggedIn = await SharedPreferencesHelper.getLoginStatus();
        String? userType = await SharedPreferencesHelper.getUserType();

        // Các nhóm userType
        final Set<String> nguoiKhoKhan = {"nguoikhokhan", "045304004088"};

        // Điều hướng theo tab
        Widget page = const LoginScreen();

        if (isLoggedIn) {
          switch (index) {
            case 0: // Trang chủ
              page = nguoiKhoKhan.contains(userType)
                  ? const MainNguoiKK()
                  : const MainNguoiHT();
              break;
            case 1: // Xu hướng (Chiến dịch)
              page = const CampaignListScreen();
              break;
            case 2: // Thông báo
              page = const NotiNormal();
              break;
            case 3: // Trang cá nhân
              page = const UserProfileView();
              break;
          }
        }

        // Chuyển trang
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      items: [
        BottomNavigationBarItem(
          icon: Image.asset(
            "assets/images/Tab_Home.png",
            width: 24,
            height: 24,
          ),
          label: "Trang chủ",
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            "assets/images/Tab_XuHuong.png",
            width: 24,
            height: 24,
          ),
          label: "Xu hướng",
        ),
        BottomNavigationBarItem(
          icon: Stack(
            children: [
              const Icon(
                Icons.notifications,
                size: 24,
                color: Colors.grey,
              ),
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 12,
                    minHeight: 12,
                  ),
                  child: const Text(
                    '7',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
          label: "Thông báo",
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            "assets/images/Tab_TrangCaNhan.png",
            width: 24,
            height: 24,
          ),
          label: "Trang cá nhân",
        ),
      ],
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
    );
  }
}
