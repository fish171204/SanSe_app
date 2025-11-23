// File: src/views/manage/my_navigation_bar.dart

import 'package:flutter/material.dart';

class MyNavigationBar extends StatelessWidget {
  // Đổi thành Stateless cho nhẹ
  final int currentIndex;
  final Function(int) onTap;

  const MyNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap, // Chỉ gọi callback, không xử lý logic ở đây
      items: [
        BottomNavigationBarItem(
          icon: Image.asset("assets/images/Tab_Home.png",
              width: 24,
              height: 24,
              errorBuilder: (c, o, s) => const Icon(
                  Icons.home)), // Thêm errorBuilder đề phòng thiếu ảnh
          label: "Trang chủ",
        ),
        BottomNavigationBarItem(
          icon: Image.asset("assets/images/Tab_XuHuong.png",
              width: 24,
              height: 24,
              errorBuilder: (c, o, s) => const Icon(Icons.trending_up)),
          label: "Xu hướng",
        ),
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
              width: 24,
              height: 24,
              errorBuilder: (c, o, s) => const Icon(Icons.person)),
          label: "Tôi",
        ),
      ],
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
    );
  }
}
