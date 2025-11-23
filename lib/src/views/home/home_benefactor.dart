import 'dart:async';
import 'package:flutter/material.dart';

// --- IMPORT CÁC COMPONENT UI ---
import 'package:tester/src/theme/app_theme/app_theme.dart';
import 'package:tester/src/views/ayns/XemBaiDemo.dart';
import 'package:tester/src/views/widgets/custom_card_widget_2.dart';
import 'package:tester/src/views/widgets/custom_drawer.dart';
import 'package:tester/src/views/widgets/search_bar_widget%20.dart';
import 'package:tester/src/views/widgets/filter_button_widget.dart';
import 'package:tester/src/views/widgets/user_avatar_widget.dart';
import 'package:tester/src/views/manage/my_navigation_bar.dart';
import 'package:tester/src/views/post/post_needy_detail.dart';
import 'package:tester/src/views/post/post_needy_detail_test.dart';
import 'package:tester/src/views/user_donate/user_donate_screen.dart';
import 'package:tester/src/views/widgets/custom_card_widget.dart';

// --- IMPORT CÁC MÀN HÌNH TAB CON ---
import 'package:tester/src/views/campaign/campaign_list_screen.dart'; // Tab 1
import 'package:tester/src/views/video/video_needy_person_screen.dart'; // Tab 2 (Reels)
import 'package:tester/src/views/notification/noti_normal_screen.dart'; // Tab 3
import 'package:tester/src/views/user_profile/user_profile_view.dart'; // Tab 4

class MainNguoiHT extends StatefulWidget {
  const MainNguoiHT({super.key});

  @override
  _MainNguoiHTState createState() => _MainNguoiHTState();
}

class _MainNguoiHTState extends State<MainNguoiHT> {
  int _currentIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  // Danh sách các màn hình (trừ Reels)
  late List<Widget> _pages;

  final List<String> _images = [
    "assets/sapa41_welcome.jpg",
    "assets/sapa5_dangky.jpg",
    "assets/sapa8.png",
    "assets/sapa7.png"
  ];

  // Dữ liệu giả lập cho list (nếu cần dùng dynamic, hiện tại bạn đang hardcode trong UI dưới)
  final List<Map<String, String>> items = [
    {
      "image": "assets/images/HinhAnh_Demo.jpg",
      "title": "Trẻ em",
      "location": "Bình Định",
      "description": "Tính mạng mong manh của bé gái 3 tuổi\n mắc bệnh xơ gan"
    },
    // ... bạn có thể thêm data vào đây để dùng ListView.builder như bên MainNguoiKK
  ];

  @override
  void initState() {
    super.initState();

    // KHỞI TẠO CÁC TRANG
    _pages = [
      _buildHomePage(), // Index 0: Trang chủ (UI cũ)
      const CampaignListScreen(), // Index 1: Xu hướng
      const SizedBox(), // Index 2: Placeholder (Reels xử lý riêng)
      const NotiNormal(), // Index 3: Thông báo
      const UserProfileView(), // Index 4: Cá nhân
    ];

    // Timer chạy slide ảnh
    Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      if (!mounted) return;
      if (_pageController.hasClients) {
        setState(() {
          _currentPage = (_currentPage + 1) % _images.length;
        });
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // XỬ LÝ CHUYỂN TAB
  void _onTabTapped(int index) {
    if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const VideoNeedyReelsScreen()),
      );
    } else {
      // CÁC TAB KHÁC
      setState(() {
        _currentIndex = index;
      });
    }
  }

  // --- HÀM UI TRANG CHỦ (Tách ra từ code cũ) ---
  Widget _buildHomePage() {
    return Container(
      constraints: const BoxConstraints.expand(),
      color: MyColors.surfaceContainerLowest,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: MyColors.surfaceContainerLowest,
              ),
              width: double.infinity,
              height: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        // Ảnh nền chuyển động
                        SizedBox(
                          height: 600,
                          width: double.infinity,
                          child: PageView.builder(
                            controller: _pageController,
                            itemCount: _images.length,
                            onPageChanged: (index) {
                              setState(() {
                                _currentPage = index;
                              });
                            },
                            itemBuilder: (context, index) {
                              return Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(_images[index]),
                                    fit: BoxFit.cover,
                                    colorFilter: ColorFilter.mode(
                                      Colors.black.withOpacity(0.3),
                                      BlendMode.darken,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        // Logo
                        Positioned(
                          top: 16,
                          left: 16,
                          child: Image.asset(
                            "assets/images/logo.png",
                            height: 70,
                          ),
                        ),
                        // Các icon top right (dùng helper)
                        Positioned(
                          top: 16,
                          right: 16,
                          child: Row(
                            children: [
                              _buildCircleIcon(Icons.list),
                              const SizedBox(width: 10),
                              _buildCircleIcon(Icons.search),
                              const SizedBox(width: 10),
                              _buildCircleIcon(Icons.person),
                            ],
                          ),
                        ),
                        // Text Chào mừng & Filter
                        Positioned(
                          left: 16,
                          bottom: 16,
                          right: 16,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Chào mừng bạn đến với",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 34,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const Text(
                                "Cộng đồng người Việt nhân ái",
                                style: TextStyle(
                                  color: Colors.orangeAccent,
                                  fontSize: 34,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 15),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    FilterButtonWidget(
                                        text: "Xóa đói",
                                        icon: Icons.food_bank,
                                        onPressed: () {}),
                                    FilterButtonWidget(
                                        text: "Trẻ em",
                                        icon: Icons.child_care,
                                        onPressed: () {}),
                                    FilterButtonWidget(
                                        text: "Người cao tuổi",
                                        icon: Icons.elderly,
                                        onPressed: () {}),
                                    FilterButtonWidget(
                                        text: "Bệnh nhân",
                                        icon: Icons.local_hospital,
                                        onPressed: () {}),
                                    FilterButtonWidget(
                                        text: "Người khuyết tật",
                                        icon: Icons.accessible,
                                        onPressed: () {}),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    // Search Bar
                    IntrinsicHeight(
                      child: Container(
                        margin:
                            const EdgeInsets.only(top: 5, left: 15, right: 12),
                        width: double.infinity,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(child: SearchBarWidget()),
                          ],
                        ),
                      ),
                    ),
                    // Section Đồng hành tích cực
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Đồng hành tích cực",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                UserAvatarWidget(
                                    imagePath: "assets/images/user1.png",
                                    name: "M.U VietNam"),
                                UserAvatarWidget(
                                    imagePath: "assets/images/user2.png",
                                    name: "Double2T"),
                                UserAvatarWidget(
                                    imagePath: "assets/images/user3.jpg",
                                    name: "Siberian Wellness"),
                                UserAvatarWidget(
                                    imagePath: "assets/images/user4.png",
                                    name: "Ngọc Anh"),
                                UserAvatarWidget(
                                    imagePath: "assets/images/user5.jpg",
                                    name: "Hòa Minzy"),
                                UserAvatarWidget(
                                    imagePath: "assets/images/user6.png",
                                    name: "Quỹ chăm sóc.."),
                                UserAvatarWidget(
                                    imagePath: "assets/images/user7.jpg",
                                    name: "NSND Quyền Linh"),
                                UserAvatarWidget(
                                    imagePath: "assets/images/user8.png",
                                    name: "Vingroup"),
                                UserAvatarWidget(
                                    imagePath: "assets/images/user4.png",
                                    name: "Phoenix Ho"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Buttons (Xem bài đăng / Trình bày khó khăn) - Có thể ẩn nút "Trình bày" đối với Người Hảo Tâm nếu muốn
                    IntrinsicHeight(
                      child: Container(
                        margin:
                            const EdgeInsets.only(top: 8, bottom: 10, left: 10),
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 12),
                        decoration: const BoxDecoration(
                          color: Color(0xFFE3F2FD),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                        ),
                        child: const Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 16,
                              backgroundColor: Color(0xFF0288D1),
                              child: Icon(Icons.favorite_outline_outlined,
                                  size: 20, color: Colors.white),
                            ),
                            SizedBox(width: 15),
                            Flexible(
                              child: Text(
                                "Hoàn cảnh khó khăn gần đây",
                                style: TextStyle(
                                  color: Color(0xFF01579B),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(width: 70),
                            Icon(Icons.arrow_forward,
                                color: Color(0xFF0288D1), size: 20),
                          ],
                        ),
                      ),
                    ),
                    // Section Hoàn cảnh khó khăn gần đây
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Hoàn cảnh khó khăn gần đây",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 14, 0),
                            child: Text(
                              "Xem tất cả >",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // List Horizontal Items (Custom Cards 1)
                    Container(
                      margin: const EdgeInsets.only(left: 2),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 390,
                              child: CustomCardWidget(
                                imagePath: "assets/images/HinhAnh_Demo.jpg",
                                label: "Trẻ em",
                                location: "Bình Định",
                                description:
                                    "Tính mạng mong manh của bé gái 3 tuổi\n mắc bệnh xơ gan",
                                onCardTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const PostNeedyDetail()));
                                },
                                onDonateTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const PostNeedyDetail()));
                                },
                              ),
                            ),
                            SizedBox(
                              width: 388,
                              child: CustomCardWidget(
                                imagePath: "assets/images/nguoikhokhan1.jpg",
                                label: "Người già",
                                location: "TP. HCM",
                                description:
                                    "3 CHA CON SỐNG TRONG CĂN NHÀ 2M2,\nCƠM ĂN BỮA ĐÓI BỮA NO",
                                onCardTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const XemBaiDangKhoKhan2()));
                                },
                                onDonateTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const XemBaiDangKhoKhan2()));
                                },
                              ),
                            ),
                            SizedBox(
                              width: 388,
                              child: CustomCardWidget(
                                imagePath: "assets/images/nguoikhokhan8.jpg",
                                label: "Người già",
                                location: "Kiên Giang",
                                description:
                                    "Cụ bà 90 tuổi bị 4 con bỏ rơi, tự bò ngoài \nđường bắt xe đi khám bệnh",
                                onCardTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const XemBaiDemo()));
                                },
                                onDonateTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const XemBaiDemo()));
                                },
                              ),
                            ),
                            SizedBox(
                              width: 388,
                              child: CustomCardWidget(
                                imagePath: "assets/images/nguoikhokhan9.jpg",
                                label: "Đặc biệt",
                                location: "Nam Định",
                                description:
                                    "Mẹ già 80 tuổi còng lưng chăm con trai \nsuy thận, con gái mắc bệnh ung thư",
                                onCardTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const XemBaiDangKhoKhan2()));
                                },
                                onDonateTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const XemBaiDangKhoKhan2()));
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Divider
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: Divider(
                        color: Color.fromARGB(255, 225, 219, 219),
                        thickness: 7,
                        indent: 0,
                        endIndent: 0,
                      ),
                    ),
                    // Section Header 2 (Màu xanh đậm)
                    IntrinsicHeight(
                      child: Container(
                        margin: const EdgeInsets.only(
                            top: 10, bottom: 10, left: 10),
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 12),
                        decoration: const BoxDecoration(
                          color: Color(0xFF81D4FA),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                        ),
                        child: const Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 16,
                              backgroundColor: Color(0xFF0288D1),
                              child: Icon(Icons.favorite,
                                  size: 20, color: Colors.white),
                            ),
                            SizedBox(width: 15),
                            Flexible(
                              child: Text(
                                "Các hoàn cảnh đã nhận hỗ trợ",
                                style: TextStyle(
                                  color: Color(0xFF006064),
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(width: 45),
                            Icon(Icons.arrow_forward,
                                color: Color(0xFF0288D1), size: 20),
                          ],
                        ),
                      ),
                    ),
                    // Section List 2
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Các hoàn cảnh đã nhận hỗ trợ",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 14, 0),
                            child: Text(
                              "Xem tất cả >",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // List Horizontal Items (Custom Card 2)
                    Container(
                      margin: const EdgeInsets.only(bottom: 10, left: 2),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 390,
                              child: CustomCardWidget2(
                                imagePath2: "assets/images/rectangle_18.png",
                                label2: "Người già",
                                location2: "Quảng Nam",
                                description2:
                                    "Hỗ trợ hoàn cảnh khó khăn ở xóm Hộ Sơn \nxã Nam Tiến",
                                onCardTap2: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const XemBaiDangKhoKhan2()));
                                },
                                onDonateTap2: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const DonateScreen()));
                                },
                              ),
                            ),
                            SizedBox(
                              width: 388,
                              child: CustomCardWidget2(
                                imagePath2: "assets/images/nguoikhokhan2.jpg",
                                label2: "Người già",
                                location2: "TP. HCM",
                                description2:
                                    "3 CHA CON SỐNG TRONG CĂN NHÀ 2M2,\nCƠM ĂN BỮA ĐÓI BỮA NO",
                                onCardTap2: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const XemBaiDangKhoKhan2()));
                                },
                                onDonateTap2: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const DonateScreen()));
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper widget for circle icons
  Widget _buildCircleIcon(IconData icon) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            color: Colors.grey,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.white, size: 20),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const CustomDrawer(),
      // SỬ DỤNG INDEXED STACK
      body: SafeArea(
        child: IndexedStack(
          index: _currentIndex,
          children: _pages,
        ),
      ),
      bottomNavigationBar: MyNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}
