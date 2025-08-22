import 'package:tester/src/resources/pages/XemBaiDangKhoKhanDemo.dart';

import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_size.dart';
import 'package:tester/src/resources/pages/Donate2.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Donate extends StatefulWidget {
  const Donate({super.key});
  @override
  _DonateState createState() => _DonateState();
}

class _DonateState extends State<Donate> {
  List<XFile>? _images;

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

  String? _selectedAmount;

  final TextEditingController _amountController = TextEditingController();
  final NumberFormat _numberFormat =
      NumberFormat("#,###", "vi_VN"); // Định dạng số VND

  // Hàm xử lý khi chọn mệnh giá tiền
  @override
  void initState() {
    super.initState();
    // Lắng nghe sự thay đổi trên controller
    _amountController.addListener(_onAmountChanged);
  }

  String _donationAmount = "0 VND";
  List<String> amounts = [
    '100.000',
    '200.000',
    '500.000',
    '1.000.000',
    '2.000.000',
    '5.000.000'
  ];
  // Cập nhật giá trị khi người dùng chọn mệnh giá
  void _onAmountSelected(String amount) {
    setState(() {
      _donationAmount =
          '$amount VND'; // Cập nhật số tiền hiển thị trên nút "Giúp đỡ"
      _amountController.text = amount;
    });
  }

  // Hàm xử lý thay đổi khi người dùng nhập số tiền
  void _onAmountChanged() {
    final String text = _amountController.text.replaceAll('.', '');
    if (text.isNotEmpty) {
      final int value = int.tryParse(text) ?? 0; // Chuyển thành số nguyên
      final String formattedText = _numberFormat.format(value);
      if (_amountController.text != formattedText) {
        // Cập nhật giá trị mới vào controller
        _amountController.value = TextEditingValue(
          text: formattedText,
          selection: TextSelection.collapsed(offset: formattedText.length),
        );
      }
    }
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

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
                    borderRadius: BorderRadius.circular(32),
                    color: MyColors.surfaceContainerLowest,
                  ),
                  width: double.infinity,
                  height: double.infinity,
                  child: SingleChildScrollView(
                      padding: const EdgeInsets.only(top: 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                                top: 10, bottom: 28, right: 7),
                            height: 230,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/HinhAnh_Demo.jpg"),
                                  fit: BoxFit.cover),
                            ),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  IntrinsicHeight(
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          bottom: 94, left: 25),
                                      width: double.infinity,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.pop(
                                                  context); // Quay lại giao diện trước
                                            },
                                            child: Container(
                                              margin: const EdgeInsets.only(
                                                  top: 12),
                                              width: 35,
                                              height: 32,
                                              child: const Icon(
                                                Icons
                                                    .arrow_back, // Arrow back icon
                                                color: Color.fromARGB(255, 240,
                                                    239, 241), // Icon color
                                                size: 30, // Icon size
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ]),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                top: 10, bottom: 28, left: 15, right: 15),
                            width: double.infinity,
                            child: const Text(
                              "TÍNH MẠNG MONG MANH CỦA BÉ GÁI 3 TUỔI MẮC BỆNH XƠ GAN",
                              style: TextStyle(
                                color: Color(0xFF090A0A),
                                fontSize: MyFontSize.headline_small,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          IntrinsicHeight(
                            child: Container(
                              margin: const EdgeInsets.only(
                                  bottom: 10, left: 15, right: 15),
                              width: double.infinity,
                              child: Row(children: [
                                Container(
                                    margin: const EdgeInsets.only(right: 5),
                                    width: 18,
                                    height: 18,
                                    child: Image.asset(
                                      "assets/clock.png",
                                      fit: BoxFit.fill,
                                    )),
                                const Expanded(
                                  child: IntrinsicHeight(
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: Text(
                                        "Còn 20 ngày",
                                        style: TextStyle(
                                          color: Color(0xFF4D69FF),
                                          fontSize: MyFontSize.body_large,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 5, left: 15),
                            child: const Text(
                              "5,000,000 VND",
                              style: TextStyle(
                                color: Color(0xFF090A0A),
                                fontSize: MyFontSize.body_large,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          IntrinsicHeight(
                            child: Container(
                              margin: const EdgeInsets.only(
                                  bottom: 30, left: 14, right: 14),
                              width: double.infinity,
                              child: Row(
                                children: [
                                  IntrinsicHeight(
                                    child: Container(
                                      margin: const EdgeInsets.only(right: 8),
                                      width: 335,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: IntrinsicHeight(
                                              child: SizedBox(
                                                width: double.infinity,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Stack(
                                                      children: [
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100),
                                                            color: const Color
                                                                .fromARGB(255,
                                                                185, 190, 192),
                                                          ),
                                                          width:
                                                              340, // Chiều rộng của màu xám
                                                          height: 11,
                                                        ),
                                                        // Màu xanh
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100),
                                                            color: const Color(
                                                                0xFF4D69FF),
                                                          ),
                                                          width:
                                                              10, // Chiều rộng của màu xanh
                                                          height: 11,
                                                        ),
                                                      ],
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
                                  const Expanded(
                                    child: IntrinsicHeight(
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: Text(
                                          "0%",
                                          style: TextStyle(
                                            color: Color(0xFF4D69FF),
                                            fontSize: 16,
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
                          Container(
                            margin: const EdgeInsets.only(bottom: 10, left: 14),
                            child: const Text(
                              "Số tiền giúp đỡ",
                              style: TextStyle(
                                color: MyColors.shadow,
                                fontSize: MyFontSize.body_large,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          IntrinsicHeight(
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color(0xFFE3E4E5),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                                color: MyColors.surfaceContainerLowest,
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 6, horizontal: 12),
                              margin: const EdgeInsets.only(
                                  bottom: 18, left: 14, right: 14),
                              width: double.infinity,
                              child: Row(
                                children: [
                                  // Label VND
                                  IntrinsicHeight(
                                    child: Container(
                                      margin: const EdgeInsets.only(right: 40),
                                      child: const Text(
                                        "VND",
                                        style: TextStyle(
                                          color: Color(0xFF090A0A),
                                          fontSize: MyFontSize.body_large,
                                        ),
                                      ),
                                    ),
                                  ),
                                  // Expanded container cho TextField nhập số tiền
                                  Expanded(
                                    child: TextField(
                                      controller: _amountController,
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                        hintText: "Nhập số tiền muốn giúp đỡ",
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(
                                          color: Color(0xFF72777A),
                                          fontSize: MyFontSize.body_large,
                                        ),
                                      ),
                                      onChanged: (text) {
                                        setState(() {
                                          // Cập nhật số tiền nhập vào vào nút "Giúp đỡ"
                                          _donationAmount = _amountController
                                                  .text.isEmpty
                                              ? _donationAmount
                                              : "${_amountController.text} VND";
                                        });
                                      },
                                    ),
                                  ),
                                  // IconButton để mở menu chọn mệnh giá
                                  IconButton(
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      color: Color(0xFF090A0A),
                                    ),
                                    onPressed: () {
                                      _showAmountMenu();
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          IntrinsicHeight(
                            child: Container(
                              margin: const EdgeInsets.only(
                                  bottom: 8, left: 14, right: 14),
                              width: double.infinity,
                              child: Row(children: [
                                IntrinsicHeight(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 130, 132, 134),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15),
                                    margin: const EdgeInsets.only(right: 25),
                                    width: 94,
                                    child: const Column(children: [
                                      Text(
                                        "100.000",
                                        style: TextStyle(
                                          color: Color(0xFF090A0A),
                                          fontSize: MyFontSize.body_large,
                                        ),
                                      ),
                                    ]),
                                  ),
                                ),
                                IntrinsicHeight(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 130, 132, 134),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15),
                                    margin: const EdgeInsets.only(right: 25),
                                    width: 94,
                                    child: const Column(children: [
                                      Text(
                                        "200.000",
                                        style: TextStyle(
                                          color: Color(0xFF090A0A),
                                          fontSize: MyFontSize.body_large,
                                        ),
                                      ),
                                    ]),
                                  ),
                                ),
                                IntrinsicHeight(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 130, 132, 134),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15),
                                    margin: const EdgeInsets.only(right: 25),
                                    width: 94,
                                    child: const Column(children: [
                                      Text(
                                        "500.000",
                                        style: TextStyle(
                                          color: Color(0xFF090A0A),
                                          fontSize: MyFontSize.body_large,
                                        ),
                                      ),
                                    ]),
                                  ),
                                ),
                              ]),
                            ),
                          ),
                          IntrinsicHeight(
                            child: Container(
                              margin: const EdgeInsets.only(
                                  bottom: 18, left: 14, right: 14),
                              width: double.infinity,
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IntrinsicHeight(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: const Color.fromARGB(
                                                255, 130, 132, 134),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 15),
                                        width: 102,
                                        child: const Column(children: [
                                          Text(
                                            "1.000.000",
                                            style: TextStyle(
                                              color: Color(0xFF090A0A),
                                              fontSize: MyFontSize.body_large,
                                            ),
                                          ),
                                        ]),
                                      ),
                                    ),
                                    IntrinsicHeight(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: const Color.fromARGB(
                                                255, 130, 132, 134),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 15),
                                        width: 102,
                                        child: const Column(children: [
                                          Text(
                                            "2.000.000",
                                            style: TextStyle(
                                              color: Color(0xFF090A0A),
                                              fontSize: MyFontSize.body_large,
                                            ),
                                          ),
                                        ]),
                                      ),
                                    ),
                                    IntrinsicHeight(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: const Color.fromARGB(
                                                255, 130, 132, 134),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 15),
                                        width: 102,
                                        child: const Column(children: [
                                          Text(
                                            "5.000.000",
                                            style: TextStyle(
                                              color: Color(0xFF090A0A),
                                              fontSize: MyFontSize.body_large,
                                            ),
                                          ),
                                        ]),
                                      ),
                                    ),
                                  ]),
                            ),
                          ),
                          IntrinsicHeight(
                            child: GestureDetector(
                              onTap: () {
                                // Chuyển sang màn hình Donate2
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Donate2()),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color(0xFF3555FF),
                                ),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 17),
                                margin: const EdgeInsets.only(
                                    bottom: 14, left: 16, right: 16),
                                width: double.infinity,
                                child: Column(
                                  children: [
                                    Text(
                                      "Giúp đỡ $_donationAmount", // Hiển thị số tiền đã chọn
                                      style: const TextStyle(
                                        color: Color(0xFFFFFFFF), // Màu chữ
                                        fontSize: 16.0, // Kích thước chữ
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
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

  void _showAmountMenu() {
    showMenu<String>(
      context: context,
      position: const RelativeRect.fromLTRB(200, 50, 0, 0),
      items: [
        const PopupMenuItem<String>(
          value: '100.000',
          child: Text('100.000 VND'),
        ),
        const PopupMenuItem<String>(
          value: '200.000',
          child: Text('200.000 VND'),
        ),
        const PopupMenuItem<String>(
          value: '500.000',
          child: Text('500.000 VND'),
        ),
        const PopupMenuItem<String>(
          value: '1.000.000',
          child: Text('1.000.000 VND'),
        ),
        const PopupMenuItem<String>(
          value: '2.000.000',
          child: Text('2.000.000 VND'),
        ),
        const PopupMenuItem<String>(
          value: '5.000.000',
          child: Text('5.000.000 VND'),
        ),
      ],
      elevation: 8.0,
    ).then((value) {
      if (value != null) {
        _onAmountSelected(value); // Cập nhật số tiền khi người dùng chọn
      }
    });
  }

  String _formatNumber(String input) {
    final cleanedInput =
        input.replaceAll(RegExp(r'[^0-9]'), ''); // Loại bỏ ký tự không phải số
    if (cleanedInput.isEmpty) return '';

    final number = int.tryParse(cleanedInput) ?? 0;
    final formatter =
        NumberFormat("#,###", "vi_VN"); // Định dạng theo số Việt Nam
    return formatter.format(number);
  }
}
