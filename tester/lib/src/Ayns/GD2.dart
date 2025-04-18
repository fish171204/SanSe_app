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
      "name": "Nguyễn Đăng Khoa",
      "details": "Giúp đỡ thành công 5.000.000 VNĐ",
      "avatar": "assets/AnhCV.jpg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue.shade700,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
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
                Navigator.pop(context);
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.blue,
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
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: nhaHaoTamData.length,
                  itemBuilder: (context, index) {
                    final nhaHaoTam = nhaHaoTamData[index];
                    return Card(
                      elevation: 3,
                      margin: const EdgeInsets.only(bottom: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(nhaHaoTam[
                              "avatar"]), // Đổi từ NetworkImage sang AssetImage
                          backgroundColor: Colors.grey.shade300,
                        ),
                        title: Text(
                          nhaHaoTam["name"],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(nhaHaoTam["details"]),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                        ),
                        onTap: () {
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
            ],
          ),
        ),
      ),
    );
  }
}
