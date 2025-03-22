import 'package:flutter/material.dart';
import '../constants/MyColors.dart';
import 'package:tester/src/resources/pages/DaDuocGiup.dart';

class GD2 extends StatefulWidget {
  const GD2({super.key});
  @override
  _GD2State createState() => _GD2State();
}

class _GD2State extends State<GD2> {
  @override
  final List<Map<String, dynamic>> nhaHaoTamData = [
    {
      "name": "Nguyễn Trần Đoan Thi",
      "details": "Giúp đỡ thành công 5.000.000 VNĐ",
      "avatar":
          "https://scontent.xx.fbcdn.net/v/t1.15752-9/461774565_911513157504564_8379069972821139045_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=0024fc&_nc_ohc=dyd1vDipHGQQ7kNvgEWTfaX&_nc_ad=z-m&_nc_cid=0&_nc_pt=1&_nc_zt=23&_nc_ht=scontent.xx&oh=03_Q7cD1QGjozWKr4V1WAAoq5DZMn4iQH8QTgMd73gOGi7gFMbDqw&oe=6777DD55" // Link ảnh đại diện
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
