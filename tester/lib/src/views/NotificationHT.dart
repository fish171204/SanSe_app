import 'package:flutter/material.dart';
import 'package:tester/src/views/DangKyNhap.dart';

/* da xem*/
class NotificationHT extends StatelessWidget {
  const NotificationHT({super.key});
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
                    borderRadius: BorderRadius.circular(32),
                    color: const Color(0xFFFFFFFF),
                  ),
                  width: double.infinity,
                  height: double.infinity,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.only(top: 28),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Header section with logo and title
                        IntrinsicHeight(
                          child: Container(
                            margin: const EdgeInsets.only(
                                bottom: 25, left: 80, right: 55),
                            width: double.infinity,
                            child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "CỘNG ĐỒNG SAN SẺ",
                                    style: TextStyle(
                                      color: Color(0xFFFF4545),
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ]),
                          ),
                        ),
                        // Image section
                        Container(
                          margin: const EdgeInsets.only(
                              bottom: 65, left: 89, right: 89),
                          height: 197,
                          width: double.infinity,
                          child: Image.asset(
                            "assets/thongbaodangky.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                        // Success text
                        Container(
                          margin: const EdgeInsets.only(bottom: 17, left: 100),
                          child: const Text(
                            "Đăng ký thành công!",
                            style: TextStyle(
                              color: Color(0xFF0866FF),
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        // Description text
                        Container(
                          margin: const EdgeInsets.only(
                              bottom: 250, left: 31, right: 31),
                          width: double.infinity,
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: const TextStyle(
                                color: Color(
                                    0xFF090A0A), // Default color for the rest of the text
                                fontSize: 18,
                              ),
                              children: [
                                const TextSpan(
                                  text:
                                      "Chúc mừng bạn đã trở thành nhà hảo tâm của ",
                                ),
                                TextSpan(
                                  text: "Cộng đồng San Sẻ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        18, // You can adjust the font size here
                                    foreground: Paint()
                                      ..shader = const LinearGradient(
                                        colors: [
                                          Color(0xFFFF4545),
                                          Color(0xFFFF4545)
                                        ], // Gradient with the same color
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ).createShader(const Rect.fromLTWH(
                                          0.0, 0.0, 200.0, 70.0)),
                                  ),
                                ),
                                const TextSpan(
                                  text:
                                      "! Những đóng góp của bạn sẽ tạo ra sự khác biệt lớn trong cuộc sống của những người cần giúp đỡ.",
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Login Button
                        GestureDetector(
                          onTap: () {
                            // Navigate to DangKyNhap screen
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const Dangkynhap()), // Ensure DangKyNhap.dart is imported
                            );
                          },
                          child: IntrinsicHeight(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: const Color(0xFF0866FF),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0x40000000),
                                    blurRadius: 4,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 80),
                              width: double.infinity,
                              child: const Column(
                                children: [
                                  Text(
                                    "Đăng nhập",
                                    style: TextStyle(
                                      color: Color(0xFFFFFFFF),
                                      fontSize: 24,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
