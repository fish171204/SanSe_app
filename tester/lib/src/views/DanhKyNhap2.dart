import 'package:tester/src/views/FormDkyHT.dart';
import 'package:tester/src/views/FormDkyKK.dart';
import 'package:flutter/material.dart';

class Dangkynhap2 extends StatefulWidget {
  const Dangkynhap2({super.key});

  @override
  _Dangkynhap2State createState() => _Dangkynhap2State();
}

class _Dangkynhap2State extends State<Dangkynhap2> {
  String? selectedRole;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white,
          ),
          Column(
            children: [
              // Ảnh nền
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.52,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: const AssetImage("assets/sapa41_welcome.jpg"),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.3),
                      BlendMode.darken,
                    ),
                  ),
                ),
              ),

              // Phần nội dung đăng ký (bo góc & nổi lên trên)
              Expanded(
                child: Transform.translate(
                  offset: const Offset(0, -27),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          blurRadius: 12,
                          spreadRadius: 3,
                          offset: const Offset(0, -3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Nút quay lại & tiêu đề
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.arrow_back, size: 28),
                              onPressed: () => Navigator.pop(context),
                            ),
                            const Padding(
                              padding: EdgeInsets.fromLTRB(60, 0, 0, 0),
                              child: Text(
                                "ĐĂNG KÝ",
                                style: TextStyle(
                                  fontFamily: "Inter",
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff676060),
                                ),
                              ),
                            ),
                            Image.asset(
                              "assets/logo.png",
                              height: 50,
                              width: 100,
                            )
                          ],
                        ),

                        const SizedBox(height: 20),

                        // Câu hỏi chọn loại tài khoản
                        const Center(
                          child: Text(
                            "Bạn đăng ký loại tài khoản nào?",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          ),
                        ),

                        const SizedBox(height: 20),

                        // Danh sách loại tài khoản
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
                                      content: Text(
                                          'Vui lòng chọn loại tài khoản.')),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                            ),
                            child: const Text(
                              "Đăng ký",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 25,
                                fontFamily: "WorkSans",
                                fontWeight: FontWeight.w700,
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
        ],
      ),
    );
  }

  // Tạo danh sách lựa chọn tài khoản
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
