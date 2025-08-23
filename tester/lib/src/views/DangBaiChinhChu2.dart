import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tester/src/theme/app_theme/app_theme.dart';
import 'package:tester/src/views/Ayns/mainTestKK.dart';
import 'package:image_picker/image_picker.dart'; // Import image_picker package
import 'dart:io';
import 'package:tester/src/views/MainNguoiKK.dart';

class DangBaiChinhChu2 extends StatefulWidget {
  const DangBaiChinhChu2({super.key});

  @override
  _DangBaiChinhChu2State createState() => _DangBaiChinhChu2State();
}

class _DangBaiChinhChu2State extends State<DangBaiChinhChu2> {
  List<XFile>? _images;
  List<XFile>? _images2;

  Future<void> _pickImage2() async {
    final pickedFiles2 = await ImagePicker().pickMultiImage();

    if (pickedFiles2.length <= 5) {
      setState(() {
        _images2 = pickedFiles2;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Bạn chỉ có thể tải tối đa 5 ảnh.")),
      );
    }
  }

  Future<void> _pickImage() async {
    final pickedFiles = await ImagePicker().pickMultiImage();

    if (pickedFiles.length <= 5) {
      setState(() {
        _images = pickedFiles;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Bạn chỉ có thể tải tối đa 5 ảnh.")),
      );
    }
  }

  bool _isSupporter = false;
  final bool _isWitness = false;
  String _selectedOption = "Tiền"; // Biến lưu giá trị được chọn
  bool _isUrgent = false; // Biến lưu trạng thái của checkbox "Khẩn cấp"
  bool _isAgree = false;

  final TextEditingController _amountController2 = TextEditingController();
  final TextEditingController _cccdController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _accountNumberController =
      TextEditingController();
  final TextEditingController _accountNameController = TextEditingController();
  final TextEditingController _bankNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final NumberFormat _numberFormat =
      NumberFormat("#,###", "vi_VN"); // Định dạng số

  @override
  void initState() {
    super.initState();
    _amountController2.addListener(() {
      final String text =
          _amountController2.text.replaceAll('.', ''); // Loại bỏ dấu chấm cũ
      if (text.isNotEmpty) {
        final int value = int.tryParse(text) ?? 0; // Chuyển thành số nguyên
        final String formattedText =
            _numberFormat.format(value); // Định dạng lại
        if (_amountController2.text != formattedText) {
          // Cập nhật giá trị mới vào controller
          _amountController2.value = TextEditingValue(
            text: formattedText,
            selection: TextSelection.collapsed(offset: formattedText.length),
          );
        }
      }
    });
  }

  @override
  void dispose() {
    // Xóa bộ điều khiển khi widget bị hủy
    _cccdController.dispose();
    _amountController.dispose();
    _accountNumberController.dispose();
    _accountNameController.dispose();
    _bankNameController.dispose();
    _descriptionController.dispose();
    _amountController2.dispose();
    super.dispose();
  }

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
                    padding: const EdgeInsets.only(top: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Tiêu đề
                        IntrinsicHeight(
                          child: Container(
                            margin: const EdgeInsets.only(
                                bottom: 0, left: 25, right: 25),
                            width: double.infinity,
                            child: Row(children: [
                              Container(
                                margin: const EdgeInsets.only(right: 20),
                                width: 35,
                                height: 32,
                                child: GestureDetector(
                                  onTap: () {
                                    // Điều hướng tới màn hình MainNguoiKK
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const MainNguoiKK()), // Đảm bảo rằng bạn đã import MainNguoiKK.dart
                                    );
                                  },
                                  child: Image.asset(
                                    "assets/images/quaylai.png",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              const Expanded(
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Text(
                                    "Trình bày khó khăn",
                                    style: TextStyle(
                                      color: Color(0xFF000000),
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(right: 5),
                                width: 60,
                                height: 62,
                                child: Image.asset(
                                  "assets/images/logo.png",
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ]),
                          ),
                        ),
                        const Divider(
                          color: Color.fromARGB(
                              255, 115, 114, 114), // Màu của đường kẻ
                          thickness: 1, // Độ dày của đường kẻ
                          indent: 0, // Lề bên trái của đường kẻ
                          endIndent: 0, // Lề bên phải của đường kẻ
                        ),

                        // Số CCCD

                        const SizedBox(height: 10),
                        // Hình thức giao dịch
                        _buildLabel("Hình thức giao dịch *"),
                        _buildTransactionOptions(),

                        _buildLabel("Nhập số tiền mong muốn trợ giúp *"),
                        const SizedBox(height: 5),
                        IntrinsicHeight(
                          child: Container(
                            height: 55, // Giữ cố định chiều cao của hộp
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xFFE8E8E8),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(5),
                              color: const Color(0xFFFFFFFF),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 7),
                            margin: const EdgeInsets.symmetric(
                                horizontal: 28, vertical: 10),
                            width: double.infinity,
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    controller: _amountController2,
                                    keyboardType: TextInputType.number,
                                    style: const TextStyle(
                                      color: Color.fromARGB(255, 107, 157,
                                          238), // Màu chữ nhập vào
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    decoration: const InputDecoration(
                                      hintText: "0",
                                      hintStyle: TextStyle(
                                        color: Color(0xFFAEA7A7),
                                      ),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(right: 21),
                                  child: const Text(
                                    "VND",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                PopupMenuButton<String>(
                                  icon: Image.asset(
                                    "assets/images/list_tien.png",
                                    width: 24,
                                    height: 25,
                                    fit: BoxFit.fill,
                                  ),
                                  onSelected: (String value) {
                                    setState(() {
                                      _amountController2.text =
                                          value; // Gán giá trị vào TextField
                                    });
                                  },
                                  itemBuilder: (BuildContext context) => [
                                    const PopupMenuItem(
                                      value: "200.000",
                                      child: Text(
                                        "200.000 VND",
                                        style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 107, 157, 238),
                                        ),
                                      ),
                                    ),
                                    const PopupMenuItem(
                                      value: "500.000",
                                      child: Text(
                                        "500.000 VND",
                                        style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 107, 157, 238),
                                        ),
                                      ),
                                    ),
                                    const PopupMenuItem(
                                      value: "1.000.000",
                                      child: Text(
                                        "1.000.000 VND",
                                        style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 107, 157, 238),
                                        ),
                                      ),
                                    ),
                                    const PopupMenuItem(
                                      value: "5.000.000",
                                      child: Text(
                                        "5.000.000 VND",
                                        style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 107, 157, 238),
                                        ),
                                      ),
                                    ),
                                    const PopupMenuItem(
                                      value: "10.000.000",
                                      child: Text(
                                        "10.000.000 VND",
                                        style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 107, 157, 238),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),

                        _buildLabel("Số CCCD người khó khăn *"),
                        _buildTextField(_cccdController, "045304004088"),

                        // Tên ngân hàng
                        _buildLabel("Tên ngân hàng *"),
                        _buildTextField(_bankNameController, "Agribank"),

                        // Số tài khoản
                        _buildLabel("Số tài khoản *"),
                        _buildTextField(
                            _accountNumberController, "7707205141174"),

                        // Tên chủ tài khoản
                        _buildLabel("Tên chủ tài khoản *"),
                        _buildTextField(
                            _accountNameController, "Le Thi Thuy Kieu"),

                        // Mô tả hoàn cảnh khó khăn
                        _buildLabel("Mô tả hoàn cảnh khó khăn *"),
                        _buildTextField(_descriptionController,
                            "Chị Lê Thị Thuý Kiều (SN 1991, quê Bình Định) có con gái là cháu Trần Lê Bảo Uyên (SN 2021) bị chẩn đoán mắc chứng teo mật bẩm sinh và phải điều trị hàng tháng. Đến tháng 9/2023, Uyên còn mắc thêm chứng rối loạn đông máu và nhiễm trùng nặng, và được phát hiện bị xơ gan. Gia đình đã đưa Uyên vào Bệnh viện Nhi đồng 2 (TP.HCM), nơi bác sĩ khuyên ghép gan để có cơ hội sống, nhưng chi phí ghép gan quá lớn, vượt khả năng chi trả của gia đình. Hiện tại, chị Kiều phải nghỉ việc để chăm sóc con, còn anh Trần Văn Tài (SN 1991), chồng chị, làm công nhân với lương 7 triệu đồng/tháng, nhưng không đủ để chi trả cho tiền thuốc và viện phí đã lên tới hơn 100 triệu đồng. Gia đình không có nhà riêng và sống cùng bố mẹ chồng, trong khi cả hai bên đều làm nông vất vả, không thể giúp đỡ nhiều. Ngoài Bảo Uyên, vợ chồng chị còn có con gái lớn Trần Lê Như Ngọc (9 tuổi).",
                            maxLines: 20),

                        _buildLabel("Tiêu đề bài đăng *"),
                        _buildTextField(_accountNameController,
                            "Tính mạng mong manh của bé gái 3 tuổi mắc bệnh xơ gan"),

                        _buildLabel("Số ngày cần giúp đỡ *"),
                        _buildTextField(_accountNameController, "20"),

                        // Ảnh minh chứng
                        _buildLabel("Ảnh minh chứng hoàn cảnh hiện tại *"),

                        IntrinsicHeight(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xFFE8E8E8),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(5),
                              color: MyColors.surfaceContainerLowest,
                            ),
                            margin: const EdgeInsets.symmetric(
                                horizontal: 28, vertical: 10),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 20),
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                IntrinsicHeight(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: const Color(0xFF0866FF),
                                    ),
                                    padding: const EdgeInsets.only(
                                        top: 14, bottom: 14, left: 3, right: 3),
                                    margin: const EdgeInsets.only(
                                        bottom: 27, left: 86, right: 86),
                                    width: double.infinity,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .center, // Căn giữa theo chiều ngang
                                      crossAxisAlignment: CrossAxisAlignment
                                          .center, // Căn giữa theo chiều dọc
                                      children: [
                                        GestureDetector(
                                          onTap: _pickImage,
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                                right: 15),
                                            width: 24,
                                            height: 24,
                                            child: Image.asset(
                                              "assets/images/taianhlen.png",
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        const Text(
                                          "Tải ảnh lên",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                // Hiển thị ảnh đã chọn
                                if (_images != null && _images!.isNotEmpty)
                                  Column(
                                    children: _images!.map((image) {
                                      return Center(
                                        child: Image.file(
                                          File(image.path),
                                          width: 300,
                                          height: 300,
                                        ),
                                      );
                                    }).toList(),
                                  ),
                              ],
                            ),
                          ),
                        ),

                        _buildLabel("Xác nhận của cơ quan chức năng (Nếu có)"),

                        IntrinsicHeight(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xFFE8E8E8),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(5),
                              color: MyColors.surfaceContainerLowest,
                            ),
                            margin: const EdgeInsets.symmetric(
                                horizontal: 28, vertical: 10),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 20),
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                IntrinsicHeight(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: const Color(0xFF0866FF),
                                    ),
                                    padding: const EdgeInsets.only(
                                        top: 14, bottom: 14, left: 3, right: 3),
                                    margin: const EdgeInsets.only(
                                        bottom: 27, left: 86, right: 86),
                                    width: double.infinity,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .center, // Căn giữa theo chiều ngang
                                      crossAxisAlignment: CrossAxisAlignment
                                          .center, // Căn giữa theo chiều dọc
                                      children: [
                                        GestureDetector(
                                          onTap: _pickImage2,
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                                right: 15),
                                            width: 24,
                                            height: 24,
                                            child: Image.asset(
                                              "assets/images/taianhlen.png",
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        const Text(
                                          "Tải ảnh lên",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                // Hiển thị ảnh đã chọn
                                if (_images2 != null && _images2!.isNotEmpty)
                                  Column(
                                    children: _images2!.map((image) {
                                      return Center(
                                        child: Image.file(
                                          File(image.path),
                                          width: 300,
                                          height: 300,
                                        ),
                                      );
                                    }).toList(),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        const Divider(
                          color: Colors.black, // Màu của đường kẻ
                          thickness: 1, // Độ dày của đường kẻ
                          indent: 20, // Lề bên trái của đường kẻ
                          endIndent: 20, // Lề bên phải của đường kẻ
                        ),
                        _buildLabel("1. Người làm chứng hoàn cảnh *"),
                        const SizedBox(height: 10),
                        _buildLabel2("Căn cước công dân *"),

                        _buildTextField2(_cccdController, "054204005258"),
                        _buildLabel2("Họ tên người làm chứng *"),
                        _buildTextField2(_cccdController, "Nguyễn Đăng Khoa"),
                        _buildLabel2("Số điện thoại Zalo *"),
                        _buildTextField2(_cccdController, "0383416574"),
                        _buildLabel2("Tư cách làm chứng *"),
                        _buildTextField2(_cccdController,
                            "Công an Xã Cát Tân,huyện Phù Cát"),
                        // "Ví dụ: Công an khu vực, Tổ trưởng dân phố, Khu phố trưởng, …"),

                        // Hiển thị thông tin người làm chứng nếu checkbox được chọn
                        Visibility(
                          visible: _isWitness, // Điều kiện hiển thị
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment
                                .start, // Đảm bảo các widget nằm ở bên trái
                            children: [],
                          ),
                        ),
                        const Divider(
                          color: Colors.black, // Màu của đường kẻ
                          thickness: 1, // Độ dày của đường kẻ
                          indent: 20, // Lề bên trái của đường kẻ
                          endIndent: 20, // Lề bên phải của đường kẻ
                        ),
                        _buildLabel("2. Bạn có phải người hỗ trợ không?"),
                        Row(
                          children: [
                            const SizedBox(
                                width:
                                    20), // Thêm khoảng cách để dịch checkbox sang phải
                            Checkbox(
                              value: _isSupporter,
                              onChanged: (bool? value) {
                                setState(() {
                                  _isSupporter = value!;
                                });
                              },
                              activeColor: const Color(0xFF0866FF),
                            ),
                            const Text(
                              "Có",
                              style: TextStyle(
                                fontSize:
                                    16, // Điều chỉnh kích thước chữ tại đây
                              ),
                            ),
                          ],
                        ),

                        // Hiển thị thông tin người hỗ trợ nếu checkbox được chọn
                        Visibility(
                          visible: _isSupporter, // Điều kiện hiển thị
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment
                                .start, // Căn lề bên trái cho các widget
                            children: [
                              _buildLabel("Căn cước công dân *"),
                              _buildTextField(
                                  _cccdController, "Nhập căn cước công dân"),
                              _buildLabel("Họ tên người hỗ trợ *"),
                              _buildTextField(
                                  _cccdController, "Nhập họ tên người hỗ trợ"),
                              _buildLabel("Số điện thoại Zalo *"),
                              _buildTextField(
                                  _cccdController, "Nhập số điện thoại Zalo"),
                              _buildLabel("Tỉnh/Thành phố *"),
                              _buildTextField(_cccdController, "Quảng Nam"),
                              _buildLabel("Quận/Huyện *"),
                              _buildTextField(_cccdController, "Núi Thành"),
                              _buildLabel("Xã/Phường *"),
                              _buildTextField(_cccdController, "Tam Quang"),
                              _buildLabel("Địa chỉ *"),
                              _buildTextField(
                                  _cccdController, "2A/1B, đường số 2"),
                              _buildLabel("Email "),
                              _buildTextField(
                                  _cccdController, "Nhập Email nếu có"),
                            ],
                          ),
                        ),
                        const Divider(
                          color: Colors.black, // Màu của đường kẻ
                          thickness: 1, // Độ dày của đường kẻ
                          indent: 20, // Lề bên trái của đường kẻ
                          endIndent: 20, // Lề bên phải của đường kẻ
                        ),
                        // Checkbox "Người làm chứng hoàn cảnh?"

                        _buildLabel(
                            "3. Bạn có thuộc trường hợp khẩn cấp không?"),
                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment.start, // Đảm bảo căn chỉnh đúng
                          children: [
                            // Label "Trường hợp khẩn cấp"

                            // Khoảng cách nhỏ giữa label và checkbox
                            const SizedBox(
                                width:
                                    20), // Điều chỉnh khoảng cách giữa label và checkbox

                            // Checkbox to lên
                            Transform.scale(
                              scale:
                                  1.1, // Tăng kích thước checkbox lên 1.1 lần
                              child: Checkbox(
                                value: _isUrgent,
                                onChanged: (bool? value) {
                                  setState(() {
                                    _isUrgent = value!;
                                  });
                                },
                                activeColor: const Color(
                                    0xFFFF0404), // Màu của checkbox khi được chọn
                                checkColor: Colors
                                    .white, // Màu của dấu check bên trong checkbox
                              ),
                            ),

                            // Text "Khẩn cấp" với màu sắc mới
                            const Text(
                              "Khẩn cấp",
                              style: TextStyle(
                                fontSize:
                                    16, // Điều chỉnh kích thước chữ nếu cần
                                color:
                                    Color(0xFFFF0404), // Màu của chữ "Khẩn cấp"
                                fontWeight: FontWeight.bold, // Bôi đậm chữ
                              ),
                            ),
                          ],
                        ),
                        const Divider(
                          color: Colors.black, // Màu của đường kẻ
                          thickness: 1, // Độ dày của đường kẻ
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Checkbox với thiết kế hiện đại
                            Transform.scale(
                              scale: 1.3, // Tăng kích thước checkbox để dễ bấm
                              child: Checkbox(
                                value: _isAgree, // Biến lưu trạng thái checkbox
                                onChanged: (bool? value) {
                                  setState(() {
                                    _isAgree = value!;
                                  });
                                },
                                activeColor: const Color(
                                    0xFF007BFF), // Màu xanh dương chuyên nghiệp
                                checkColor:
                                    Colors.white, // Màu của dấu tick bên trong
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      4), // Bo góc checkbox
                                ),
                              ),
                            ),

                            // Label với phong cách hiện đại
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _isAgree =
                                        !_isAgree; // Cho phép bấm vào label để toggle checkbox
                                  });
                                },
                                child: RichText(
                                  text: const TextSpan(
                                    text: "Tôi cam kết ", // Phần chữ đầu
                                    style: TextStyle(
                                      fontSize:
                                          16, // Kích thước chữ lớn, dễ đọc
                                      color: Colors.black87, // Màu chữ dễ nhìn
                                      height: 1.5, // Khoảng cách dòng thoải mái
                                    ),
                                    children: [
                                      TextSpan(
                                        text:
                                            "chịu trách nhiệm pháp lý ", // Phần nổi bật
                                        style: TextStyle(
                                          color: Color(
                                              0xFF007BFF), // Màu xanh dương để thu hút
                                          fontWeight: FontWeight
                                              .bold, // Tô đậm phần nổi bật
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            "về các thông tin đã trình bày.", // Phần chữ cuối
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: _isAgree
                                ? const Color(
                                    0xFF0866FF) // Màu xanh khi nút khả dụng
                                : Colors.grey, // Màu xám khi nút không khả dụng
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          margin: const EdgeInsets.only(
                              top: 20, bottom: 18, left: 92, right: 92),
                          width: double.infinity,
                          child: GestureDetector(
                            onTap: _isAgree
                                ? () {
                                    // Xử lý khi checkbox đã chọn
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        backgroundColor:
                                            const Color(0xFFF5F5F5),
                                        titlePadding: const EdgeInsets.all(20),
                                        contentPadding:
                                            const EdgeInsets.all(20),
                                        title: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.check_circle_outline,
                                              color: Color(0xFF4CAF50),
                                              size: 30,
                                            ),
                                            SizedBox(width: 10),
                                            Text(
                                              "Thành công!",
                                              style: TextStyle(
                                                color: Color(0xFF0866FF),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                              ),
                                            ),
                                          ],
                                        ),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const Text(
                                              "Hoàn cảnh của bạn đã được gửi tới các nhà hảo tâm. Xin chờ hỗ trợ!",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.black87,
                                              ),
                                            ),
                                            const SizedBox(height: 20),
                                            Container(
                                              padding: const EdgeInsets.all(10),
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color(0xFFFFF3E0),
                                              ),
                                              child: const Icon(
                                                Icons.notifications,
                                                color: Color(0xFFFFA726),
                                                size: 40,
                                              ),
                                            ),
                                          ],
                                        ),
                                        actions: [
                                          Center(
                                            child: ElevatedButton(
                                              onPressed: () {
                                                Navigator.pop(
                                                    context); // Đóng dialog
                                                Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const mainTestKK(),
                                                  ),
                                                ); // Chuyển tới màn hình MainNguoiKK
                                              },
                                              style: ElevatedButton.styleFrom(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 30,
                                                        vertical: 10),
                                                backgroundColor:
                                                    const Color(0xFF0866FF),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              ),
                                              child: const Text(
                                                "OK",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                                : null, // Không làm gì nếu chưa chọn checkbox
                            child: const Center(
                              child: Text(
                                "Chia sẻ",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
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

  // Widget hiển thị nhãn với dấu "*" màu đỏ
  Widget _buildLabel(String text) {
    final hasAsterisk = text.contains('*');
    final hasOptionalText = text.contains('(Nếu có)');
    return Container(
      margin: const EdgeInsets.only(bottom: 2, left: 28),
      child: RichText(
        text: TextSpan(
          children: [
            // Text phần chính trước dấu '*', nếu có
            TextSpan(
              text: hasAsterisk
                  ? text.split('*').first
                  : hasOptionalText
                      ? text.split('(Nếu có)').first
                      : text,
              style: const TextStyle(
                color: Color(0xFF000000),
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Nếu có dấu '*' thì thêm dấu '*' màu đỏ
            if (hasAsterisk)
              const TextSpan(
                text: '*',
                style: TextStyle(
                  color: Color(0xFFFF0000),
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            // Nếu có '(Nếu có)' thì thêm '(Nếu có)' màu đỏ
            if (hasOptionalText)
              const TextSpan(
                text: '(Nếu có)',
                style: TextStyle(
                  color: Color(0xFFFF0000),
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
        ),
      ),
    );
  }

  // Widget TextField tùy chỉnh
  Widget _buildTextField(TextEditingController controller, String hintText,
      {int maxLines = 1}) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFFE8E8E8),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(5),
        color: const Color(0xFFFFFFFF),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 28, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        keyboardType: TextInputType.number, // Giới hạn kiểu nhập liệu là số
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: const TextStyle(color: Color(0xFFAEA7A7)),
        ),
        style: const TextStyle(
          color: Color(0xFF000000),
          fontSize: 15,
        ),
        onChanged: (text) {
          // Lắng nghe khi giá trị thay đổi
          final formattedText = _formatNumber(text);
          if (controller.text != formattedText) {
            controller.value = TextEditingValue(
              text: formattedText,
              selection: TextSelection.collapsed(offset: formattedText.length),
            );
          }
        },
      ),
    );
  }

  // Widget hiển thị nhãn với dấu "*" màu đỏ
  Widget _buildLabel2(String text) {
    final hasAsterisk2 = text.contains('*');
    final hasOptionalText2 = text.contains('(Nếu có)');
    return Container(
      margin: const EdgeInsets.only(bottom: 2, left: 50),
      child: RichText(
        text: TextSpan(
          children: [
            // Text phần chính trước dấu '*', nếu có
            TextSpan(
              text: hasAsterisk2
                  ? text.split('*').first
                  : hasOptionalText2
                      ? text.split('(Nếu có)').first
                      : text,
              style: const TextStyle(
                color: Color(0xFF000000),
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Nếu có dấu '*' thì thêm dấu '*' màu đỏ
            if (hasAsterisk2)
              const TextSpan(
                text: '*',
                style: TextStyle(
                  color: Color(0xFFFF0000),
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            // Nếu có '(Nếu có)' thì thêm '(Nếu có)' màu đỏ
            if (hasOptionalText2)
              const TextSpan(
                text: '(Nếu có)',
                style: TextStyle(
                  color: Color(0xFFFF0000),
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
        ),
      ),
    );
  }

  // Widget TextField tùy chỉnh
  Widget _buildTextField2(TextEditingController controller, String hintText,
      {int maxLines = 1}) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFFE8E8E8),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(5),
        color: const Color(0xFFFFFFFF),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        keyboardType: TextInputType.number, // Giới hạn kiểu nhập liệu là số
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: const TextStyle(color: Color(0xFFAEA7A7)),
        ),
        style: const TextStyle(
          color: Color(0xFF000000),
          fontSize: 15,
        ),
        onChanged: (text) {
          // Lắng nghe khi giá trị thay đổi
          final formattedText2 = _formatNumber(text);
          if (controller.text != formattedText2) {
            controller.value = TextEditingValue(
              text: formattedText2,
              selection: TextSelection.collapsed(offset: formattedText2.length),
            );
          }
        },
      ),
    );
  }

// Hàm format số với dấu phân cách hàng nghìn
  String _formatNumber(String input) {
    final cleanedInput =
        input.replaceAll(RegExp(r'[^0-9]'), ''); // Loại bỏ ký tự không phải số
    if (cleanedInput.isEmpty) return '';

    final number = int.tryParse(cleanedInput) ?? 0;
    final formatter =
        NumberFormat("#,###", "vi_VN"); // Định dạng theo số Việt Nam
    return formatter.format(number);
  }

  // Widget cho các tùy chọn giao dịch
  Widget _buildTransactionOptions() {
    return IntrinsicHeight(
      child: Container(
        margin: const EdgeInsets.only(bottom: 5, left: 28, right: 28),
        width: double.infinity,
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  // Sử dụng Transform.scale để thay đổi kích thước radio button
                  Transform.scale(
                    scale: 1.5, // Tăng kích thước radio button
                    child: Radio<String>(
                      value: "Tiền",
                      groupValue: _selectedOption,
                      onChanged: (String? value) {
                        setState(() {
                          _selectedOption = value!;
                        });
                      },
                      activeColor: const Color(0xFF0866FF),
                    ),
                  ),
                  const Text("Tiền"),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  // Sử dụng Transform.scale để thay đổi kích thước radio button
                  Transform.scale(
                    scale: 1.5, // Tăng kích thước radio button
                    child: Radio<String>(
                      value: "Vật phẩm",
                      groupValue: _selectedOption,
                      onChanged: (String? value) {
                        setState(() {
                          _selectedOption = value!;
                        });
                      },
                      activeColor: const Color(0xFF0866FF),
                    ),
                  ),
                  const Text("Vật phẩm"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
