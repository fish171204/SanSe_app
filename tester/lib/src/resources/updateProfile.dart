import 'package:tester/src/resources/xemProfile.dart';
import 'package:tester/src/resources/MainNguoiKK.dart';
import 'package:flutter/material.dart';
import '../constants/MyColors.dart';
import '../constants/MyFontSize.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  _UpdateProfileState createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  int _currentIndex = 3;

  // Screens corresponding to BottomNavigationBar items
  final List<Widget> _screens = [
    // ignore: prefer_const_constructors
    MainNguoiKK(), // Replace with your actual widget
    const Center(child: Text("Xu hướng")),
    const Center(child: Text("Thông báo")),
    const Center(child: Text("Trang cá nhân")),
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
                    color: const Color(0xFFF6F3F3),
                  ),
                  width: double.infinity,
                  height: double.infinity,
                  child: SingleChildScrollView(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                            top: 36, bottom: 169, left: 24, right: 24),
                        margin: const EdgeInsets.only(bottom: 14),
                        height: 237,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/teamaisc.jpg"),
                              fit: BoxFit.cover),
                        ),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              IntrinsicHeight(
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: const Color(0xFFD2D2D2),
                                    ),
                                    borderRadius: BorderRadius.circular(24),
                                    color: MyColors.surfaceContainerLowest,
                                  ),
                                  padding:
                                      const EdgeInsets.only(left: 9, right: 9),
                                  margin: const EdgeInsets.only(right: 50),
                                  width: 32,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(1),
                                        ),
                                        margin: const EdgeInsets.only(top: 5),
                                        height: 25,
                                        width: 25,
                                        child: GestureDetector(
                                          onTap: () {
                                            // Điều hướng tới màn hình xemProfile.dart
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const Xemprofile()),
                                            );
                                          },
                                          child: Image.asset(
                                            "assets/profile5.png",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const Expanded(
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Text(
                                    "TRANG CÁ NHÂN",
                                    style: TextStyle(
                                      color: MyColors.surfaceContainerLowest,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                      ),
                      Container(
                          margin: const EdgeInsets.only(
                              bottom: 6, left: 21, right: 21),
                          width: 33,
                          height: 28,
                          child: Image.asset(
                            "assets/mayanh.png",
                            fit: BoxFit.cover,
                          )),
                      Container(
                        margin: const EdgeInsets.only(bottom: 12, left: 34),
                        child: const Text(
                          "Tên của bạn",
                          style: TextStyle(
                            color: MyColors.shadow,
                            fontSize: MyFontSize.body_medium,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      IntrinsicHeight(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(0xFFD2D2D2),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                            color: MyColors.surfaceContainerLowest,
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x26F4694C),
                                blurRadius: 14,
                                offset: Offset(0, 0),
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.only(
                              top: 9, bottom: 9, left: 12, right: 12),
                          margin: const EdgeInsets.only(
                              bottom: 21, left: 33, right: 33),
                          width: double.infinity,
                          child: Row(children: [
                            Container(
                                margin: const EdgeInsets.only(right: 19),
                                width: 24,
                                height: 24,
                                child: Image.asset(
                                  "assets/profile1.png",
                                  fit: BoxFit.cover,
                                )),
                            const Expanded(
                              child: SizedBox(
                                width: double.infinity,
                                child: Text(
                                  "Nguyễn Đăng Khoa",
                                  style: TextStyle(
                                    color: MyColors.shadow,
                                    fontSize: MyFontSize.body_medium,
                                  ),
                                ),
                              ),
                            ),
                          ]),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 15, left: 35),
                        child: const Text(
                          "Mật khẩu hiện tại",
                          style: TextStyle(
                            color: MyColors.shadow,
                            fontSize: MyFontSize.body_medium,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      IntrinsicHeight(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(0xFFD2D2D2),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                            color: MyColors.surfaceContainerLowest,
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x26F4694C),
                                blurRadius: 14,
                                offset: Offset(0, 0),
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.only(
                              top: 9, bottom: 9, left: 12, right: 12),
                          margin: const EdgeInsets.only(
                              bottom: 21, left: 33, right: 33),
                          width: double.infinity,
                          child: Row(children: [
                            Container(
                                margin: const EdgeInsets.only(right: 19),
                                width: 24,
                                height: 24,
                                child: Image.asset(
                                  "assets/profile2.png",
                                  fit: BoxFit.cover,
                                )),
                            const Expanded(
                              child: SizedBox(
                                width: double.infinity,
                                child: Text(
                                  "*****************",
                                  style: TextStyle(
                                    color: MyColors.shadow,
                                    fontSize: MyFontSize.body_medium,
                                  ),
                                ),
                              ),
                            ),
                          ]),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 12, left: 33),
                        child: const Text(
                          "Địa chỉ Email",
                          style: TextStyle(
                            color: MyColors.shadow,
                            fontSize: MyFontSize.body_medium,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      IntrinsicHeight(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(0xFFD2D2D2),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                            color: MyColors.surfaceContainerLowest,
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x26F4694C),
                                blurRadius: 14,
                                offset: Offset(0, 0),
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 10, left: 13, right: 13),
                          margin: const EdgeInsets.only(
                              bottom: 23, left: 33, right: 33),
                          width: double.infinity,
                          child: Row(children: [
                            Container(
                                margin: const EdgeInsets.only(right: 17),
                                width: 24,
                                height: 21,
                                child: Image.asset(
                                  "assets/profile3.png",
                                  fit: BoxFit.cover,
                                )),
                            const Expanded(
                              child: SizedBox(
                                width: double.infinity,
                                child: Text(
                                  "2221004199@sv.ufm.edu.vn",
                                  style: TextStyle(
                                    color: MyColors.shadow,
                                    fontSize: MyFontSize.body_medium,
                                  ),
                                ),
                              ),
                            ),
                          ]),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 13, left: 33),
                        child: const Text(
                          "Số điện thoại",
                          style: TextStyle(
                            color: MyColors.shadow,
                            fontSize: MyFontSize.body_medium,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      IntrinsicHeight(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(0xFFD2D2D2),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                            color: MyColors.surfaceContainerLowest,
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x26F4694C),
                                blurRadius: 14,
                                offset: Offset(0, 0),
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 10, left: 13, right: 13),
                          margin: const EdgeInsets.only(
                              bottom: 31, left: 33, right: 33),
                          width: double.infinity,
                          child: Row(children: [
                            Container(
                                margin: const EdgeInsets.only(right: 21),
                                width: 20,
                                height: 25,
                                child: Image.asset(
                                  "assets/profile4.png",
                                  fit: BoxFit.cover,
                                )),
                            const Expanded(
                              child: SizedBox(
                                width: double.infinity,
                                child: Text(
                                  "0393416574",
                                  style: TextStyle(
                                    color: MyColors.shadow,
                                    fontSize: MyFontSize.body_medium,
                                  ),
                                ),
                              ),
                            ),
                          ]),
                        ),
                      ),
                      IntrinsicHeight(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xFFFFB800),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 17),
                          margin: const EdgeInsets.only(
                              bottom: 40, left: 33, right: 33),
                          width: double.infinity,
                          child: const Column(children: [
                            Text(
                              "CẬP NHẬT CHỈNH SỬA",
                              style: TextStyle(
                                color: Color(0xFF512D13),
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]),
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Cập nhật chỉ mục hiện tại
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/Tab_Home.png",
              width: 24,
              height: 24,
            ),
            label: "Trang chủ",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/Tab_XuHuong.png",
              width: 24,
              height: 24,
            ),
            label: "Xu hướng",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/Tab_ThongBao.png",
              width: 24,
              height: 24,
            ),
            label: "Thông báo",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/Tab_TrangCaNhan.png",
              width: 24,
              height: 24,
            ),
            label: "Trang cá nhân",
          ),
        ],
        selectedItemColor: Colors.blue, // Màu của mục được chọn
        unselectedItemColor: Colors.grey, // Màu của mục không được chọn
        type: BottomNavigationBarType.fixed, // Đảm bảo hiển thị đủ các mục
      ),
    );
  }
}
