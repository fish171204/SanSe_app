import 'package:tester/src/Ayns/GD2.dart';
import 'package:tester/src/Ayns/ViewUI2.dart';
import 'package:tester/src/Ayns/mainTestKK.dart';
import 'package:tester/src/resources/pages/DsGiupDo1.dart';
import 'package:tester/src/resources/pages/MainNguoiKK.dart';
import 'package:tester/src/resources/pages/MainNhaHT.dart';
import 'package:tester/src/resources/pages/DangKyNhap.dart';
import 'package:tester/src/resources/pages/SharedPreferences.dart';
import 'package:flutter/material.dart';
import 'package:tester/src/resources/pages/Donate.dart';

class GD1 extends StatelessWidget {
  const GD1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          constraints: const BoxConstraints.expand(),
          color: const Color(0xFFFFFFFF),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color(0xFFFFFFFF),
                  ),
                  width: double.infinity,
                  height: double.infinity,
                  child: SingleChildScrollView(
                      padding: const EdgeInsets.only(top: 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                                top: 10, bottom: 28, right: 7),
                            height: 230,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/HinhAnh_Demo.jpg"),
                                  fit: BoxFit.cover),
                            ),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  IntrinsicHeight(
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          bottom: 94, left: 25),
                                      width: double.infinity,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.pop(
                                                  context); // Quay lại màn hình trước đó
                                            },
                                            child: Container(
                                              margin: const EdgeInsets.only(
                                                  top: 12),
                                              width: 35,
                                              height: 32,
                                              child: Image.asset(
                                                "assets/quaylai.png",
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                          const Expanded(
                                            child: SizedBox(
                                              width: double.infinity,
                                              child: SizedBox(),
                                            ),
                                          ),
                                          IntrinsicHeight(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                color: const Color(0xFFE9E9E9),
                                              ),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10),
                                              width: 85,
                                              child: const Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "Trẻ em",
                                                    style: TextStyle(
                                                      color: Color(0xFFFF0303),
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: const Color(0xFFEAEAEA),
                                    ),
                                    padding: const EdgeInsets.only(
                                        top: 8, bottom: 8, left: 8, right: 5),
                                    margin: const EdgeInsets.only(left: 300),
                                    width: 120,
                                    height: 36,
                                    child: Row(children: [
                                      Container(
                                          margin:
                                              const EdgeInsets.only(right: 8),
                                          width: 14,
                                          height: 20,
                                          child: Image.asset(
                                            "assets/location.png",
                                            fit: BoxFit.fill,
                                          )),
                                      const Expanded(
                                        child: IntrinsicHeight(
                                          child: SizedBox(
                                            width: double.infinity,
                                            child: Text(
                                              "Bình Định",
                                              style: TextStyle(
                                                color: Color(0xFFFF0303),
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ]),
                                  ),
                                ]),
                          ),
                          IntrinsicHeight(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 23),
                              margin: const EdgeInsets.only(bottom: 15),
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(
                                        0xFFCCE7FF), // Soft light blue gradient start
                                    Color(
                                        0xFFB3D8FF), // Slightly deeper blue for a smoother effect
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                // No borderRadius here to keep the sharp corners
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    spreadRadius: 2,
                                    blurRadius: 10,
                                    offset: const Offset(0, 5), // Depth effect
                                  ),
                                ],
                              ),
                              width: double.infinity,
                              child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: double.infinity,
                                    child: Text(
                                      "TÍNH MẠNG MONG MANH CỦA BÉ GÁI 3 TUỔI MẮC BỆNH XƠ GAN",
                                      style: TextStyle(
                                        color: Color(
                                            0xFF2A2A2A), // Dark grey for good contrast and readability
                                        fontSize:
                                            18, // Larger font size for easier reading
                                        fontWeight: FontWeight
                                            .w600, // Slightly lighter font weight for modern look
                                        letterSpacing:
                                            0.8, // Spacious letters for a clean design
                                        height:
                                            1.5, // Better line height for readability
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          IntrinsicHeight(
                            child: Container(
                              margin: const EdgeInsets.only(
                                  bottom: 2, left: 14, right: 14),
                              width: double.infinity,
                              child: Row(children: [
                                Container(
                                  margin: const EdgeInsets.only(right: 11),
                                  width: 64,
                                  height: 60,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        30), // Adjust the radius for desired roundness
                                    child: Image.asset(
                                      "assets/HinhAnh_Demo1.jpg",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                IntrinsicHeight(
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 70),
                                    width: 153,
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(
                                                bottom: 5),
                                            child: const Text(
                                              "Le Thi Thuy Kieu",
                                              style: TextStyle(
                                                color: Color(0xFF0866FF),
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin:
                                                const EdgeInsets.only(right: 6),
                                            child: Row(
                                              mainAxisSize: MainAxisSize
                                                  .min, // This ensures the row takes the minimum space required by its children
                                              children: [
                                                SizedBox(
                                                  width: 20,
                                                  height: 20,
                                                  child: Image.asset(
                                                    "assets/dahoanthanh.png",
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                                const SizedBox(
                                                    width:
                                                        5), // Space between the image and the text
                                                const Text(
                                                  "Đã hoàn thành",
                                                  style: TextStyle(
                                                    color: Color(0xFFFF0303),
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),

                                          // const Text(
                                          //   "Ngày đăng: 01/09/2024",
                                          //   style: TextStyle(
                                          //     color: Color(0xFFAEA7A7),
                                          //     fontSize: 13,
                                          //     fontWeight: FontWeight.bold,
                                          //   ),
                                          // ),
                                        ]),
                                  ),
                                ),
                                SizedBox(
                                    width: 40,
                                    height: 38,
                                    child: Image.asset(
                                      "assets/zalo.png",
                                      fit: BoxFit.fill,
                                    )),
                              ]),
                            ),
                          ),
                          IntrinsicHeight(
                            child: Container(
                              margin: const EdgeInsets.only(
                                  bottom: 0, left: 65, right: 30),
                              width: double.infinity,
                              child: const Row(children: [
                                Expanded(
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: SizedBox(),
                                  ),
                                ),
                                IntrinsicHeight(
                                  child: Text(
                                    "Thông tin liên lạc",
                                    style: TextStyle(
                                      color: Color(0xFF0866FF),
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ]),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 10, left: 66),
                            child: const Text(
                              "Tiền mặt: 5,000,000 VND",
                              style: TextStyle(
                                color: Color(0xFF675F5F),
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 10, left: 66),
                            child: const Text(
                              "Ngày đăng: 24/12/2024",
                              style: TextStyle(
                                color: Color(0xFF675F5F),
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 10, left: 66),
                            child: const Row(
                              mainAxisSize: MainAxisSize
                                  .min, // Ensures the row sizes based on its children
                              children: [
                                Text(
                                  "Thời gian: 20 ngày",
                                  style: TextStyle(
                                    color: Color(0xFF675F5F),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                    width:
                                        5), // Space between the text and the icon
                                Icon(
                                  Icons.access_time, // Time icon
                                  color: Color(
                                      0xFF675F5F), // Same color as the text
                                  size: 20, // Icon size
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Chuyển đến màn hình Donate khi nhấn vào bất kỳ thành phần nào trong IntrinsicHeight
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const GD2()),
                              );
                            },
                            child: IntrinsicHeight(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color(0xFF3555FF),
                                ),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 18),
                                margin: const EdgeInsets.only(
                                    bottom: 18, left: 20, right: 20),
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IntrinsicHeight(
                                      child: Container(
                                        margin:
                                            const EdgeInsets.only(right: 11),
                                        child: const Text(
                                          "Thông tin nhà hảo tâm",
                                          style: TextStyle(
                                            color: Color(0xFFFFFFFF),
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 14,
                                      height: 12,
                                      child: Image.asset(
                                        "assets/giupdo.png",
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          Container(
                            margin: const EdgeInsets.only(
                                bottom: 17, left: 14, right: 14),
                            child: RichText(
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Mô tả hoàn cảnh:\n",
                                    style: TextStyle(
                                      color: Color(0xFF0866FF),
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        "Chị Lê Thị Thuý Kiều (SN 1991, quê Bình Định) có con gái là cháu Trần Lê Bảo Uyên (SN 2021) bị chẩn đoán mắc chứng teo mật bẩm sinh và phải điều trị hàng tháng. Đến tháng 9/2023, Uyên còn mắc thêm chứng rối loạn đông máu và nhiễm trùng nặng, và được phát hiện bị xơ gan. Gia đình đã đưa Uyên vào Bệnh viện Nhi đồng 2 (TP.HCM), nơi bác sĩ khuyên ghép gan để có cơ hội sống, nhưng chi phí ghép gan quá lớn, vượt khả năng chi trả của gia đình. Hiện tại, chị Kiều phải nghỉ việc để chăm sóc con, còn anh Trần Văn Tài (SN 1991), chồng chị, làm công nhân với lương 7 triệu đồng/tháng, nhưng không đủ để chi trả cho tiền thuốc và viện phí đã lên tới hơn 100 triệu đồng. Gia đình không có nhà riêng và sống cùng bố mẹ chồng, trong khi cả hai bên đều làm nông vất vả, không thể giúp đỡ nhiều. Ngoài Bảo Uyên, vợ chồng chị còn có con gái lớn Trần Lê Như Ngọc (9 tuổi).",
                                    style: TextStyle(
                                      color: Colors
                                          .black, // Change color if necessary
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign
                                  .justify, // Justify the second part of the text
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 17, left: 14),
                            child: RichText(
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Điạ chỉ:\n",
                                    style: TextStyle(
                                      color: Color(0xFF0866FF),
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        "Thôn Tân Lệ, xã Cát Tân, huyện Phù Cát, tỉnh Bình Định",
                                    style: TextStyle(
                                      color:
                                          Colors.black, // Thay đổi màu nếu cần
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 17, left: 14),
                            child: RichText(
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Người hỗ trợ:\n",
                                    style: TextStyle(
                                      color: Color(0xFF0866FF),
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "Không",
                                    style: TextStyle(
                                      color:
                                          Colors.black, // Thay đổi màu nếu cần
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 17, left: 14),
                            child: RichText(
                              textAlign:
                                  TextAlign.left, // Căn trái toàn bộ nội dung
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Người làm chứng:\n",
                                    style: TextStyle(
                                      color: Color(0xFF0866FF),
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "Ông Nguyễn Kim Dũng\n",
                                    style: TextStyle(
                                      color:
                                          Colors.black, // Thay đổi màu nếu cần
                                      fontSize: 16,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        "Chức vụ : Công an Xã Cát Tân,huyện Phù Cát\n",
                                    style: TextStyle(
                                      color:
                                          Colors.black, // Thay đổi màu nếu cần
                                      fontSize: 16,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "Số điện thoại Zalo : 0383416574\n",
                                    style: TextStyle(
                                      color:
                                          Colors.black, // Thay đổi màu nếu cần
                                      fontSize: 16,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "Số CCCD : 054204005258",
                                    style: TextStyle(
                                      color:
                                          Colors.black, // Thay đổi màu nếu cần
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // First label with GestureDetector to show image on tap
                          Container(
                            margin: const EdgeInsets.only(bottom: 17, left: 14),
                            child: const Text(
                              "Xác nhận của cơ quan chức năng:",
                              style: TextStyle(
                                color: Color(0xFF0866FF),
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

// First image with GestureDetector to show the image in full size when tapped
                          IntrinsicHeight(
                            child: Container(
                              margin: const EdgeInsets.only(
                                  bottom: 19, left: 42, right: 42),
                              width: double.infinity,
                              child: SingleChildScrollView(
                                scrollDirection:
                                    Axis.horizontal, // Allows horizontal scroll
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .start, // Aligns images to the start
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        // Show the image in a dialog when tapped
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              content: Image.asset(
                                                "assets/HinhAnh_Demo3.jpg",
                                                fit: BoxFit.cover,
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        width: 200,
                                        height: 200,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          child: Image.asset(
                                            "assets/HinhAnh_Demo3.jpg",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

// Second label
                          Container(
                            margin: const EdgeInsets.only(bottom: 17, left: 14),
                            child: const Text(
                              "Ảnh / Video hiện tại:",
                              style: TextStyle(
                                color: Color(0xFF0866FF),
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

// Second image with GestureDetector for full size view
                          IntrinsicHeight(
                            child: Container(
                              margin: const EdgeInsets.only(
                                  bottom: 19, left: 42, right: 42),
                              width: double.infinity,
                              child: SingleChildScrollView(
                                scrollDirection:
                                    Axis.horizontal, // Allows horizontal scroll
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .start, // Align images to the start
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        // Show the image in a dialog when tapped
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              content: Image.asset(
                                                "assets/HinhAnh_Demo1.jpg",
                                                fit: BoxFit.cover,
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        width: 200,
                                        height: 200,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          child: Image.asset(
                                            "assets/HinhAnh_Demo1.jpg",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                        width: 20), // Space between images
                                    GestureDetector(
                                      onTap: () {
                                        // Show the image in a dialog when tapped
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              content: Image.asset(
                                                "assets/HinhAnh_Demo2.jpeg",
                                                fit: BoxFit.cover,
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        width: 200,
                                        height: 200,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          child: Image.asset(
                                            "assets/HinhAnh_Demo2.jpeg",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 5, left: 22),
                            child: const Text(
                              "Bình luận",
                              style: TextStyle(
                                color: Color(0xFF2992D2),
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            color: const Color(0xFFEAEAEA),
                            padding: const EdgeInsets.only(
                                top: 10, bottom: 33, right: 7),
                            margin: const EdgeInsets.only(
                                bottom: 16, left: 21, right: 21),
                            width: 550,
                            height: 90,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        bottom: 8, left: 7),
                                    child: const Text(
                                      "Viết bình luận của bạn",
                                      style: TextStyle(
                                        color: Color(0xFF675F5F),
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ]),
                          ),
                          // Container(
                          //   margin: const EdgeInsets.only(
                          //       bottom: 10, left: 22, right: 22),
                          //   width: double.infinity,
                          //   child: const Text(
                          //     "Trần Thị B\n02/09/2024\nMong rằng gia đình chị sẽ sớm có một cuốc sống tốt hơn!",
                          //     style: TextStyle(
                          //       color: Color(0xFFAEA7A7),
                          //       fontSize: 15,
                          //     ),
                          //   ),
                          // ),
                          // Container(
                          //   margin: const EdgeInsets.symmetric(horizontal: 22),
                          //   width: double.infinity,
                          //   child: const Text(
                          //     "Lê Văn C\n03/09/2024\nTôi đã ủng hộ 1 triệu đồng, hy vọng sẽ có nhiều người chung tay giúp đỡ hơn.",
                          //     style: TextStyle(
                          //       color: Color(0xFFAEA7A7),
                          //       fontSize: 15,
                          //     ),
                          //   ),
                          // ),
                        ],
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
