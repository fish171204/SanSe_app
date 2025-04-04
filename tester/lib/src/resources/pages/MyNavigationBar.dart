import 'package:flutter/material.dart';
import 'package:tester/src/resources/pages/xemProfile.dart';
import 'package:tester/src/resources/pages/MainNguoiKK.dart';
import 'package:tester/src/resources/pages/MainNhaHT.dart';
import 'package:tester/src/resources/pages/DangKyNhap.dart';
import 'package:tester/src/resources/ThongBao/XemThongBao.dart';
import 'package:tester/src/resources/pages/SharedPreferences.dart';
import 'package:tester/src/resources/pages/CampaignListScreen.dart';

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
        final Set<String> nhaHaoTam = {"nhahaotam", "054204003257"};

        // Điều hướng theo tab
        Widget page =
            const Dangkynhap(); // Mặc định là trang đăng nhập nếu chưa đăng nhập

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
              page = const XemThongBao();
              break;
            case 3: // Trang cá nhân
              page = const Xemprofile();
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
            "assets/Tab_Home.png",
            width: 24,
            height: 24,
          ),
          label: "Trang chủ",
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            "assets/Tab_XuHuong.png",
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
            "assets/Tab_TrangCaNhan.png",
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
