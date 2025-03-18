import 'package:flutter/material.dart';
import 'package:tester/src/resources/xemProfile.dart';
import 'package:tester/src/resources/MainNguoiKK.dart';
import 'package:tester/src/resources/MainNhaHT.dart';
import 'package:tester/src/resources/DangKyNhap.dart';
import 'package:tester/src/resources/ThongBao/XemThongBao.dart';
import 'package:tester/src/resources/SharedPreferences.dart';

class MyNavigationBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;

  const MyNavigationBar(
      {super.key, required this.currentIndex, required this.onTap});

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

        // Điều hướng theo người dùng đã đăng nhập
        if (index == 0) {
          if (isLoggedIn && userType == "nguoikhokhan") {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const MainNguoiKK()),
            );
          } else if (isLoggedIn && userType == "045304004088") {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const MainNguoiKK()),
            );
          } else if (isLoggedIn && userType == "nhahaotam") {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const MainNguoiHT()),
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
              MaterialPageRoute(builder: (context) => const Dangkynhap()),
            );
          }
        } else if (index == 3) {
          if (isLoggedIn && userType == "nguoikhokhan") {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Xemprofile()),
            );
          } else if (isLoggedIn && userType == "045304004088") {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Xemprofile()),
            );
          } else if (isLoggedIn && userType == "nhahaotam") {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Xemprofile()),
            );
          } else if (isLoggedIn && userType == "054204003257") {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Xemprofile()),
            );
          }
        } else if (index == 2) {
          if (isLoggedIn && userType == "nguoikhokhan") {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const XemThongBao()),
            );
          } else if (isLoggedIn && userType == "045304004088") {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const XemThongBao()),
            );
          } else if (isLoggedIn && userType == "nhahaotam") {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const XemThongBao()),
            );
          } else if (isLoggedIn && userType == "054204003257") {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const XemThongBao()),
            );
          }
        }
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
                Icons.notifications, // Icon thông báo
                size: 24,
                color: Colors.grey, // Màu mặc định khi không được chọn
              ),
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                    color: Colors.red, // Màu thông báo
                    shape: BoxShape.circle,
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 12,
                    minHeight: 12,
                  ),
                  child: const Text(
                    '7', // Số thông báo
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
