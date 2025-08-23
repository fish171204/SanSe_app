import 'package:tester/src/views/Donate.dart';
import 'package:flutter/material.dart';

class XemBaiDangKhoKhan2 extends StatelessWidget {
  const XemBaiDangKhoKhan2({super.key});

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
                                  image: AssetImage("assets/images/nguoikhokhan1.jpg"),
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
                                              // Go back to the previous screen
                                              Navigator.pop(context);
                                            },
                                            child: Container(
                                              margin: const EdgeInsets.only(
                                                  top: 12),
                                              width: 35,
                                              height: 32,
                                              child: Image.asset(
                                                "assets/images/quaylai.png",
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
                                                    "Người già",
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
                                    margin: const EdgeInsets.only(left: 320),
                                    width: 93,
                                    height: 36,
                                    child: Row(children: [
                                      Container(
                                          margin:
                                              const EdgeInsets.only(right: 8),
                                          width: 14,
                                          height: 20,
                                          child: Image.asset(
                                            "assets/images/location.png",
                                            fit: BoxFit.fill,
                                          )),
                                      const Expanded(
                                        child: IntrinsicHeight(
                                          child: SizedBox(
                                            width: double.infinity,
                                            child: Text(
                                              "TP.HCM",
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
                                      "3 CHA CON SỐNG TRONG CĂN NHÀ 2M2, CƠM ĂN BỮA ĐÓI BỮA NO",
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
                                  bottom: 8, left: 14, right: 14),
                              width: double.infinity,
                              child: Row(children: [
                                Container(
                                    margin: const EdgeInsets.only(right: 11),
                                    width: 42,
                                    height: 40,
                                    child: Image.asset(
                                      "assets/images/onghuy.png",
                                      fit: BoxFit.fill,
                                    )),
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
                                              "Nguyễn Văn Huy",
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
                                                    "assets/images/chuahoanthanh.png",
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                                const SizedBox(
                                                    width:
                                                        5), // Space between the image and the text
                                                const Text(
                                                  "Chưa hoàn thành",
                                                  style: TextStyle(
                                                    color: Color(0xFFFF0303),
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ]),
                                  ),
                                ),
                                SizedBox(
                                    width: 40,
                                    height: 38,
                                    child: Image.asset(
                                      "assets/images/zalo.png",
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
                              "Tiền mặt: 20,000,000 VND",
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
                              "Ngày đăng: 01/04/2025",
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
                                    builder: (context) => const Donate()),
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
                                          "Giúp đỡ",
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
                                        "assets/images/giupdo.png",
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          IntrinsicHeight(
                            child: Container(
                              margin: const EdgeInsets.only(
                                  bottom: 26, left: 20, right: 20),
                              width: double.infinity,
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IntrinsicHeight(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          color: const Color(0xFF3555FF),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Color(0x40000000),
                                              blurRadius: 4,
                                              offset: Offset(0, 4),
                                            ),
                                          ],
                                        ),
                                        padding: const EdgeInsets.only(
                                            top: 15,
                                            bottom: 15,
                                            left: 26,
                                            right: 26),
                                        width: 150,
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const IntrinsicHeight(
                                                child: Text(
                                                  "Lịch sử",
                                                  style: TextStyle(
                                                    color: Color(0xFFFFFFFF),
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                  width: 18,
                                                  height: 18,
                                                  child: Image.asset(
                                                    "assets/images/lichsu.png",
                                                    fit: BoxFit.fill,
                                                  )),
                                            ]),
                                      ),
                                    ),
                                    IntrinsicHeight(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          color: const Color(0xFF3555FF),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Color(0x40000000),
                                              blurRadius: 4,
                                              offset: Offset(0, 4),
                                            ),
                                          ],
                                        ),
                                        padding: const EdgeInsets.only(
                                            top: 13,
                                            bottom: 13,
                                            left: 18,
                                            right: 18),
                                        width: 148,
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(
                                                  width: 22,
                                                  height: 22,
                                                  child: Image.asset(
                                                    "assets/images/chiase.png",
                                                    fit: BoxFit.fill,
                                                  )),
                                              const IntrinsicHeight(
                                                child: Text(
                                                  "Chia sẻ",
                                                  style: TextStyle(
                                                    color: Color(0xFFFFFFFF),
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ]),
                                      ),
                                    ),
                                  ]),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 17, left: 14),
                            child: RichText(
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Mô tả hoàn cảnh:\n",
                                    style: TextStyle(
                                      color: Color(0xFF0866FF),
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        "3 cha con sống trong căn nhà 2M2, cơm bữa đói bữa no.Căn nhà Chừng 2m vuông là diện tích căn phòng trọ của gia đình em Duyên. Ba em làm nghề nhặt ve chai, bán cốc sạc điện thoại trên vỉa hè. Những ngày ba buôn bán không thuận lợi, bữa ăn cũng chỉ đơn sơ cơm trộn mì gói.\n“Bữa nào ba con làm không được thì con với ba nhịn à, ngủ cho nó qua cơn đói” - Duyên chia sẻ.",
                                    style: TextStyle(
                                      color:
                                          Colors.black, // Thay đổi màu nếu cần
                                      fontSize: 14,
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
                                    text: "Điạ chỉ:\n",
                                    style: TextStyle(
                                      color: Color(0xFF0866FF),
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        "Ông Nguyễn Văn Huy ở 33B, Phùng Khắc Khoan, Phường Ða Kao, Quận 1, Sài Gòn – TP HCM.",
                                    style: TextStyle(
                                      color:
                                          Colors.black, // Thay đổi màu nếu cần
                                      fontSize: 14,
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
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        "Bà Nguyễn Thị Bé ở 50, Phùng Khắc Khoan, Phường Ða Kao, Quận 1, Sài Gòn – TP HCM.\nSDT: 0286473945",
                                    style: TextStyle(
                                      color:
                                          Colors.black, // Thay đổi màu nếu cần
                                      fontSize: 14,
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
                                    text: "Người làm chứng:\n",
                                    style: TextStyle(
                                      color: Color(0xFF0866FF),
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        "Ông Nguyễn Văn An ở 34B, Phùng Khắc Khoan, Phường Ða Kao, Quận 1, Sài Gòn – TP HCM.\nSDT: 04657294756",
                                    style: TextStyle(
                                      color:
                                          Colors.black, // Thay đổi màu nếu cần
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 17, left: 14),
                            child: const Text(
                              "Ảnh / Video hiện tại:",
                              style: TextStyle(
                                color: Color(0xFF0866FF),
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          IntrinsicHeight(
                            child: Container(
                              margin: const EdgeInsets.only(
                                  bottom: 19, left: 42, right: 42),
                              width: double.infinity,
                              child: SingleChildScrollView(
                                scrollDirection:
                                    Axis.horizontal, // Cho phép scroll ngang
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .start, // Đảm bảo ảnh không bị đẩy ra ngoài
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      width: 200, // Tăng kích thước ảnh
                                      height: 200, // Tăng kích thước ảnh
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(30),
                                        child: Image.asset(
                                          "assets/images/nguoikhokhan2.jpg",
                                          fit: BoxFit
                                              .cover, // Đảm bảo ảnh không bị méo
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                        width: 20), // Khoảng cách giữa các ảnh
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      width: 200, // Tăng kích thước ảnh
                                      height: 200, // Tăng kích thước ảnh
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(30),
                                        child: Image.asset(
                                          "assets/images/nguoikhokhan3.jpg",
                                          fit: BoxFit
                                              .cover, // Đảm bảo ảnh không bị méo
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
                          Container(
                            margin: const EdgeInsets.only(
                                bottom: 10, left: 22, right: 22),
                            width: double.infinity,
                            child: const Text(
                              "Trần Thị B\n02/09/2024\nMong rằng gia đình chị sẽ sớm có một cuốc sống tốt hơn!",
                              style: TextStyle(
                                color: Color(0xFFAEA7A7),
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 22),
                            width: double.infinity,
                            child: const Text(
                              "Lê Văn C\n03/09/2024\nTôi đã ủng hộ 1 triệu đồng, hy vọng sẽ có nhiều người chung tay giúp đỡ hơn.",
                              style: TextStyle(
                                color: Color(0xFFAEA7A7),
                                fontSize: 15,
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
    );
  }
}
