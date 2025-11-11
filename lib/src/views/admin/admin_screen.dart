import 'package:flutter/material.dart';
import 'package:tester/src/views/auth/login/login_screen.dart';
import 'admin_user_management_tab.dart';
import 'admin_post_management_tab.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
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
              iconSize: 30.0,
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
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
        body: const TabBarView(
          children: [
            UserManagementScreen(),
            PostManagementScreen(),
          ],
        ),
      ),
    );
  }
}
