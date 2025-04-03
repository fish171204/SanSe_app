import 'package:tester/src/Ayns/mainTest.dart';
import 'package:tester/src/resources/pages/XemBaiDangKhoKhan2.dart';
import 'package:tester/src/resources/pages/MainNhaHT.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../constants/MyColors.dart';
import '../../constants/MyFontSize.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/services.dart';

class Donate2 extends StatefulWidget {
  const Donate2({super.key});
  @override
  _Donate2State createState() => _Donate2State();
}

class _Donate2State extends State<Donate2> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Thông tin chuyển khoản',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 28,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 5,
      ),
      body: SingleChildScrollView(
        // Bao bọc toàn bộ nội dung trong SingleChildScrollView
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 0, bottom: 28, right: 7),
              height: 230,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/HinhAnh_Demo.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10, left: 8, bottom: 5),
              decoration: BoxDecoration(
                color: Colors.red
                    .withOpacity(0.1), // Light blue background for highlighting
                borderRadius: BorderRadius.circular(
                    8), // Rounded corners for a modern look
              ),
              child: const Text(
                'Ngày 01 Tháng 04',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold, // Bold text to make it stand out
                  color: Colors.blue, // Blue text color to enhance visibility
                ),
              ),
            ),
            _buildInfoRow('Tên ngân hàng:', 'Agribank'),
            buildAccountNumberRow(), // The row with the copy icon
            _buildInfoRow('Tên chủ tài khoản:', 'Le Thi Thuy Kieu'),
            _buildInfoRow('Số tiền ủng hộ:', '5.000.000 VND',
                valueColor: Colors.blue),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Nội dung chuyển khoản:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                padding: const EdgeInsets.all(
                    16), // Increased padding for a more spacious look
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      12), // Increased border radius for rounded edges
                  gradient: LinearGradient(
                    colors: [
                      Colors.blue.shade500,
                      Colors.blue.shade700
                    ], // Gradient effect from blue to a darker blue
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue
                          .shade300, // Soft shadow for a more elevated effect
                      offset: const Offset(0, 4),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment
                      .spaceBetween, // Align icon and text at both ends
                  children: [
                    // Text inside the container
                    const Expanded(
                      child: Text(
                        'ABKVUWDMVU8VSV7CS9f',
                        style: TextStyle(
                          fontSize:
                              18, // Increased font size for better readability
                          fontWeight: FontWeight.bold,
                          color: Colors
                              .white, // Text color set to white for contrast against the blue background
                          letterSpacing:
                              1.2, // Slight letter spacing for improved readability
                        ),
                        overflow: TextOverflow
                            .ellipsis, // Truncate text if it's too long
                      ),
                    ),
                    // IconButton to copy the text to clipboard
                    IconButton(
                      icon: const Icon(Icons.copy, color: Colors.white),
                      onPressed: () {
                        // Copy the text to clipboard
                        Clipboard.setData(
                            const ClipboardData(text: 'ABKVUWDMVU8VSV7CS9f'));
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text("Đoạn mã đã được sao chép!")),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                margin: const EdgeInsets.only(top: 20, bottom: 13),
                child: const Text(
                  "Minh chứng giúp đỡ",
                  style: TextStyle(
                    color: MyColors.shadow,
                    fontSize: MyFontSize.body_large,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            // Container tải ảnh
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          12), // Increased border radius for rounded edges
                      gradient: LinearGradient(
                        colors: [
                          Colors.blue.shade500,
                          Colors.blue.shade700
                        ], // Gradient effect for a more dynamic look
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue
                              .shade300, // Adding a subtle shadow to lift the button
                          offset: const Offset(0, 4),
                          blurRadius: 8,
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: _pickImage,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors
                                  .transparent, // Transparent container for the inner button
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 14, horizontal: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(right: 15),
                                  width: 24,
                                  height: 24,
                                  child: Image.asset(
                                    "assets/taianhlen.png",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                const Text(
                                  "Tải ảnh minh chứng",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing:
                                        1.2, // Slight letter spacing to make the text more readable
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                      height:
                          16), // Space between the button and images section
                  // Display selected images if available
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
            const SizedBox(height: 20), // Add space before the button
            GestureDetector(
              onTap: () {
                // Show a success message or navigate to the next screen
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor:
                          Colors.blue.shade50, // Soft background color
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(15), // Rounded corners
                      ),
                      content: const Row(
                        children: [
                          Icon(
                            Icons.notifications,
                            color: Colors.blue,
                            size: 40,
                          ),
                          SizedBox(width: 15), // Space between icon and text
                          Text(
                            'Chúc mừng bạn đã \ngiúp đỡ thành công!',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const mainTest()),
                            );
                          },
                          child: const Text(
                            'OK',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              child: IntrinsicHeight(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color(0xFF0866FF),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  margin:
                      const EdgeInsets.only(bottom: 18, left: 92, right: 92),
                  width: double.infinity,
                  child: const Column(
                    children: [
                      Text(
                        "Hoàn thành",
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
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, {Color? valueColor}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: TextStyle(
                fontSize: 18,
                color: valueColor ?? Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildAccountNumberRow() {
    String accountNumber = '7707205141174';

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const Expanded(
            flex: 2,
            child: Text(
              'Số tài khoản:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Text(
                  accountNumber,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.copy, color: Colors.blue), // Copy icon
                  onPressed: () {
                    Clipboard.setData(ClipboardData(
                        text: accountNumber)); // Copy to clipboard
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Số tài khoản đã được sao chép!')),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
