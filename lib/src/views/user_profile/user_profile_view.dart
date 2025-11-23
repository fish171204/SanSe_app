import 'package:tester/src/theme/app_theme/app_theme.dart';
import 'package:tester/src/views/home/home_needy_person.dart';
import 'package:tester/src/views/home/home_benefactor.dart';
import 'package:tester/src/views/auth/login/login_screen.dart';
import 'package:tester/src/views/manage/shared_preferences.dart';
import 'package:tester/src/views/user_profile/user_profile_update.dart';
import 'package:flutter/material.dart';
import '../../theme/app_size.dart';

class UserProfileView extends StatefulWidget {
  const UserProfileView({super.key});

  @override
  _UserProfileViewState createState() => _UserProfileViewState();
}

class _UserProfileViewState extends State<UserProfileView> {
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
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFFF6F3F3),
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
                              margin: const EdgeInsets.only(
                                  bottom: 10, left: 30, right: 50),
                              width: double.infinity,
                              child: Row(children: [
                                IntrinsicHeight(
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 2),
                                    width: 40,
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          IntrinsicHeight(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color:
                                                      const Color(0xFFD2D2D2),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(24),
                                                color: MyColors
                                                    .surfaceContainerLowest,
                                              ),
                                              padding: const EdgeInsets.only(
                                                  left: 9, right: 9),
                                              margin: const EdgeInsets.only(
                                                  top: 20, bottom: 180),
                                              width: double.infinity,
                                              child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () async {
                                                        // Lấy trạng thái đăng nhập và loại tài khoản
                                                        bool isLoggedIn =
                                                            await SharedPreferencesHelper
                                                                .getLoginStatus();
                                                        String? userType =
                                                            await SharedPreferencesHelper
                                                                .getUserType();

                                                        // Điều hướng dựa trên loại tài khoản
                                                        if (isLoggedIn &&
                                                            userType ==
                                                                "nguoikhokhan") {
                                                          Navigator
                                                              .pushReplacement(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        const MainNguoiKK()),
                                                          );
                                                        } else if (isLoggedIn &&
                                                            userType ==
                                                                "045304004088") {
                                                          Navigator
                                                              .pushReplacement(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        const MainNguoiKK()),
                                                          );
                                                        } else if (isLoggedIn &&
                                                            userType ==
                                                                "nhahaotam") {
                                                          Navigator
                                                              .pushReplacement(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        const MainNguoiHT()),
                                                          );
                                                        } else if (isLoggedIn &&
                                                            userType ==
                                                                "054204003257") {
                                                          Navigator
                                                              .pushReplacement(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        const MainNguoiHT()),
                                                          );
                                                        } else {
                                                          // Nếu chưa đăng nhập, điều hướng đến màn hình đăng nhập
                                                          Navigator
                                                              .pushReplacement(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        const LoginScreen()),
                                                          );
                                                        }
                                                      },
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(1),
                                                        ),
                                                        margin: const EdgeInsets
                                                            .only(
                                                            top: 5, bottom: 5),
                                                        height: 25,
                                                        width: 25,
                                                        child: Image.asset(
                                                          "assets/images/profile5.png",
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ]),
                                            ),
                                          ),
                                        ]),
                                  ),
                                ),
                                Expanded(
                                  child: IntrinsicHeight(
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  bottom: 8, left: 40),
                                              width: double.infinity,
                                              child: const Text(
                                                "TRANG CÁ NHÂN",
                                                style: TextStyle(
                                                  color: Color(0xFF512D13),
                                                  fontSize: 23,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(80),
                                                ),
                                                margin: const EdgeInsets.only(
                                                    left: 60),
                                                height: 160,
                                                width: 160,
                                                child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            80),
                                                    child: Image.asset(
                                                      "assets/images/AnhCV.jpg",
                                                      fit: BoxFit.cover,
                                                    ))),
                                          ]),
                                    ),
                                  ),
                                ),
                              ]),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 12, left: 30),
                            child: const Text(
                              "Số điện thoại", // Dòng chữ "Số điện thoại"
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
                                  top: 12, bottom: 12, left: 17, right: 17),
                              margin: const EdgeInsets.only(
                                  bottom: 18, left: 27, right: 27),
                              width: double.infinity,
                              child: Row(children: [
                                Container(
                                    margin: const EdgeInsets.only(right: 20),
                                    width: 18,
                                    height: 18,
                                    child: Image.asset(
                                      "assets/images/phoneprofile.png",
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
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                            ),
                          ),
                          IntrinsicHeight(
                            child: GestureDetector(
                              onTap: () {
                                // Điều hướng tới màn hình updateProfile.dart
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const UserProfileUpdate()),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: const Color(0xFFFFB800),
                                ),
                                padding: const EdgeInsets.only(
                                    top: 13, bottom: 13, left: 80, right: 43),
                                margin: const EdgeInsets.only(
                                    bottom: 27, left: 26, right: 26),
                                width: double.infinity,
                                child: const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "CHỈNH SỬA TRANG CÁ NHÂN",
                                      style: TextStyle(
                                        color: Color(0xFF512D13),
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
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
                                borderRadius: BorderRadius.circular(8),
                                color: MyColors.surfaceContainerLowest,
                              ),
                              padding: const EdgeInsets.only(
                                  top: 10, bottom: 10, left: 9, right: 9),
                              margin: const EdgeInsets.only(
                                  bottom: 12, left: 16, right: 16),
                              width: double.infinity,
                              child: Row(children: [
                                Container(
                                    margin: const EdgeInsets.only(right: 16),
                                    width: 24,
                                    height: 24,
                                    child: Image.asset(
                                      "assets/images/about.png",
                                      fit: BoxFit.cover,
                                    )),
                                const Text(
                                  "About San Sẻ",
                                  style: TextStyle(
                                    color: MyColors.shadow,
                                    fontSize: MyFontSize.body_large,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Expanded(
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: SizedBox(),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(1),
                                    color: MyColors.surfaceContainerLowest,
                                  ),
                                  width: 12,
                                  height: 15,
                                  child: Image.asset(
                                    "assets/images/xanh.png", // Thay thế hình ảnh trong container
                                    fit: BoxFit
                                        .cover, // Điều chỉnh hình ảnh để phủ kín container
                                  ),
                                ),
                              ]),
                            ),
                          ),
                          IntrinsicHeight(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: MyColors.surfaceContainerLowest,
                              ),
                              padding: const EdgeInsets.only(
                                  top: 10, bottom: 10, left: 9, right: 9),
                              margin: const EdgeInsets.only(
                                  bottom: 12, left: 16, right: 16),
                              width: double.infinity,
                              child: Row(children: [
                                Container(
                                    margin: const EdgeInsets.only(right: 14),
                                    width: 24,
                                    height: 24,
                                    child: Image.asset(
                                      "assets/images/help.png",
                                      fit: BoxFit.cover,
                                    )),
                                const Text(
                                  "Trung tâm hỗ trợ",
                                  style: TextStyle(
                                    color: MyColors.shadow,
                                    fontSize: MyFontSize.body_large,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Expanded(
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: SizedBox(),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(1),
                                    color: MyColors.surfaceContainerLowest,
                                  ),
                                  width: 12,
                                  height: 15,
                                  child: Image.asset(
                                    "assets/images/xanh.png", // Thay thế hình ảnh trong container
                                    fit: BoxFit
                                        .cover, // Điều chỉnh hình ảnh để phủ kín container
                                  ),
                                ),
                              ]),
                            ),
                          ),
                          IntrinsicHeight(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: MyColors.surfaceContainerLowest,
                              ),
                              padding: const EdgeInsets.only(
                                  top: 10, bottom: 10, left: 9, right: 9),
                              margin: const EdgeInsets.only(
                                  bottom: 12, left: 16, right: 16),
                              width: double.infinity,
                              child: Row(children: [
                                Container(
                                    margin: const EdgeInsets.only(right: 14),
                                    width: 24,
                                    height: 24,
                                    child: Image.asset(
                                      "assets/images/chat.png",
                                      fit: BoxFit.cover,
                                    )),
                                const Text(
                                  "Chat with San Sẻ",
                                  style: TextStyle(
                                    color: MyColors.shadow,
                                    fontSize: MyFontSize.body_large,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Expanded(
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: SizedBox(),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(1),
                                    color: MyColors.surfaceContainerLowest,
                                  ),
                                  width: 12,
                                  height: 15,
                                  child: Image.asset(
                                    "assets/images/xanh.png", // Thay thế hình ảnh trong container
                                    fit: BoxFit
                                        .cover, // Điều chỉnh hình ảnh để phủ kín container
                                  ),
                                ),
                              ]),
                            ),
                          ),
                          IntrinsicHeight(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: MyColors.surfaceContainerLowest,
                              ),
                              padding: const EdgeInsets.only(
                                  top: 10, bottom: 10, left: 9, right: 9),
                              margin: const EdgeInsets.only(
                                  bottom: 38, left: 16, right: 16),
                              width: double.infinity,
                              child: Row(children: [
                                Container(
                                    margin: const EdgeInsets.only(right: 13),
                                    width: 24,
                                    height: 24,
                                    child: Image.asset(
                                      "assets/images/caidatvang.png",
                                      fit: BoxFit.cover,
                                    )),
                                const Text(
                                  "Cài đặt",
                                  style: TextStyle(
                                    color: MyColors.shadow,
                                    fontSize: MyFontSize.body_large,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Expanded(
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: SizedBox(),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(1),
                                    color: MyColors.surfaceContainerLowest,
                                  ),
                                  width: 12,
                                  height: 15,
                                  child: Image.asset(
                                    "assets/images/xanh.png", // Thay thế hình ảnh trong container
                                    fit: BoxFit
                                        .cover, // Điều chỉnh hình ảnh để phủ kín container
                                  ),
                                ),
                              ]),
                            ),
                          ),
                          IntrinsicHeight(
                            child: GestureDetector(
                              onTap: () {
                                // Điều hướng tới màn hình DangKyNhap.dart
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginScreen()),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: MyColors.surfaceContainerLowest,
                                ),
                                padding: const EdgeInsets.only(
                                    top: 10, bottom: 10, left: 9, right: 9),
                                margin: const EdgeInsets.only(
                                    bottom: 50, left: 16, right: 16),
                                width: double.infinity,
                                child: Row(children: [
                                  Container(
                                      margin: const EdgeInsets.only(right: 11),
                                      width: 24,
                                      height: 24,
                                      child: Image.asset(
                                        "assets/images/logout.png",
                                        fit: BoxFit.cover,
                                      )),
                                  const Expanded(
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: Text(
                                        "Đăng xuất",
                                        style: TextStyle(
                                          color: MyColors.shadow,
                                          fontSize: MyFontSize.body_large,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ]),
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
