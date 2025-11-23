import 'dart:async';
import 'package:flutter/material.dart';

// --- CÁC IMPORT TỪ PROJECT CỦA BẠN ---
import 'package:tester/src/theme/app_theme/app_theme.dart';
import 'package:tester/src/views/ayns/ViewUI.dart';
import 'package:tester/src/views/ayns/XemBaiDemo.dart';
import 'package:tester/src/views/post/post_needy_detail_test.dart';
import 'package:tester/src/views/post/post_needy_detail_test_02.dart';
import 'package:tester/src/views/widgets/search_bar_widget%20.dart';
import 'package:tester/src/views/widgets/filter_button_widget.dart';
import 'package:tester/src/views/widgets/user_avatar_widget.dart';
import 'package:tester/src/views/widgets/custom_drawer_2.dart';
import 'package:tester/src/views/manage/my_navigation_bar.dart';
import 'package:tester/src/views/post/post_needy_create.dart';
import 'package:tester/src/views/widgets/custom_card_widget.dart';

// --- CÁC IMPORT CÁC MÀN HÌNH TAB KHÁC ---
import 'package:tester/src/views/campaign/campaign_list_screen.dart'; // Tab 1: Xu hướng
import 'package:tester/src/views/video/video_needy_person_screen.dart'; // Tab 2: Reels
import 'package:tester/src/views/notification/noti_normal_screen.dart'; // Tab 3: Thông báo
import 'package:tester/src/views/user_profile/user_profile_view.dart'; // Tab 4: Profile

class MainNguoiKK extends StatefulWidget {
  const MainNguoiKK({super.key});

  @override
  _MainNguoiKKState createState() => _MainNguoiKKState();
}

class _MainNguoiKKState extends State<MainNguoiKK> {
  // Biến quản lý tab hiện tại
  int _currentIndex = 0;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // Controller cho Slider ảnh
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  // Danh sách các màn hình cho IndexedStack (Trừ Reels ra vì Reels push riêng)
  late List<Widget> _pages;

  final List<String> _images = [
    "assets/sapa41_welcome.jpg",
    "assets/sapa5_dangky.jpg",
    "assets/sapa8.png",
    "assets/sapa7.png"
  ];

  final List<Map<String, String>> items = [
    {
      "image": "assets/images/nguoikhokhan4.jpg",
      "title": "Bệnh hiểm nghèo",
      "location": "Thừa Thiên Huế",
      "description":
          "XIN GIÚP ĐỠ KINH PHÍ CHỮA BỆNH CHO \nEM NGUYỄN VĂN HIẾU 16 TUỔI"
    },
    {
      "image": "assets/images/nguoikhokhan5.jpg",
      "title": "Người nghèo",
      "location": "Điện Biên",
      "description": "Chia sẻ Yêu thương Đồng bào biên giới"
    },
    {
      "image": "assets/images/nguoikhokhan6.jpg",
      "title": "Người khuyết tật",
      "location": "Bình Phước",
      "description": "Giúp đỡ anh Đào Văn Sắc có thêm kinh phí chữa bệnh"
    },
    {
      "image": "assets/images/nguoikhokhan7.jpg",
      "title": "Người già",
      "location": "Hà Nội",
      "description": "Phòng trọ cho người vô gia cư"
    },
  ];

  @override
  void initState() {
    super.initState();

    // KHỞI TẠO DANH SÁCH CÁC TRANG
    _pages = [
      _buildHomePage(), // Index 0: Trang chủ (Giao diện cũ của bạn)
      const CampaignListScreen(), // Index 1: Xu hướng
      const SizedBox(), // Index 2: Placeholder (Để trống vì Reels dùng Navigator.push)
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

  // HÀM XỬ LÝ KHI BẤM TAB
  void _onTabTapped(int index) {
    if (index == 2) {
      // NẾU LÀ REELS (Tab giữa): Push màn hình mới để đè lên
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const VideoNeedyReelsScreen()),
      );
    } else {
      // CÁC TAB KHÁC: Chuyển index để IndexedStack hiển thị
      setState(() {
        _currentIndex = index;
      });
    }
  }

  // --- GIAO DIỆN TRANG CHỦ CŨ CỦA BẠN (Đã tách ra hàm riêng) ---
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
                        // Các icon top right
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
                        // Text Chào mừng & Filter Buttons
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
                    // 2 Buttons Action
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 180,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.amber,
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 4,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ViewUI()),
                              );
                            },
                            child: const Text(
                              "Xem bài đã đăng",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        SizedBox(
                          width: 180,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueAccent.shade200,
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 4,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const PostNeedyCreate()),
                              );
                            },
                            child: const Text(
                              "Trình bày khó khăn",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
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
                    // Section Hoàn cảnh khó khăn
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
                    // List Horizontal Items (Custom Cards)
                    Container(
                      margin: const EdgeInsets.only(left: 2),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            // Card 1
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
                                          const XemBaiDangKhoKhan2(),
                                    ),
                                  );
                                },
                                onDonateTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const XemBaiDangKhoKhan2()),
                                  );
                                },
                              ),
                            ),
                            // Card 2
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
                                      builder: (context) => const XemBaiDemo(),
                                    ),
                                  );
                                },
                                onDonateTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const XemBaiDemo()),
                                  );
                                },
                              ),
                            ),
                            // Card 3
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
                                          const XemBaiDangKhoKhan2(),
                                    ),
                                  );
                                },
                                onDonateTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const XemBaiDangKhoKhan2()),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Divider 2
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: Divider(
                        color: Color.fromARGB(255, 225, 219, 219),
                        thickness: 7,
                        indent: 0,
                        endIndent: 0,
                      ),
                    ),
                    // Section Các hoàn cảnh đã nhận hỗ trợ
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
                    // List Horizontal Items generated from list `items`
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(items.length, (index) {
                          final item = items[index];
                          return Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(
                                    top: 10, bottom: 0, right: 5),
                                margin: const EdgeInsets.only(
                                    bottom: 3, left: 10, right: 5),
                                height: 235,
                                width: 375,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                  child: Stack(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const Daduocgiup(),
                                            ),
                                          );
                                        },
                                        child: Image.asset(
                                          item["image"]!,
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                          height: double.infinity,
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              color: MyColors
                                                  .surfaceContainerLowest,
                                            ),
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 9),
                                            margin: const EdgeInsets.only(
                                              bottom: 135,
                                              left: 230,
                                            ),
                                            width: 140,
                                            height: 42,
                                            child: Center(
                                              child: Text(
                                                item["title"]!,
                                                style: const TextStyle(
                                                  color: Color(0xFFFF0000),
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: MyColors
                                                  .surfaceContainerLowest,
                                            ),
                                            padding: const EdgeInsets.only(
                                              top: 7,
                                              bottom: 7,
                                              left: 10,
                                              right: 10,
                                            ),
                                            margin: const EdgeInsets.only(
                                                left: 220),
                                            width: 150,
                                            height: 38,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                SizedBox(
                                                  width: 14,
                                                  height: 20,
                                                  child: Image.asset(
                                                    "assets/images/location.png",
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                                IntrinsicHeight(
                                                  child: Text(
                                                    item["location"]!,
                                                    style: const TextStyle(
                                                      color: Color(0xFFFF0303),
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              IntrinsicHeight(
                                child: Container(
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                    ),
                                    color: Color(0xFFE9E9E9),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 13,
                                    horizontal: 14,
                                  ),
                                  margin: const EdgeInsets.only(
                                    bottom: 25,
                                    left: 5,
                                    right: 5,
                                  ),
                                  width: 370,
                                  height: 70,
                                  child: Center(
                                    child: Text(
                                      item["description"]!,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: MyColors.shadow,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }),
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

  // Widget helper nhỏ cho các icon tròn trên top
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
      drawer: const CustomDrawer02(),
      // IndexedStack giúp giữ trạng thái các tab (Home, Xu hướng, Thông báo, Profile)
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
