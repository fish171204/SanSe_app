import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tester/src/views/auth/login/login_screen.dart';
import 'package:tester/src/views/manage/shared_preferences.dart';
import 'package:tester/src/views/user_profile/user_history_campaign_screen.dart';
import 'package:tester/src/views/user_profile/user_profile_update.dart';

enum DonationRank {
  bronze("Người Bạn Đồng Hành", Color(0xFFCD7F32), 0),
  silver("Tấm Lòng Vàng", Color(0xFF9E9E9E), 10000000),
  gold("Quý Ông Thiện Nguyện", Color(0xFFFFD700), 50000000),
  platinum("Đại Sứ Nhân Ái", Color(0xFFE5E4E2), 200000000),
  diamond("Trái Tim Kim Cương", Color(0xFF00BFFF), 500000000);

  final String title;
  final Color color;
  final double minAmount;

  const DonationRank(this.title, this.color, this.minAmount);
}

class MapCampaignModel {
  final String raisedAmount;
  final double progress;
  late final String userDonatedAmount;

  MapCampaignModel({
    required this.raisedAmount,
    required this.progress,
  }) {
    userDonatedAmount = _calculateUserDonation(raisedAmount, progress);
  }

  String _calculateUserDonation(
      String raisedAmountStr, double progressPercent) {
    try {
      String cleanAmount =
          raisedAmountStr.replaceAll('.', '').replaceAll('đ', '').trim();
      double totalAmount = double.parse(cleanAmount);
      double donatedValue = totalAmount * (progressPercent / 100);
      final currencyFormatter = NumberFormat('#,###', 'vi_VN');
      return "${currencyFormatter.format(donatedValue)} đ";
    } catch (e) {
      return "0 đ";
    }
  }
}

class UserProfileView extends StatefulWidget {
  const UserProfileView({super.key});

  @override
  _UserProfileViewState createState() => _UserProfileViewState();
}

class _UserProfileViewState extends State<UserProfileView> {
  final Color primaryColor = const Color(0xFF0288D1);
  final Color backgroundColor = const Color(0xFFF5F7FA);

  // --- DỮ LIỆU GIẢ LẬP ĐỂ TÍNH DANH HIỆU (Copy từ màn hình History) ---
  // Trong thực tế, bạn nên lưu tổng tiền vào SharedPreferences hoặc API để không phải tính lại ở mỗi màn hình
  final List<MapCampaignModel> allDonations = [
    MapCampaignModel(raisedAmount: '5.000.000 đ', progress: 100.0),
    MapCampaignModel(raisedAmount: '15.500.000 đ', progress: 19.3),
    MapCampaignModel(raisedAmount: '18.000.000 đ', progress: 72.0),
    MapCampaignModel(raisedAmount: '4.200.000 đ', progress: 84.0),
    MapCampaignModel(raisedAmount: '2.000.000 đ', progress: 10.0),
    MapCampaignModel(raisedAmount: '8.500.000 đ', progress: 75.0),
    MapCampaignModel(raisedAmount: '20.000.000 đ', progress: 60.0),
    MapCampaignModel(raisedAmount: '12.500.000 đ', progress: 31.2),
    MapCampaignModel(raisedAmount: '20.000.000 đ', progress: 20.0),
    MapCampaignModel(raisedAmount: '20.000.000 đ', progress: 20.0),
    MapCampaignModel(raisedAmount: '10.000.000 đ', progress: 10.0),
    MapCampaignModel(raisedAmount: '40.000.000 đ', progress: 5.0),
  ];

  double _calculateTotalLifetimeDonation() {
    double total = 0;
    for (var item in allDonations) {
      if (item.userDonatedAmount.isNotEmpty) {
        String cleanAmount = item.userDonatedAmount
            .replaceAll('.', '')
            .replaceAll(' đ', '')
            .trim();
        total += double.tryParse(cleanAmount) ?? 0;
      }
    }
    return total;
  }

  DonationRank _calculateRank(double totalAmount) {
    if (totalAmount >= DonationRank.diamond.minAmount)
      return DonationRank.diamond;
    if (totalAmount >= DonationRank.platinum.minAmount)
      return DonationRank.platinum;
    if (totalAmount >= DonationRank.gold.minAmount) return DonationRank.gold;
    if (totalAmount >= DonationRank.silver.minAmount)
      return DonationRank.silver;
    return DonationRank.bronze;
  }

  @override
  Widget build(BuildContext context) {
    // Tính toán danh hiệu hiện tại
    final totalLifetime = _calculateTotalLifetimeDonation();
    final currentRank = _calculateRank(totalLifetime);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(currentRank), // Truyền rank vào Header
            const SizedBox(height: 10),
            _buildMenuSection(context),
            const SizedBox(height: 10),
            _buildLogoutButton(context),
          ],
        ),
      ),
    );
  }

  // --- 1. HEADER (Avatar + Info + Edit Button + RANK) ---
  Widget _buildHeader(DonationRank rank) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        // Background Blue Curve
        Container(
          height: 230,
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
          top: 10,
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
          margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
          padding: const EdgeInsets.symmetric(vertical: 5),
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
              // Name
              const Text(
                "Dang Khoa Nguyen",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF333333),
                ),
              ),
              const SizedBox(height: 8),

              // --- HIỂN THỊ DANH HIỆU (RANK BADGE) ---
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: rank.color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                  border:
                      Border.all(color: rank.color.withOpacity(0.5), width: 1),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.military_tech, color: rank.color, size: 18),
                    const SizedBox(width: 6),
                    Text(
                      rank.title,
                      style: TextStyle(
                        color: rank.color,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              // ----------------------------------------

              const SizedBox(height: 8),
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
              const SizedBox(height: 10),
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

          if (isLoggedIn) {
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
