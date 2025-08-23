import 'package:flutter/material.dart';
import 'package:tester/src/views/auth/signup/signup_screen.dart';
import 'package:tester/src/views/admin/admin_post_management_tab.dart';
import 'package:tester/src/views/admin/admin_user_management_tab.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  List<Map<String, dynamic>> users = [
    {
      "name": "Nguyễn Đăng Khoa",
      "cccd": "054204003257",
      "avatar": "assets/images/AnhCV.jpg",
      "lastLoginDate": "2025-04-01",
    },
    {
      "name": "Lê Thị Thúy Kiều",
      "cccd": "045304004088",
      "avatar": "assets/images/HinhAnh_Demo.jpg",
      "lastLoginDate": "2025-04-01",
    },
    {
      "name": "Nguyễn Văn HH",
      "cccd": "045304004214",
      "avatar": "assets/images/onghuy.png",
      "lastLoginDate": "2025-03-28",
    },
    {
      "name": "Đinh Thị TT",
      "cccd": "045304004888",
      "avatar": "assets/images/HinhAnh_Demo1.jpg",
      "lastLoginDate": "2025-03-28",
    },
    {
      "name": "Nguyễn Văn Huy",
      "cccd": "045304004311",
      "avatar": "assets/images/nguoikhokhan1.jpg",
      "lastLoginDate": "2025-03-05",
    },
    {
      "name": "Nguyễn Thị Hòa",
      "cccd": "045304005132",
      "avatar": "assets/images/nguoikhokhan2.jpg",
      "lastLoginDate": "2025-03-05",
    },
    {
      "name": "Thái Thị Hoa",
      "cccd": "045304005444",
      "avatar": "assets/images/nguoikhokhan3.jpg",
      "lastLoginDate": "2025-03-02",
    },
    {
      "name": "Lại Tiến Dũng",
      "cccd": "045304005326",
      "avatar": "assets/images/nguoikhokhan4.jpg",
      "lastLoginDate": "2025-03-02",
    },
    {
      "name": "Trần Văn Kiên",
      "cccd": "045304004888",
      "avatar": "assets/images/nguoikhokhan5.jpg",
      "lastLoginDate": "2025-03-01",
    },
    {
      "name": "Nguyễn Thanh Trường",
      "cccd": "045304004005",
      "avatar": "assets/images/nguoikhokhan6.jpg",
      "lastLoginDate": "2025-02-28",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Quản lý hệ thống San Sẻ",
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          leading: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Image.asset("assets/images/logo.png"),
          ),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              icon: const Icon(Icons.exit_to_app, color: Colors.white),
              iconSize: 30.0, // Điều chỉnh kích thước của icon
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const SignupScreen()),
                );
              },
            ),
          ],
          bottom: const TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(icon: Icon(Icons.people), text: "Người dùng"),
              Tab(icon: Icon(Icons.article), text: "Bài đăng"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            UserManagementTab(users: users),
            const PostManagementTab(),
          ],
        ),
      ),
    );
  }
}
