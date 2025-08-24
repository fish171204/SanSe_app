import 'package:flutter/material.dart';
import 'package:tester/src/theme/app_theme/app_theme.dart';
import 'package:tester/src/views/post/post_needy_detail_test_02.dart';

class ViewUI2 extends StatelessWidget {
  const ViewUI2({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0, // Loại bỏ bóng cho AppBar
        backgroundColor: Colors.blue.shade700, // Màu nền AppBar
        automaticallyImplyLeading: false, // Tùy chỉnh nút quay lại
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Daduocgiup(),
              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(30),
              onTap: () {
                Navigator.pop(context); // Quay lại màn hình trước đó
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.blue, // Icon màu trắng để nổi bật
                  size: 28,
                ),
              ),
            ),
          ),
        ),
        title: const Text(
          "Danh sách nhà hảo tâm",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.favorite,
              color: Colors.white,
            ),
            onPressed: () {
              // Hành động cho nút yêu thích
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          constraints: const BoxConstraints.expand(),
          color: MyColors.surfaceContainerLowest,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Text(
                    "Danh sách giúp đỡ trống",
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
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
}
