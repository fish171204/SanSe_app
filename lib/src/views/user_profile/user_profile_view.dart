import 'package:flutter/material.dart';
import 'package:tester/src/views/auth/login/login_screen.dart';
import 'package:tester/src/views/manage/shared_preferences.dart';
import 'package:tester/src/views/user_profile/user_history_campaign_screen.dart';
import 'package:tester/src/views/user_profile/user_profile_update.dart';

class UserProfileView extends StatefulWidget {
  const UserProfileView({super.key});

  @override
  _UserProfileViewState createState() => _UserProfileViewState();
}

class _UserProfileViewState extends State<UserProfileView> {
  final Color primaryColor = const Color(0xFF0288D1);
  final Color backgroundColor = const Color(0xFFF5F7FA);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            const SizedBox(height: 20),
            _buildMenuSection(context),
            const SizedBox(height: 10),
            _buildLogoutButton(context),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  // --- 1. HEADER (Avatar + Info + Edit Button) ---
  Widget _buildHeader() {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        // Background Blue Curve
        Container(
          height: 220,
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
        ),
        // Title
        const Positioned(
          top: 2,
          child: Text(
            "Hồ sơ cá nhân",
            style: TextStyle(
              color: Color(0xFF0288D1),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        // Profile Card Container
        Container(
          margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 15,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            children: [
              // Avatar
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 4),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    )
                  ],
                ),
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey[200],
                  backgroundImage: const AssetImage("assets/images/AnhCV.jpg"),
                ),
              ),
              const SizedBox(height: 12),
              // Name (Giả sử lấy từ API hoặc SharedPref)
              const Text(
                "Dang Khoa Nguyen",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF333333),
                ),
              ),
              const SizedBox(height: 4),
              // Phone
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.phone_iphone, size: 16, color: Colors.grey[600]),
                  const SizedBox(width: 4),
                  Text(
                    "0393416574",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Edit Profile Button
              SizedBox(
                width: 160,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const UserProfileUpdate()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    "Chỉnh sửa hồ sơ",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // --- 2. MENU LIST ---
  Widget _buildMenuSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          // Mục riêng lẻ: Hành trình nhân ái
          ProfileMenuItem(
            icon: Icons.volunteer_activism,
            iconColor: Colors.redAccent,
            title: "Hành trình nhân ái",
            subtitle: "Lịch sử giúp đỡ & Quyên góp",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HistoryCampaignScreen(),
                ),
              );
            },
          ),
          const SizedBox(height: 16),

          // Nhóm Menu
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                ProfileMenuItem(
                  icon: Icons.info_outline_rounded,
                  iconColor: Colors.blueAccent,
                  title: "Về San Sẻ",
                  isGrouped: true,
                  showDivider: true,
                  onTap: () {},
                ),
                // --- MỤC MỚI THÊM VÀO ĐÂY ---
                ProfileMenuItem(
                  icon: Icons.menu_book_rounded, // Icon sách hướng dẫn
                  iconColor: Colors.green, // Màu xanh lá
                  title: "Hướng dẫn sử dụng",
                  isGrouped: true,
                  showDivider: true,
                  onTap: () {
                    // TODO: Điều hướng tới trang hướng dẫn
                  },
                ),
                // -----------------------------
                ProfileMenuItem(
                  icon: Icons.help_outline_rounded,
                  iconColor: Colors.orangeAccent,
                  title: "Trung tâm hỗ trợ",
                  isGrouped: true,
                  showDivider: true,
                  onTap: () {},
                ),
                ProfileMenuItem(
                  icon: Icons.settings_outlined,
                  iconColor: Colors.grey,
                  title: "Cài đặt",
                  isGrouped: true,
                  showDivider: false,
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // --- 3. LOGOUT BUTTON ---
  Widget _buildLogoutButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextButton(
        onPressed: () async {
          bool isLoggedIn = await SharedPreferencesHelper.getLoginStatus();
          String? userType = await SharedPreferencesHelper.getUserType();

          if (!context.mounted) return;

          if (isLoggedIn && userType == "nguoikhokhan") {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (_) => const LoginScreen()));
          } else if (isLoggedIn && userType == "045304004088") {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (_) => const LoginScreen()));
          } else if (isLoggedIn && userType == "nhahaotam") {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (_) => const LoginScreen()));
          } else if (isLoggedIn && userType == "054204003257") {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (_) => const LoginScreen()));
          } else {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (_) => const LoginScreen()));
          }
        },
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 15),
          backgroundColor: const Color(0xFFFFEBEE),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.logout, color: Colors.red),
            SizedBox(width: 8),
            Text(
              "Đăng xuất",
              style: TextStyle(
                color: Colors.red,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// --- WIDGET TÁI SỬ DỤNG CHO MENU ITEM ---
class ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String? subtitle;
  final VoidCallback onTap;
  final bool isGrouped;
  final bool showDivider;

  const ProfileMenuItem({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.onTap,
    this.subtitle,
    this.isGrouped = false,
    this.showDivider = false,
  });

  @override
  Widget build(BuildContext context) {
    Widget content = Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: isGrouped ? null : BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: iconColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: iconColor, size: 22),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF333333),
                      ),
                    ),
                    if (subtitle != null) ...[
                      const SizedBox(height: 2),
                      Text(
                        subtitle!,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[500],
                        ),
                      ),
                    ]
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            ],
          ),
        ),
      ),
    );

    if (isGrouped) {
      return Column(
        children: [
          content,
          if (showDivider)
            const Divider(
                height: 1, indent: 60, endIndent: 20, color: Color(0xFFEEEEEE)),
        ],
      );
    } else {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: content,
      );
    }
  }
}
