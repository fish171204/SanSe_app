import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import 'package:tester/src/resources/pages/DaDuocGiup.dart';

class DsGiupDo1 extends StatefulWidget {
  const DsGiupDo1({super.key});
  @override
  _DsGiupDo1State createState() => _DsGiupDo1State();
}

class _DsGiupDo1State extends State<DsGiupDo1> {
  @override
  final List<Map<String, dynamic>> nhaHaoTamData = [
    {
      "name": "Nguyễn Đăng Khoa",
      "details": "Giúp đỡ thành công 3.000.000 VNĐ",
      "avatar":
          "https://figma-alpha-api.s3.us-west-2.amazonaws.com/images/05daa1d4-d0ac-4702-8370-3885cb2c4c6b"
    },
    {
      "name": "Trương Quốc Thái",
      "details": "Giúp đỡ thành công 1.000.000 VNĐ",
      "avatar":
          "https://figma-alpha-api.s3.us-west-2.amazonaws.com/images/ca0c79b1-51ca-4d97-bff4-7d5268dc6080"
    },
    {
      "name": "Nguyễn Kim Dũng",
      "details": "Giúp đỡ thành công 1.000.000 VNĐ",
      "avatar":
          "https://figma-alpha-api.s3.us-west-2.amazonaws.com/images/aaa75e67-4385-439b-871f-1d664ebb4b48"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0, // Loại bỏ bóng cho AppBar
        backgroundColor: Colors.blue.shade700, // Màu nền AppBar
        automaticallyImplyLeading: false, // Tùy chỉnh nút quay lại
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context); // Quay lại màn hình trước đó
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
              //

              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount:
                      nhaHaoTamData.length, // Số lượng phần tử trong danh sách
                  itemBuilder: (context, index) {
                    final nhaHaoTam =
                        nhaHaoTamData[index]; // Lấy dữ liệu từng mục
                    return Card(
                      elevation: 3,
                      margin: const EdgeInsets.only(bottom: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                              NetworkImage(nhaHaoTam["avatar"]), // Ảnh đại diện
                          backgroundColor: Colors.grey.shade300,
                        ),
                        title: Text(
                          nhaHaoTam["name"], // Tên nhà hảo tâm
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle:
                            Text(nhaHaoTam["details"]), // Chi tiết đóng góp
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                        ),
                        onTap: () {
                          // Hành động khi bấm vào
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text(nhaHaoTam["name"]),
                              content: Text(nhaHaoTam["details"]),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text("Đóng"),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
              // Footer
            ],
          ),
        ),
      ),
    );
  }
}
