import 'package:tester/src/views/ayns/ViewUI2.dart';
import 'package:tester/src/views/user_donate/user_donate_screen.dart';
import 'package:flutter/material.dart';

class PostVideoTestPageId8 extends StatelessWidget {
  const PostVideoTestPageId8({super.key});

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
                          // --- HEADER IMAGE (Thumbnail ID 8) ---
                          Container(
                            padding: const EdgeInsets.only(
                                top: 10, bottom: 28, right: 7),
                            height: 230,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/videos/image_8.png"), 
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
                                                  "Người già", // Tag ID 8
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
                                IntrinsicHeight(
                                  child: Container(
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
                                            "assets/images/location.png",
                                            fit: BoxFit.fill,
                                          )),
                                      const Expanded(
                                        child: IntrinsicHeight(
                                          child: SizedBox(
                                            width: double.infinity,
                                            child: Text(
                                              "Thủ Đức", // Location ID 8
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
                                ),
                              ],
                            ),
                          ),
                          
                          // --- TITLE CARD ---
                          IntrinsicHeight(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 23),
                              margin: const EdgeInsets.only(bottom: 15),
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFFCCE7FF),
                                    Color(0xFFB3D8FF),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    spreadRadius: 2,
                                    blurRadius: 10,
                                    offset: const Offset(0, 5),
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
                                      "GÁNH HÀNG RONG TUỔI 70: BÀ CỤ BÁN TỪNG BỊCH SƠ RI, DÂU TẰM MƯU SINH", // Caption ID 8 Uppercase
                                      style: TextStyle(
                                        color: Color(0xFF2A2A2A),
                                        fontSize: 18, 
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 0.8,
                                        height: 1.5,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          // --- USER INFO ---
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
                                    borderRadius: BorderRadius.circular(30),
                                    child: Image.asset(
                                      "assets/videos/image_8_8.jpeg", // Avatar ID 8
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
                                            "saigonhoale.vn", // Name ID 8
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
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              SizedBox(
                                                width: 20,
                                                height: 20,
                                                child: Image.asset(
                                                  "assets/images/chuahoanthanh.png",
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              const SizedBox(width: 5),
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
                                      ],
                                    ),
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
                          
                          // --- STATS ---
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
                              "Tiền mặt: 2,000,000 VND", // Current Amount ID 8
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
                              "Ngày đăng: 22/11/2025", // Date ID 8
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
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Thời gian: 29 ngày",
                                  style: TextStyle(
                                    color: Color(0xFF675F5F),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 5),
                                Icon(
                                  Icons.access_time,
                                  color: Color(0xFF675F5F),
                                  size: 20,
                                ),
                              ],
                            ),
                          ),

                          // --- BUTTONS ---
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const DonateScreen()),
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
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const ViewUI2(),
                                          ),
                                        );
                                      },
                                      child: IntrinsicHeight(
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
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
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
                                          ],
                                        ),
                                      ),
                                    ),
                                  ]),
                            ),
                          ),

                          // --- DESCRIPTION ---
                          Container(
                            margin: const EdgeInsets.only(bottom: 17, left: 14),
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
                                        "Bà Tư năm nay đã ngoài 70, ngày ngày ngồi góc đường bán từng bịch sơ ri, dâu tây, hũ mứt dâu tằm tự làm. Lời lãi chẳng bao nhiêu nhưng là nguồn sống duy nhất để bà trang trải tiền nhà trọ và thuốc thang tuổi già. Mong mọi người ghé ủng hộ bà.", // Description ID 8
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.justify,
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
                                    text: "TP. Thủ Đức, TP.HCM", // Address ID 8
                                    style: TextStyle(
                                      color: Colors.black,
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
                              textAlign: TextAlign.left,
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
                                    text: "Ông Phạm Văn Ba\n", // Tên giả định
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        "Chức vụ: Tổ trưởng tổ dân phố 5, P.Tam Bình\n",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "Số điện thoại Zalo : 0903987654\n",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "Số CCCD : 079065004321",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          
                          // --- EVIDENCE IMAGES ---
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

                          IntrinsicHeight(
                            child: Container(
                              margin: const EdgeInsets.only(
                                  bottom: 19, left: 42, right: 42),
                              width: double.infinity,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              content: Image.asset(
                                                "assets/videos/image_8.png", // Thumb ID 8
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
                                            "assets/videos/image_8.png",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    GestureDetector(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              content: Image.asset(
                                                "assets/videos/image_8_8.jpeg", // Avatar ID 8
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
                                            "assets/videos/image_8_8.jpeg",
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

                          IntrinsicHeight(
                            child: Container(
                              margin: const EdgeInsets.only(
                                  bottom: 19, left: 42, right: 42),
                              width: double.infinity,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              content: Image.asset(
                                                "assets/videos/image_8.png",
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
                                            "assets/videos/image_8.png",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    GestureDetector(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              content: Image.asset(
                                                "assets/videos/image_8_8.jpeg",
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
                                            "assets/videos/image_8_8.jpeg",
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
                          
                          // --- COMMENTS ---
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