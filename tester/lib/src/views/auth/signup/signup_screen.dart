import 'package:flutter/material.dart';
import 'package:tester/src/views/auth/signup/signup_type_screen.dart';
import 'package:tester/src/views/MainNguoiKK.dart';

import 'package:tester/src/views/MainNhaHT.dart';
import 'package:tester/src/views/SharedPreferences.dart';
import 'package:flutter/gestures.dart';
import 'package:tester/src/views/admin/admin_screen.dart';

//
class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

bool _isPasswordHidden = true;

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _cccdController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() async {
    String cccd = _cccdController.text.trim();
    String password = _passwordController.text.trim();

    if (cccd == "admin" && password == "admin") {
      await SharedPreferencesHelper.setLoginStatus(true, "admin");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const AdminScreen()),
      );
    } else if (cccd == "nguoikhokhan" && password == "nguoikhokhan") {
      // Lưu trạng thái đăng nhập vào SharedPreferences
      await SharedPreferencesHelper.setLoginStatus(true, "nguoikhokhan");

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainNguoiKK()),
      );
    } else if (cccd == "045304004088" && password == "nguoikhokhan") {
      // Lưu trạng thái đăng nhập vào SharedPreferences
      await SharedPreferencesHelper.setLoginStatus(true, "nguoikhokhan");

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainNguoiKK()),
      );
    } else if (cccd == "nhahaotam" && password == "nhahaotam") {
      // Lưu trạng thái đăng nhập vào SharedPreferences
      await SharedPreferencesHelper.setLoginStatus(true, "nhahaotam");

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainNguoiHT()),
      );
    } else if (cccd == "054204003257" && password == "nhahaotam") {
      // Lưu trạng thái đăng nhập vào SharedPreferences
      await SharedPreferencesHelper.setLoginStatus(true, "nhahaotam");

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainNguoiHT()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Sai số CCCD hoặc mật khẩu")),
      );
    }
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordHidden = !_isPasswordHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                  child: Text(
                    "ĐĂNG NHẬP",
                    style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff676060)),
                  ),
                ),
                SizedBox(
                  width: 300,
                  height: 250,
                  child: Image.asset("assets/images/logo.png"),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 0, 40, 10),
                  child: TextField(
                    controller: _cccdController,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: "WorkSans",
                    ),
                    decoration: InputDecoration(
                      suffixIcon: Image.asset(
                        "assets/images/cccd.png",
                        width: 10,
                        color: const Color(0xFF676060),
                      ),
                      labelText: "Nhập số CCCD",
                      labelStyle: const TextStyle(
                        fontFamily: "WorkSans",
                        color: Colors.black,
                        fontSize: 18,
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          width: 1,
                          color: Colors.black,
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          width: 2,
                          color: Colors.blue,
                        ),
                      ),
                      disabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          width: 1,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 20, 40, 0),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: _isPasswordHidden,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: "WorkSans",
                    ),
                    decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        onTap: _togglePasswordVisibility,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Image.asset(
                            _isPasswordHidden
                                ? "assets/images/icon_password.png"
                                : "assets/images/mat.png",
                            width: 24,
                            height: 24,
                          ),
                        ),
                      ),
                      labelText: "Nhập mật khẩu",
                      labelStyle: const TextStyle(
                        fontFamily: "WorkSans",
                        color: Colors.black,
                        fontSize: 18,
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          width: 1,
                          color: Colors.black,
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          width: 2,
                          color: Colors.blue,
                        ),
                      ),
                      disabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          width: 1,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 40, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Quên mật khẩu",
                        style: TextStyle(
                            color: Color(0xFF0866FF),
                            fontFamily: "Inter",
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.italic,
                            decoration: TextDecoration.underline,
                            decorationColor: Color(0xFF0866FF),
                            decorationThickness: 0.5),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 30, 40, 20),
                  child: SizedBox(
                    width: 330,
                    height: 70,
                    child: ElevatedButton(
                        onPressed: _login,
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white),
                        child: const Text(
                          "Đăng nhập",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 25,
                              fontFamily: "WorkSans",
                              fontWeight: FontWeight.w700),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      const Divider(
                        thickness: 1,
                        height: 20,
                        color: Colors.grey,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        color: Colors.white,
                        child: const Text(
                          "hoặc",
                          style: TextStyle(
                            fontFamily: "WorkSans",
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(80, 15, 80, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            border: Border.all(color: Colors.black, width: 2)),
                        child: Image.asset("assets/images/icon_fb.png"),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          border: Border.all(color: Colors.black, width: 2),
                        ),
                        height: 60,
                        width: 60,
                        child: Image.asset("assets/images/ic_gg.png"),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: "Bạn chưa có tài khoản? ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontFamily: "WorkSans",
                          ),
                        ),
                        TextSpan(
                          text: "Tạo tài khoản",
                          style: const TextStyle(
                            color: Color(0xFF0866FF),
                            fontSize: 18,
                            fontFamily: "WorkSans",
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const SignupTypeScreen(),
                                ),
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
