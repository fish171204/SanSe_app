import 'package:flutter/material.dart';
import 'package:tester/src/resources/pages/NotificationKK.dart';
import 'package:tester/src/models/tinh_thanh.dart';
import 'package:tester/src/models/quan_huyen.dart';
import 'package:tester/src/models/phuong_xa.dart';

class FormDKyKK extends StatefulWidget {
  const FormDKyKK({super.key});

  @override
  _FormDKyKKState createState() => _FormDKyKKState();
}

class _FormDKyKKState extends State<FormDKyKK> {
  bool _isChecked = false;
  String? _selectedTinhThanh; // Tỉnh/Thành phố được chọn
  String? _selectedQuanHuyen; // Quận/Huyện được chọn
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
                              "assets/quaylai.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        const Expanded(
                          child: Text(
                            "Tài khoản người khó khăn",
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
                    _buildFormField("Số CCCD/CMND", "045304004088",
                        isRequired: true),
                    _buildFormField("Họ tên", "Lê Thị Thuý Kiều",
                        isRequired: true),
                    _buildFormField("Số điện thoại Zalo", "0973353674",
                        isRequired: true),
                    _buildFormField("Ngày sinh", "01/01/1991",
                        isRequired: true),
                    _buildFormField("Email", ""),
                    _buildFormField("Mật khẩu", "nguoikhokhan",
                        isRequired: true),
                    _buildFormField("Nhập lại mật khẩu", "nguoikhokhan",
                        isRequired: true),

                    // Combobox Tỉnh/Thành phố
                    _buildComboBoxTinhThanh(),
                    // _buildFormField("Tỉnh/Thành phố", "Quảng Trị",
                    //     isRequired: true),

                    // Combobox Quận/Huyện, dựa vào tỉnh thành đã chọn
                    _buildComboBoxQuanHuyen(),
                    // _buildFormField("Quận/Huyện", "Hướng Hóa", isRequired: true),

                    _buildComboBoxPhuongXa(),
                    // _buildFormField("Phường/Xã", "Hướng Phùng", isRequired: true),

                    _buildFormField("Thôn/Xóm/Số nhà, tên đường", "Thôn Tân Lệ",
                        isRequired: true),

                    // Checkbox for "Đại diện cho người khó khăn"
                    Row(
                      children: [
                        Checkbox(
                          value: _isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              _isChecked = value ?? false;
                            });
                          },
                        ),
                        const Expanded(
                          child: Text(
                            "Bạn có đại diện cho người khó khăn không?",
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
                    _buildFormField("Số CCCD/CMND người hỗ trợ",
                        _isChecked ? "" : "05420400xxxx",
                        isEnabled: _isChecked, isRequired: true),
                    _buildFormField(
                        "Họ tên người hỗ trợ", _isChecked ? "" : "Nguyễn Văn A",
                        isEnabled: _isChecked, isRequired: true),
                    _buildFormField(
                        "Số Điện thoại Zalo", _isChecked ? "" : "039341xxxx",
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
                                      const NotificationKK(), // Chuyển đến NotificationKK
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
  // Widget _buildFormField(String label, String placeholder,
  //     {bool isEnabled = true, bool isRequired = false}) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Container(
  //         margin: const EdgeInsets.only(bottom: 10),
  //         child: RichText(
  //           text: TextSpan(
  //             children: [
  //               TextSpan(
  //                 text: label,
  //                 style: const TextStyle(
  //                   color: Color(0xFF000000),
  //                   fontSize: 15,
  //                   fontWeight: FontWeight.bold,
  //                 ),
  //               ),
  //               if (isRequired) ...[
  //                 const TextSpan(
  //                   text: ' *',
  //                   style: TextStyle(
  //                     color: Colors.red, // Red asterisk for required fields
  //                     fontSize: 15,
  //                     fontWeight: FontWeight.bold,
  //                   ),
  //                 ),
  //               ],
  //             ],
  //           ),
  //         ),
  //       ),
  //       IntrinsicHeight(
  //         child: Container(
  //           decoration: BoxDecoration(
  //             border: Border.all(color: const Color(0xFFE8E8E8), width: 2),
  //             borderRadius: BorderRadius.circular(5),
  //             color:
  //                 isEnabled ? const Color(0xFFFFFFFF) : const Color(0xFFE8E8E8),
  //           ),
  //           padding: const EdgeInsets.all(18),
  //           margin: const EdgeInsets.only(bottom: 13),
  //           width: double.infinity,
  //           child: TextField(
  //             enabled: isEnabled,
  //             decoration: InputDecoration(
  //               hintText: placeholder,
  //               border: InputBorder.none,
  //             ),
  //             style: TextStyle(
  //               color: isEnabled
  //                   ? const Color(0xFF000000)
  //                   : const Color(0xFFB0B0B0),
  //               fontSize: 15,
  //             ),
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  // Combobox Tỉnh/Thành phố
  Widget _buildComboBoxTinhThanh() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: "Tỉnh/Thành phố",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              TextSpan(
                text: " *",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: _selectedTinhThanh,
          hint: const Text("Chọn tỉnh/thành"),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 15),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          icon: const Icon(Icons.arrow_drop_down),
          items: provinces.map((TinhThanh province) {
            return DropdownMenuItem<String>(
              value: province.tenTinhThanh,
              child: Row(
                children: [
                  const Icon(Icons.location_city, color: Colors.blue),
                  const SizedBox(width: 8),
                  Text(province.tenTinhThanh),
                ],
              ),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              _selectedTinhThanh = newValue;
              _selectedQuanHuyen = null; // Reset quận/huyện
              _selectedPhuongXa = null; // Reset phường/xã
            });
          },
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  // Combobox Quận/Huyện
  Widget _buildComboBoxQuanHuyen() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: "Quận/Huyện",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              TextSpan(
                text: " *",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: _selectedQuanHuyen,
          hint: const Text("Chọn quận/huyện"),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 15),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          icon: const Icon(Icons.arrow_drop_down),
          items: _selectedTinhThanh != null
              ? [
                  ...danhSachQuanHuyen
                      .where((quanHuyen) =>
                          quanHuyen.maTinhThanh ==
                          provinces
                              .firstWhere(
                                (province) =>
                                    province.tenTinhThanh == _selectedTinhThanh,
                              )
                              .maTinhThanh)
                      .map((QuanHuyen quanHuyen) {
                    return DropdownMenuItem<String>(
                      value: quanHuyen.tenQuanHuyen,
                      child: Row(
                        children: [
                          const Icon(Icons.location_city, color: Colors.blue),
                          const SizedBox(width: 8),
                          Text(quanHuyen.tenQuanHuyen),
                        ],
                      ),
                    );
                  })
                ]
              : [],
          onChanged: (String? newValue) {
            setState(() {
              _selectedQuanHuyen = newValue;
              _selectedPhuongXa = null; // Reset phường/xã khi thay đổi quận
            });
          },
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildComboBoxPhuongXa() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: "Phường/Xã",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              TextSpan(
                text: " *",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: _selectedPhuongXa,
          hint: const Text("Chọn phường/xã"),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 15),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          icon: const Icon(Icons.arrow_drop_down),
          items: _selectedQuanHuyen != null
              ? [
                  ...phuongXaList
                      .where((phuongXa) =>
                          phuongXa.maQuanHuyen ==
                          danhSachQuanHuyen
                              .firstWhere(
                                (quanHuyen) =>
                                    quanHuyen.tenQuanHuyen ==
                                    _selectedQuanHuyen,
                              )
                              .maQuanHuyen)
                      .map((PhuongXa phuongXa) {
                    return DropdownMenuItem<String>(
                      value: phuongXa.tenPhuongXa,
                      child: Row(
                        children: [
                          const Icon(Icons.location_city, color: Colors.blue),
                          const SizedBox(width: 8),
                          Text(phuongXa.tenPhuongXa),
                        ],
                      ),
                    );
                  })
                ]
              : [],
          onChanged: (String? newValue) {
            setState(() {
              _selectedPhuongXa = newValue;
            });
          },
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
