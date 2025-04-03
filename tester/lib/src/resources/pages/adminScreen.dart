import 'package:flutter/material.dart';
import 'package:tester/src/resources/pages/DangKyNhap.dart';
import 'package:tester/src/resources/pages/adminPostManagementTab.dart';
import 'package:tester/src/resources/pages/adminUserManagementTab.dart';

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
      "avatar": "assets/AnhCV.jpg",
      "lastLoginDate": "2025-04-01",
    },
    {
      "name": "Lê Thị Thúy Kiều",
      "cccd": "045304004088",
      "avatar": "assets/HinhAnh_Demo.jpg",
      "lastLoginDate": "2025-04-01",
    },
    {
      "name": "Nguyễn Văn HH",
      "cccd": "045304004214",
      "avatar": "assets/onghuy.png",
      "lastLoginDate": "2025-03-28",
    },
    {
      "name": "Đinh Thị TT",
      "cccd": "045304004888",
      "avatar": "assets/HinhAnh_Demo1.jpg",
      "lastLoginDate": "2025-03-28",
    },
    {
      "name": "Nguyễn Văn Huy",
      "cccd": "045304004311",
      "avatar": "assets/nguoikhokhan1.jpg",
      "lastLoginDate": "2025-03-05",
    },
    {
      "name": "Nguyễn Thị Hòa",
      "cccd": "045304005132",
      "avatar": "assets/nguoikhokhan2.jpg",
      "lastLoginDate": "2025-03-05",
    },
    {
      "name": "Thái Thị Hoa",
      "cccd": "045304005444",
      "avatar": "assets/nguoikhokhan3.jpg",
      "lastLoginDate": "2025-03-02",
    },
    {
      "name": "Lại Tiến Dũng",
      "cccd": "045304005326",
      "avatar": "assets/nguoikhokhan4.jpg",
      "lastLoginDate": "2025-03-02",
    },
    {
      "name": "Trần Văn Kiên",
      "cccd": "045304004888",
      "avatar": "assets/nguoikhokhan5.jpg",
      "lastLoginDate": "2025-03-01",
    },
    {
      "name": "Nguyễn Thanh Trường",
      "cccd": "045304004005",
      "avatar": "assets/nguoikhokhan6.jpg",
      "lastLoginDate": "2025-02-28",
    },
  ];

  // Function to delete a user
  void _deleteUser(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Xác nhận xóa"),
        content: Text("Bạn có chắc muốn xóa ${users[index]['name']} không?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Hủy"),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                users.removeAt(index);
              });
              Navigator.pop(context);
              Future.delayed(const Duration(milliseconds: 300), () {
                _showSuccessDialog();
              });
            },
            child: const Text("Xóa", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: const Icon(
            Icons.check_circle_outline,
            color: Colors.green,
            size: 50,
          ),
          content: const Text(
            "Xóa người dùng thành công!",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                "OK",
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        );
      },
    );
  }

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
            child: Image.asset("assets/logo.png"),
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
                  MaterialPageRoute(builder: (context) => const Dangkynhap()),
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
