import 'package:flutter/material.dart';
import 'package:tester/src/Ayns/XemBaiDemo.dart';
import '../constants/MyColors.dart';
import '../constants/MyFontSize.dart';
import 'package:tester/src/resources/MyNavigationBar.dart';
import 'package:tester/src/resources/XemBaiDangKhoKhan2.dart';
import 'package:tester/src/Ayns/ViewUI.dart';
import 'package:tester/src/resources/affiliateMarkteting.dart';
import 'package:tester/src/resources/DaDuocGiup.dart';
import 'package:tester/src/resources/xemProfile.dart';
import 'package:tester/src/resources/DangBaiChinhChu2.dart';

class mainTestKK extends StatefulWidget {
  const mainTestKK({super.key});

  @override
  _mainTestKKState createState() => _mainTestKKState();
}

class _mainTestKKState extends State<mainTestKK> {
  int _currentIndex = 0;

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
                        padding: const EdgeInsets.only(top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            IntrinsicHeight(
                              child: Container(
                                margin:
                                    const EdgeInsets.only(left: 15, right: 12),
                                width: double.infinity,
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          // Mở màn hình danh mục từ thiện khi nhấn vào hình "danhmuc"
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: const Text(
                                                  'DANH MỤC TỪ THIỆN',
                                                  style: TextStyle(
                                                    color: Color(
                                                        0xFF0866FF), // Màu chữ: #0866FF
                                                  ),
                                                ),
                                                content: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    _buildItemRow(
                                                        "assets/quaylai.png",
                                                        "Từ thiện trực tiếp"),
                                                    _buildItemRow(
                                                        "assets/quaylai.png",
                                                        "Từ thiện chủ đề"),
                                                    _buildItemRow(
                                                        "assets/quaylai.png",
                                                        "Từ thiện khẩn cấp"),
                                                    GestureDetector(
                                                      onTap: () {
                                                        // Điều hướng đến màn hình affiliateMarketing.dart khi nhấn vào "Mua hàng doanh nghiệp từ thiện"
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                const affiliateMarkteting(), // Chuyển đến màn hình affiliateMarketing
                                                          ),
                                                        );
                                                      },
                                                      child: _buildItemRow(
                                                          "assets/giohang.png",
                                                          "Mua hàng doanh nghiệp từ thiện"),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        child: Container(
                                          child: Image.asset(
                                            "assets/danhmuc.png",
                                            fit: BoxFit.fill,
                                            width: 30,
                                            height: 30,
                                          ),
                                        ),
                                      ),
                                      IntrinsicHeight(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: const Color(0xFFD9D9D9),
                                          ),
                                          padding:
                                              const EdgeInsets.only(right: 10),
                                          width: 245,
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                IntrinsicHeight(
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      color: const Color(
                                                          0xFFE6E2E2),
                                                    ),
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 5, right: 5),
                                                    width: 40,
                                                    child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            margin:
                                                                const EdgeInsets
                                                                    .only(
                                                                    top: 5),
                                                            height: 29,
                                                            width:
                                                                double.infinity,
                                                            child: Image.asset(
                                                              "assets/search.png",
                                                              fit: BoxFit.fill,
                                                            ),
                                                          ),
                                                        ]),
                                                  ),
                                                ),
                                                const IntrinsicHeight(
                                                  child: Text(
                                                    "Nhập nội dung tìm kiếm",
                                                    style: TextStyle(
                                                      color: MyColors.shadow,
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 24,
                                                  height: 24,
                                                  child: Image.asset(
                                                    "assets/caidat.png",
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ]),
                                        ),
                                      ),
                                      IntrinsicHeight(
                                        child: GestureDetector(
                                          onTap: () {
                                            // Điều hướng tới màn hình DangBaiChinhChu2
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const DangBaiChinhChu2()), // Đảm bảo rằng bạn đã import DangBaiChinhChu2.dart
                                            );
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              color: const Color(0xFF0866FF),
                                            ),
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 14),
                                            width: 92,
                                            child: const Column(
                                              children: [
                                                Text(
                                                  "Trình bày",
                                                  style: TextStyle(
                                                    color: MyColors
                                                        .surfaceContainerLowest, // Đảm bảo MyColors đã được khai báo
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ]),
                              ),
                            ),
                            IntrinsicHeight(
                              child: Container(
                                margin: const EdgeInsets.only(
                                  top:
                                      8, // Khoảng cách với các chi tiết bên trên
                                  bottom: 10, // Khoảng cách bên dưới
                                  left: 10,
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8, // Điều chỉnh padding dọc
                                  horizontal: 12, // Điều chỉnh padding ngang
                                ),
                                decoration: const BoxDecoration(
                                  color: Color(
                                      0xFFE3F2FD), // Light blue background
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(
                                        10), // Bo tròn góc trên bên trái
                                    bottomLeft: Radius.circular(
                                        10), // Bo tròn góc dưới bên trái
                                  ),
                                ),
                                child: const Row(
                                  crossAxisAlignment: CrossAxisAlignment
                                      .center, // Căn giữa các thành phần
                                  children: [
                                    CircleAvatar(
                                      radius: 16, // Kích thước avatar
                                      backgroundColor:
                                          Color(0xFF0288D1), // Blue
                                      child: Icon(
                                        Icons.favorite_outline_outlined,
                                        size:
                                            20, // Kích thước icon bên trong avatar
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                        width:
                                            15), // Khoảng cách ngang giữa các thành phần
                                    Flexible(
                                      child: Text(
                                        "Hoàn cảnh khó khăn gần đây",
                                        style: TextStyle(
                                          color:
                                              Color(0xFF01579B), // Darker blue
                                          fontSize: 16, // Kích thước chữ
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 70), // Khoảng cách ngang
                                    Icon(
                                      Icons.arrow_forward,
                                      color: Color(0xFF0288D1), // Màu icon
                                      size: 20, // Kích thước icon
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 2),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width:
                                          388, // Set a fixed width for each card
                                      child: CustomCardWidget(
                                        imagePath: "assets/HinhAnh_Demo.jpg",
                                        label: "Trẻ em",
                                        location: "Bình Định",
                                        description:
                                            "Tính mạng mong manh của bé gái 3 tuổi \nmắc bệnh xơ gan",
                                        onCardTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const ViewUI(),
                                            ),
                                          );
                                        },
                                        onDonateTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const ViewUI()),
                                          );
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      width:
                                          388, // Set a fixed width for each card
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
                                      width:
                                          388, // Set a fixed width for each card
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
                                      width:
                                          388, // Set a fixed width for each card
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
                                    // You can add more CustomCardWidgets here as needed
                                  ],
                                ),
                              ),
                            ),
                            IntrinsicHeight(
                              child: Container(
                                margin: const EdgeInsets.only(
                                  top: 10,
                                  left: 10,
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8,
                                  horizontal: 12,
                                ),
                                decoration: const BoxDecoration(
                                  color: Color(0xFF81D4FA), // Sky Blue
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(
                                        10), // Bo tròn góc trên bên trái
                                    bottomLeft: Radius.circular(
                                        10), // Bo tròn góc dưới bên trái
                                  ),
                                ),
                                child: const Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      radius: 16,
                                      backgroundColor: Color(0xFF0288D1),
                                      child: Icon(
                                        Icons.favorite,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(width: 15),
                                    Flexible(
                                      child: Text(
                                        "Các hoàn cảnh đã nhận hỗ trợ",
                                        style: TextStyle(
                                          color: Color(
                                              0xFF006064), // Dark Teal Blue (Đậm hơn)
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 45),
                                    Icon(
                                      Icons.arrow_forward,
                                      color: Color(0xFF0288D1), // Màu icon
                                      size: 20,
                                    ),
                                  ],
                                ),
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
                                                          BorderRadius.circular(
                                                              30),
                                                      color: MyColors
                                                          .surfaceContainerLowest,
                                                    ),
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                      vertical: 9,
                                                    ),
                                                    margin:
                                                        const EdgeInsets.only(
                                                      bottom: 135,
                                                      left:
                                                          220, // Điều chỉnh vị trí
                                                    ),
                                                    width: 140,
                                                    height: 42,
                                                    child: Center(
                                                      child: Text(
                                                        item["title"]!,
                                                        style: const TextStyle(
                                                          color:
                                                              Color(0xFFFF0000),
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
                                                          BorderRadius.circular(
                                                              20),
                                                      color: MyColors
                                                          .surfaceContainerLowest,
                                                    ),
                                                    padding:
                                                        const EdgeInsets.only(
                                                      top: 7,
                                                      bottom: 7,
                                                      left: 10,
                                                      right: 10,
                                                    ),
                                                    margin:
                                                        const EdgeInsets.only(
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
                                                            style:
                                                                const TextStyle(
                                                              color: Color(
                                                                  0xFFFF0303),
                                                              fontSize: 13,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
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

class CustomCardWidget extends StatelessWidget {
  final String imagePath;
  final String label;
  final String location;
  final String description;
  final VoidCallback onCardTap;
  final VoidCallback onDonateTap;

  const CustomCardWidget({
    super.key,
    required this.imagePath,
    required this.label,
    required this.location,
    required this.description,
    required this.onCardTap,
    required this.onDonateTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 0, bottom: 0, right: 5),
          margin: const EdgeInsets.only(bottom: 3, left: 10, right: 5),
          height: 240,
          width: double.infinity,
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
                  onTap: onCardTap,
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: const Color(
                            0xFFFCFCFC), // MyColors.surfaceContainerLowest
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 7, horizontal: 10),
                      margin: const EdgeInsets.only(bottom: 135, left: 280),
                      width: 200,
                      height: 42,
                      child: Center(
                        child: Text(
                          label,
                          style: const TextStyle(
                            color: Color(0xFFFF0000), // Red color for the label
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(
                            0xFFFCFCFC), // MyColors.surfaceContainerLowest
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 7, horizontal: 10),
                      margin: const EdgeInsets.only(left: 250),
                      width: 200,
                      height: 38,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment
                            .center, // Center the content horizontally
                        crossAxisAlignment: CrossAxisAlignment
                            .center, // Center the content vertically
                        children: [
                          SizedBox(
                            width: 14,
                            height: 20,
                            child: Image.asset(
                              "assets/location.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                          const SizedBox(
                              width:
                                  5), // Optional: add spacing between image and text
                          Text(
                            location,
                            style: const TextStyle(
                              color:
                                  Color(0xFFFF0303), // Red color for location
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
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
              color: Color(0xFFE9E9E9), // Gray color for bottom container
            ),
            padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 14),
            margin: const EdgeInsets.only(bottom: 5, left: 10, right: 10),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IntrinsicHeight(
                  child: SizedBox(
                    width: 260,
                    child: Text(
                      description,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 6, 6, 6), // MyColors.shadow
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                IntrinsicHeight(
                  child: GestureDetector(
                    onTap: onDonateTap,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(
                            0xFF0866FF), // Blue color for the button
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      width: 80,
                      child: const Column(
                        children: [
                          Text(
                            "Xem",
                            style: TextStyle(
                              color: Color(
                                  0xFFF0F0F0), // MyColors.surfaceContainerLowest
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
