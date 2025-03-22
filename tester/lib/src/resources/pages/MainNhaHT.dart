import 'package:flutter/material.dart';
import 'package:tester/src/Ayns/XemBaiDemo.dart';
import 'package:tester/src/resources/widgets/CustomDrawer.dart';
import 'package:tester/src/resources/widgets/SearchBarWidget .dart';
import 'package:tester/src/resources/widgets/filter_button_widget.dart';
import 'package:tester/src/resources/widgets/user_avatar_widget.dart';
import '../../constants/MyColors.dart';
import '../../constants/MyFontSize.dart';
import 'package:tester/src/resources/pages/MyNavigationBar.dart';
import 'package:tester/src/resources/pages/XemBaiDangKhoKhan2.dart';
import 'package:tester/src/Ayns/mainTest.dart';
import 'package:tester/src/resources/pages/XemBaiDangKhoKhanDemo.dart';
import 'package:tester/src/resources/pages/affiliateMarkteting.dart';
import 'package:tester/src/resources/pages/Donate.dart';
import 'package:tester/src/resources/pages/xemProfile.dart';

class MainNguoiHT extends StatefulWidget {
  const MainNguoiHT({super.key});

  @override
  _MainNguoiHTState createState() => _MainNguoiHTState();
}

class _MainNguoiHTState extends State<MainNguoiHT> {
  int _currentIndex = 0;
  String? selectedValue;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const CustomDrawer(),
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
                          Container(
                            width: double.infinity,
                            height: 600,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: const AssetImage(
                                    "assets/sapa41_welcome.jpg"),
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                  Colors.black.withOpacity(0.3),
                                  BlendMode.darken,
                                ),
                              ),
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
                      IntrinsicHeight(
                        child: Container(
                          margin: const EdgeInsets.only(
                            top: 8,
                            bottom: 10,
                            left: 10,
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 12,
                          ),
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
                                child: Icon(
                                  Icons.favorite_outline_outlined,
                                  size: 20,
                                  color: Colors.white,
                                ),
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
                                width: 390, // Set a fixed width for each card
                                child: CustomCardWidget(
                                  imagePath: "assets/HinhAnh_Demo.jpg",
                                  label: "Trẻ em",
                                  location: "Bình Định",
                                  description:
                                      "Tính mạng mong manh của bé gái 3 tuổi\n mắc bệnh xơ gan",
                                  onCardTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const XemBaiDangKhoKhanDemo(),
                                      ),
                                    );
                                  },
                                  onDonateTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const XemBaiDangKhoKhanDemo()),
                                    );
                                  },
                                ),
                              ),
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
                              // You can add more CustomCardWidgets here as needed
                            ],
                          ),
                        ),
                      ),
                      IntrinsicHeight(
                        child: Container(
                          margin: const EdgeInsets.only(
                            top: 10,
                            bottom: 10,
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
                      Container(
                        margin: const EdgeInsets.only(bottom: 10, left: 2),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 390, // Set a fixed width for each card
                                child: CustomCardWidget2(
                                  imagePath2: "assets/rectangle_18.png",
                                  label2: "Người già",
                                  location2: "Quảng Nam",
                                  description2:
                                      "Hỗ trợ hoàn cảnh khó khăn ở xóm Hộ Sơn \nxã Nam Tiến",
                                  onCardTap2: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const XemBaiDangKhoKhan2(),
                                      ),
                                    );
                                  },
                                  onDonateTap2: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const Donate()),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 388, // Set a fixed width for each card
                                child: CustomCardWidget2(
                                  imagePath2: "assets/nguoikhokhan2.jpg",
                                  label2: "Người già",
                                  location2: "TP. HCM",
                                  description2:
                                      "3 CHA CON SỐNG TRONG CĂN NHÀ 2M2,\nCƠM ĂN BỮA ĐÓI BỮA NO",
                                  onCardTap2: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const XemBaiDangKhoKhan2(),
                                      ),
                                    );
                                  },
                                  onDonateTap2: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const Donate()),
                                    );
                                  },
                                ),
                              ),
                              // You can add more CustomCardWidgets here as needed
                            ],
                          ),
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
      ),
    );
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
                            "Giúp đỡ",
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

class CustomCardWidget2 extends StatelessWidget {
  final String imagePath2;
  final String label2;
  final String location2;
  final String description2;
  final VoidCallback onCardTap2;
  final VoidCallback onDonateTap2;

  const CustomCardWidget2({
    super.key,
    required this.imagePath2,
    required this.label2,
    required this.location2,
    required this.description2,
    required this.onCardTap2,
    required this.onDonateTap2,
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
                  onTap: onCardTap2,
                  child: Image.asset(
                    imagePath2,
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
                          label2,
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
                            location2,
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
                      description2,
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
                    onTap: onDonateTap2,
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
