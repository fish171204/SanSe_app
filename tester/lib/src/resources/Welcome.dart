import 'package:flutter/material.dart';
import 'package:tester/src/resources/DangKyNhap.dart';

/* da xem*/
class Welcome extends StatelessWidget {
  const Welcome({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFECEDEC),
                ),
                width: double.infinity,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        "assets/welcome.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 5, bottom: 50),
                          margin: const EdgeInsets.only(top: 35),
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(
                                    bottom: 20, left: 15, right: 15),
                                width: double.infinity,
                                alignment: Alignment.center,
                                child: const Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Cùng nhau ",
                                        style: TextStyle(
                                          color: Color(0xFF090A0A),
                                          fontSize: 32,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(
                                        text: "SAN SẺ",
                                        style: TextStyle(
                                          fontSize: 32,
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(
                                        text: ",\nkết nối yêu thương",
                                        style: TextStyle(
                                          color: Color(0xFF090A0A),
                                          fontSize: 32,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      bottom: 20,
                      left: 20,
                      right: 20,
                      child: GestureDetector(
                        onTap: () {
                          var push = Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Dangkynhap()),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            color: const Color(0xFF3555FF),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          width: double.infinity,
                          child: const Center(
                            child: Text(
                              "Bắt đầu",
                              style: TextStyle(
                                color: Color(0xFFFFFFFF),
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
