import 'package:flutter/material.dart';
import 'package:tester/src/models/user_location/user_district.dart';
import 'package:tester/src/models/user_location/user_ward.dart';
import 'package:tester/src/models/user_location/user_province.dart';
import 'package:tester/src/views/NotificationHT.dart';
import 'package:tester/src/views/widgets/build_combo_box_ward.dart';
import 'package:tester/src/views/widgets/build_combo_box_district.dart';
import 'package:tester/src/views/widgets/build_combo_box_province.dart';

class FormDKyHT extends StatefulWidget {
  const FormDKyHT({super.key});

  @override
  _FormDKyHTState createState() => _FormDKyHTState();
}

class _FormDKyHTState extends State<FormDKyHT> {
  bool _isChecked = false;
  String? _selectedTinhThanh;
  String? _selectedQuanHuyen;
  String? _selectedPhuongXa;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 21, vertical: 18),
                  children: [
                    // Header
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context); // Quay lại màn hình trước
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 11),
                            width: 35,
                            height: 32,
                            child: Image.asset(
                              "assets/images/quaylai.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        const Expanded(
                          child: Text(
                            "Tài khoản nhà hảo tâm",
                            style: TextStyle(
                              color: Color(0xFF000000),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 13),
                    // Form fields (e.g., Số CCCD/CMND, Họ tên, Số điện thoại Zalo, etc.)
                    _buildFormField("Số CCCD/CMND", "054204003257",
                        isRequired: true),
                    _buildFormField("Họ tên", "Nguyễn Đăng Khoa",
                        isRequired: true),
                    _buildFormField("Số điện thoại Zalo", "0393416574",
                        isRequired: true),
                    _buildFormField("Ngày sinh", "17/12/2004",
                        isRequired: true),
                    _buildFormField("Email", "2221004199@sv.ufm.edu.vn"),
                    _buildFormField("Mật khẩu", "nhahaotam", isRequired: true),
                    _buildFormField("Nhập lại mật khẩu", "nhahaotam",
                        isRequired: true),

                    BuildComboBoxProvince(
                      selectedTinhThanh: _selectedTinhThanh,
                      provinces: provinces, // Danh sách tỉnh/thành phố
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedTinhThanh = newValue;
                          _selectedQuanHuyen = null; // Reset quận/huyện
                          _selectedPhuongXa = null; // Reset phường/xã
                        });
                      },
                    ),

                    BuildComboBoxDistrict(
                      selectedQuanHuyen: _selectedQuanHuyen,
                      selectedTinhThanh: _selectedTinhThanh,
                      danhSachQuanHuyen:
                          danhSachQuanHuyen, // Danh sách quận/huyện
                      provinces: provinces,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedQuanHuyen = newValue;
                          _selectedPhuongXa = null; // Reset phường/xã
                        });
                      },
                    ),

                    BuildComboBoxWard(
                      selectedPhuongXa: _selectedPhuongXa,
                      selectedQuanHuyen: _selectedQuanHuyen,
                      phuongXaList: phuongXaList, // Danh sách phường/xã
                      danhSachQuanHuyen: danhSachQuanHuyen,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedPhuongXa = newValue;
                        });
                      },
                    ),

                    _buildFormField(
                        "Thôn/Xóm/Số nhà, tên đường", "Thôn Thành An",
                        isRequired: true),

                    // Checkbox for "Đại diện cho tổ chức/doanh nghiệp"
                    Row(
                      mainAxisAlignment: MainAxisAlignment
                          .start, // Đảm bảo nội dung bắt đầu từ bên trái
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 8.0), // Thêm khoảng cách dưới checkbox
                          child: Checkbox(
                            value: _isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                _isChecked = value ?? false;
                              });
                            },
                          ),
                        ),
                        const Expanded(
                          child: Text(
                            "Bạn có đại diện cho tổ chức/doanh nghiệp không?",
                            style: TextStyle(
                              color: Color(0xFF000000),
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Enable or disable the form fields based on checkbox value
                    _buildFormField("Tên tổ chức/doanh nghiệp",
                        _isChecked ? "" : "Trường Đại học Tài chính Marketing",
                        isEnabled: _isChecked, isRequired: true),
                    _buildFormField("Website tổ chức/doanh nghiệp",
                        _isChecked ? "" : "uis.ufm.edu.vn",
                        isEnabled: _isChecked, isRequired: true),

                    // Register Button
                    GestureDetector(
                      onTap: () {
                        // Handle registration or navigate to another screen
                      },
                      child: IntrinsicHeight(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: const Color(0xFF0866FF),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          margin: const EdgeInsets.only(
                              bottom: 18, left: 92, right: 92),
                          width: double.infinity,
                          child: GestureDetector(
                            onTap: () {
                              // Navigate to the NotificationKK screen
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const NotificationHT(), // Chuyển đến NotificationKK
                                ),
                              );
                            },
                            child: const Column(
                              children: [
                                Text(
                                  "Đăng ký",
                                  style: TextStyle(
                                    color: Color(0xFFFFFFFF),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFormField(String label, String placeholder,
      {bool isEnabled = true, bool isRequired = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: label,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (isRequired)
                  const TextSpan(
                    text: ' *',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              ],
            ),
          ),
        ),
        IntrinsicHeight(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFE8E8E8), width: 2),
              borderRadius: BorderRadius.circular(6),
              color: isEnabled ? Colors.white : const Color(0xFFE8E8E8),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 14),
            margin: const EdgeInsets.only(bottom: 12),
            alignment: Alignment.center,
            child: TextField(
              enabled: isEnabled,
              decoration: InputDecoration(
                hintText: placeholder,
                border: InputBorder.none,
                hintStyle: TextStyle(
                  color: isEnabled ? Colors.black45 : Colors.black26,
                ),
              ),
              style: TextStyle(
                color: isEnabled ? Colors.black : Colors.black54,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
