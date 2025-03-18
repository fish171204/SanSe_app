import 'package:tester/src/resources/FormDkyHT.dart';
import 'package:tester/src/resources/FormDkyKK.dart';
import 'package:flutter/material.dart';

class Dangkynhap2 extends StatefulWidget {
  const Dangkynhap2({super.key});

  @override
  _Dangkynhap2State createState() => _Dangkynhap2State();
}

class _Dangkynhap2State extends State<Dangkynhap2> {
  String? selectedRole; // Giá trị lưu loại tài khoản được chọn

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                // Nút quay lại & tiêu đề
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, size: 28),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const SizedBox(
                      width: 60,
                    ),
                    const Expanded(
                      child: Text(
                        "ĐĂNG KÝ",
                        style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff676060)),
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  width: 300,
                  height: 250,
                  child: Image.asset("assets/logo.png"),
                ),

                const SizedBox(height: 20),

                // Câu hỏi đăng ký loại tài khoản
                const Text(
                  "Bạn đăng ký loại tài khoản nào?",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 20),

                // Danh sách loại tài khoản (ListTile với Radio)
                _buildRadioTile("Người khó khăn", "nguoi_kho_khan"),
                _buildRadioTile("Nhà hảo tâm", "nha_hao_tam"),
                _buildRadioTile("Người hỗ trợ", "nguoi_ho_tro"),

                const Spacer(),

                // Nút đăng ký
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        if (selectedRole == "nha_hao_tam") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const FormDKyHT()),
                          );
                        } else if (selectedRole == "nguoi_kho_khan") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const FormDKyKK()),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Vui lòng chọn loại tài khoản.')),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white),
                      child: const Text(
                        "Đăng ký",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 25,
                            fontFamily: "WorkSans",
                            fontWeight: FontWeight.w700),
                      )),
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Hàm tạo danh sách lựa chọn tài khoản
  Widget _buildRadioTile(String title, String value) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: RadioListTile<String>(
        title: Text(title, style: const TextStyle(fontSize: 16)),
        value: value,
        groupValue: selectedRole,
        activeColor: Colors.blue,
        onChanged: (val) {
          setState(() {
            selectedRole = val;
          });
        },
      ),
    );
  }
}
