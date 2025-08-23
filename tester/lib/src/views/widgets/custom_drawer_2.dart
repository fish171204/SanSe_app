import 'package:flutter/material.dart';
import 'package:tester/src/views/auth/login/login_screen.dart';
import 'package:tester/src/views/accesstrade/ac_affiliate_markteting.dart';

class CustomDrawer02 extends StatelessWidget {
  const CustomDrawer02({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          _buildHeader(), // Thêm phần avatar + email
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildItemRow(
                    context, Icons.volunteer_activism, "Từ thiện trực tiếp"),
                _buildItemRow(context, Icons.category, "Từ thiện chủ đề"),
                _buildItemRow(context, Icons.warning, "Từ thiện khẩn cấp"),
                _buildItemRow(
                  context,
                  Icons.shopping_cart,
                  "Mua hàng doanh nghiệp từ thiện",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const affiliateMarkteting()),
                    );
                  },
                ),
              ],
            ),
          ),
          const Divider(),
          _buildBottomActions(context), // Đẩy Cài đặt & Đăng xuất xuống dưới
        ],
      ),
    );
  }

  /// Phần Header Avatar + Email
  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
      decoration: const BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage("assets/images/HinhAnh_Demo.jpg"),
          ),
          const SizedBox(height: 10),
          const Text(
            "Lê Thị Thuý Kiều",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          const SizedBox(height: 5),
          Text(
            "Người dùng không có Email",
            style: TextStyle(color: Colors.white.withOpacity(0.8)),
          ),
        ],
      ),
    );
  }

  /// Tạo Item trong Menu (Dùng Icon thay vì ảnh)
  Widget _buildItemRow(BuildContext context, IconData icon, String title,
      {Color color = Colors.black, VoidCallback? onTap}) {
    return ListTile(
      leading: Icon(icon, size: 30, color: color),
      title: Text(title, style: TextStyle(color: color)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        if (onTap != null) {
          onTap();
        }
      },
    );
  }

  /// Phần Cài đặt & Đăng xuất (Đẩy xuống dưới cùng)
  Widget _buildBottomActions(BuildContext context) {
    return Column(
      children: [
        _buildItemRow(context, Icons.settings, "Cài đặt"),
        _buildItemRow(
          context,
          Icons.logout,
          "Đăng xuất",
          color: Colors.red,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
            );
          },
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
