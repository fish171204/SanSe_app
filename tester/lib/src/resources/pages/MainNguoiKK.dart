import 'package:flutter/material.dart';
import 'package:tester/src/Ayns/XemBaiDemo.dart';
import 'package:tester/src/Ayns/mainTest.dart';
import 'package:tester/src/resources/pages/XemBaiDangKhoKhanDemo.dart';
import 'package:tester/src/resources/widgets/SearchBarWidget%20.dart';
import 'package:tester/src/resources/widgets/filter_button_widget.dart';
import 'package:tester/src/resources/widgets/user_avatar_widget.dart';
import '../../constants/MyColors.dart';
import 'package:tester/src/resources/widgets/CustomDrawer02.dart';
import '../../constants/MyFontSize.dart';
import 'package:tester/src/resources/pages/MyNavigationBar.dart';
import 'package:tester/src/resources/pages/XemBaiDangKhoKhan2.dart';
import 'package:tester/src/resources/pages/affiliateMarkteting.dart';
import 'package:tester/src/resources/pages/DaDuocGiup.dart';
import 'package:tester/src/resources/pages/xemProfile.dart';
import 'package:tester/src/resources/pages/DangBaiChinhChu2.dart';
import 'dart:async';

class MainNguoiKK extends StatefulWidget {
  const MainNguoiKK({super.key});

  @override
  _MainNguoiKKState createState() => _MainNguoiKKState();
}

class _MainNguoiKKState extends State<MainNguoiKK> {
  int _currentIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  final List<String> _images = [
    "assets/sapa41_welcome.jpg",
    "assets/images/sapa5_dangky.jpg",
    "assets/images/sapa8.png",
    "assets/images/sapa7.png"
  ];

  @override
  void initState() {
    super.initState();
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

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Map<String, String>> items = [
    {
      "image": "assets/nguoikhokhan4.jpg",
      "title": "Bệnh hiểm nghèo",
      "location": "Thừa Thiên Huế",
      "description":
          "XIN GIÚP ĐỠ KINH PHÍ CHỮA BỆNH CHO \nEM NGUYỄN VĂN HIẾU 16 TUỔI"
    },
    {
      "image": "assets/nguoikhokhan5.jpg",
      "title": "Người nghèo",
      "location": "Điện Biên",
      "description": "Chia sẻ Yêu thương Đồng bào biên giới"
    },
    {
      "image": "assets/nguoikhokhan6.jpg",
      "title": "Người khuyết tật",
      "location": "Bình Phước",
      "description": "Giúp đỡ anh Đào Văn Sắc có thêm kinh phí chữa bệnh"
    },
    {
      "image": "assets/nguoikhokhan7.jpg",
      "title": "Người già",
      "location": "Hà Nội",
      "description": "Phòng trọ cho người vô gia cư"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: const CustomDrawer02(),
        body: SafeArea(
          child: Container(
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
                            Positioned(
                              top: 16,
                              left: 16,
                              child: Image.asset(
                                "assets/logo.png",
                                height: 70,
                              ),
                            ),
                            Positioned(
                              top: 16,
                              right: 16,
                              child: Row(
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: const BoxDecoration(
                                          color: Colors.grey,
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Icon(Icons.list,
                                            color: Colors.white, size: 20),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 10),
                                  Stack(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: const BoxDecoration(
                                          color: Colors.grey,
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Icon(Icons.search,
                                            color: Colors.white, size: 20),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 10),
                                  Stack(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: const BoxDecoration(
                                          color: Colors.grey,
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Icon(Icons.person,
                                            color: Colors.white, size: 20),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
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
                                          onPressed: () {},
                                        ),
                                        FilterButtonWidget(
                                          text: "Trẻ em",
                                          icon: Icons.child_care,
                                          onPressed: () {},
                                        ),
                                        FilterButtonWidget(
                                          text: "Người cao tuổi",
                                          icon: Icons.elderly,
                                          onPressed: () {},
                                        ),
                                        FilterButtonWidget(
                                          text: "Bệnh nhân",
                                          icon: Icons.local_hospital,
                                          onPressed: () {},
                                        ),
                                        FilterButtonWidget(
                                          text: "Người khuyết tật",
                                          icon: Icons.accessible,
                                          onPressed: () {},
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        IntrinsicHeight(
                          child: Container(
                            margin: const EdgeInsets.only(
                                top: 5, left: 15, right: 12),
                            width: double.infinity,
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(child: SearchBarWidget()),
                              ],
                            ),
                          ),
                        ),
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
                                        name: "Hang MU"),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 180,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.amber,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 12),
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
                                            const XemBaiDangKhoKhanDemo()),
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
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 12),
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
                                            const DangBaiChinhChu2()),
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
                        const Padding(
                          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: Divider(
                            color: Color.fromARGB(
                                255, 225, 219, 219), // Màu của đường kẻ
                            thickness: 7, // Độ dày của đường kẻ
                            indent: 0, // Lề bên trái của đường kẻ
                            endIndent: 0, // Lề bên phải của đường kẻ
                          ),
                        ),
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
                            mainAxisAlignment: MainAxisAlignment
                                .spaceBetween, // Căn cách đều hai bên
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
                                    color: Colors.blue, // Màu vàng hổ phách
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 2),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 388, // Set a fixed width for each card
                                  child: CustomCardWidget(
                                    imagePath: "assets/nguoikhokhan1.jpg",
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
                                SizedBox(
                                  width: 388, // Set a fixed width for each card
                                  child: CustomCardWidget(
                                    imagePath: "assets/nguoikhokhan8.jpg",
                                    label: "Người già",
                                    location: "Kiên Giang",
                                    description:
                                        "Cụ bà 90 tuổi bị 4 con bỏ rơi, tự bò ngoài \nđường bắt xe đi khám bệnh",
                                    onCardTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const XemBaiDemo(),
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
                                SizedBox(
                                  width: 388, // Set a fixed width for each card
                                  child: CustomCardWidget(
                                    imagePath: "assets/nguoikhokhan9.jpg",
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
                        const Padding(
                          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: Divider(
                            color: Color.fromARGB(
                                255, 225, 219, 219), // Màu của đường kẻ
                            thickness: 7, // Độ dày của đường kẻ
                            indent: 0, // Lề bên trái của đường kẻ
                            endIndent: 0, // Lề bên phải của đường kẻ
                          ),
                        ),
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
                            mainAxisAlignment: MainAxisAlignment
                                .spaceBetween, // Căn cách đều hai bên
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
                                    color: Colors.blue, // Màu vàng hổ phách
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(items.length, (index) {
                              final item = items[index];
                              return Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(
                                      top: 10,
                                      bottom: 0,
                                      right: 5,
                                    ),
                                    margin: const EdgeInsets.only(
                                      bottom: 3,
                                      left: 10,
                                      right: 5,
                                    ),
                                    height: 235,
                                    width: 375, // Đặt chiều rộng cố định
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
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  vertical: 9,
                                                ),
                                                margin: const EdgeInsets.only(
                                                  bottom: 135,
                                                  left:
                                                      230, // Điều chỉnh vị trí
                                                ),
                                                width: 140,
                                                height: 42,
                                                child: Center(
                                                  child: Text(
                                                    item["title"]!,
                                                    style: const TextStyle(
                                                      color: Color(0xFFFF0000),
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    SizedBox(
                                                      width: 14,
                                                      height: 20,
                                                      child: Image.asset(
                                                        "assets/location.png",
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                    IntrinsicHeight(
                                                      child: Text(
                                                        item["location"]!,
                                                        style: const TextStyle(
                                                          color:
                                                              Color(0xFFFF0303),
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
                                      width: 370, // Đặt chiều rộng phù hợp
                                      height: 70,
                                      child: Center(
                                        // Đảm bảo nội dung bên trong được căn giữa
                                        child: Text(
                                          item["description"]!,
                                          textAlign: TextAlign
                                              .center, // Căn giữa nội dung trong Text
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
                    )),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: MyNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onTabTapped,
        ));
  }
}

Widget _buildItemRow(String imagePath, String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Row(
      children: [
        Image.asset(imagePath, width: 24, height: 27),
        const SizedBox(width: 10),
        Text(title, style: const TextStyle(fontSize: 16)),
      ],
    ),
  );
}
