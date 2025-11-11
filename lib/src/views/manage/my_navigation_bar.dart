import 'package:flutter/material.dart';
import 'package:tester/src/views/notification/noti_normal_screen.dart';
import 'package:tester/src/views/user_profile/user_profile_view.dart';
import 'package:tester/src/views/home/home_needy_person.dart';
import 'package:tester/src/views/home/home_benefactor.dart';
import 'package:tester/src/views/auth/login/login_screen.dart';
import 'package:tester/src/views/manage/shared_preferences.dart';
import 'package:tester/src/views/campaign/campaign_list_screen.dart';
import 'package:tester/src/views/video/video_needy_person_screen.dart';

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
        final isLoggedIn = await SharedPreferencesHelper.getLoginStatus();
        final String? userType = await SharedPreferencesHelper.getUserType();

        // Các nhóm userType
        final Set<String> nguoiKhoKhan = {"nguoikhokhan", "045304004088"};

        // Mặc định
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
            case 2: // Reels người khó khăn
              page = const VideoNeedyReelsScreen();
              break;
            case 3: // Thông báo
              page = const NotiNormal();
              break;
            case 4: // Trang cá nhân
              page = const UserProfileView();
              break;
          }
        }

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      items: [
        BottomNavigationBarItem(
          icon:
              Image.asset("assets/images/Tab_Home.png", width: 24, height: 24),
          label: "Trang chủ",
        ),
        BottomNavigationBarItem(
          icon: Image.asset("assets/images/Tab_XuHuong.png",
              width: 24, height: 24),
          label: "Xu hướng",
        ),
        // NEW: Reels ở giữa (thứ 3)
        const BottomNavigationBarItem(
          icon: Icon(Icons.live_tv_outlined, size: 24),
          label: "Reels",
        ),
        const BottomNavigationBarItem(
          icon: Stack(
            children: [
              Icon(Icons.notifications, size: 24, color: Colors.grey),
              Positioned(
                right: 0,
                top: 0,
                child: DecoratedBox(
                  decoration:
                      BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                  child: Padding(
                    padding: EdgeInsets.all(2),
                    child: Text(
                      '7',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
          label: "Thông báo",
        ),
        BottomNavigationBarItem(
          icon: Image.asset("assets/images/Tab_TrangCaNhan.png",
              width: 24, height: 24),
          label: "Tôi",
        ),
      ],
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
    );
  }
}
