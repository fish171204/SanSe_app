import 'package:flutter/material.dart';
import 'package:tester/src/resources/MainNguoiKK.dart';
import 'package:tester/src/resources/MainNhaHT.dart';
import 'package:tester/src/resources/ThongBao/KhanCap.dart';
import 'package:tester/src/resources/DangKyNhap.dart';
import 'package:tester/src/resources/SharedPreferences.dart';
import 'package:tester/src/resources/MyNavigationBar.dart';
import 'package:tester/src/resources/XemBaiDangKhoKhanDemo.dart';

class XemThongBao extends StatefulWidget {
  const XemThongBao({super.key});

  @override
  _XemThongBaoState createState() => _XemThongBaoState();
}

class _XemThongBaoState extends State<XemThongBao> {
  int _currentIndex = 2;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  String selectedFilter = "Hoàn cảnh khó khăn thông thường";

  void showFilterOptions() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const Text(
                    "Bộ lọc",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    leading: Radio<String>(
                      value: "Hoàn cảnh khó khăn thông thường",
                      groupValue: selectedFilter,
                      onChanged: (String? value) {
                        setState(() {
                          selectedFilter = value!;
                        });
                        Navigator.pop(context);
                      },
                    ),
                    title: const Text("Hoàn cảnh khó khăn thông thường"),
                    trailing:
                        const Icon(Icons.notifications, color: Colors.orange),
                  ),
                  ListTile(
                    leading: Radio<String>(
                      value: "Hoàn cảnh khó khăn khẩn cấp",
                      groupValue: selectedFilter,
                      onChanged: (String? value) {
                        setState(() {
                          selectedFilter = value!;
                        });
                        Navigator.pop(context);
                        // Chuyển hướng tới giao diện KhanCap.dart
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const KhanCap(), // Gọi màn hình KhanCap
                          ),
                        );
                      },
                    ),
                    title: const Text("Hoàn cảnh khó khăn khẩn cấp"),
                    trailing: const Icon(Icons.notification_important,
                        color: Colors.red),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () async {
            // Lấy trạng thái đăng nhập và loại tài khoản
            bool isLoggedIn = await SharedPreferencesHelper.getLoginStatus();
            String? userType = await SharedPreferencesHelper.getUserType();

            // Điều hướng dựa trên loại tài khoản
            if (isLoggedIn && userType == "nguoikhokhan") {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const MainNguoiKK(),
                ),
              );
            } else if (isLoggedIn && userType == "045304004088") {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MainNguoiKK()),
              );
            } else if (isLoggedIn && userType == "nhahaotam") {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const MainNguoiHT(),
                ),
              );
            } else if (isLoggedIn && userType == "054204003257") {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MainNguoiHT()),
              );
            } else {
              // Nếu chưa đăng nhập, điều hướng đến màn hình đăng nhập
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const Dangkynhap(),
                ),
              );
            }
          },
          child: const Icon(Icons.arrow_back,
              color: Colors.black), // Chỉ dùng Icon ở đây
        ),
        title: const Text(
          'Thông báo',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications, color: Colors.black),
                onPressed: () {},
              ),
              Positioned(
                right: 10,
                top: 10,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: const Text(
                    '7',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    'DANH SÁCH HOÀN CẢNH KHÓ KHĂN',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.blue,
                    ),
                  ),
                ),
                InkWell(
                  onTap: showFilterOptions,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFFAFCEFF),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(30),
                      color: const Color(0xFFE7F0FF),
                    ),
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 8),
                          width: 20,
                          height: 20,
                          child: Image.asset(
                            "assets/danhmuc.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                        const Text(
                          "Bộ lọc",
                          style: TextStyle(
                            color: Color(0xFF0866FF),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: const [
                NotificationCard(
                  title:
                      'Tính mạng mong manh của bé gái 3 tuổi mắc bệnh xơ gan',
                  organization: 'Lê Thị Thuý Kiều',
                  amount: '5.000.000 VND',
                  imageAsset: 'assets/HinhAnh_Demo.jpg',
                  color: Colors.red,
                ),
                NotificationCard(
                  title:
                      'Cụ bà 90 tuổi bị 4 con bỏ rơi, tự bò ngoài đường bắt xe đi khám bệnh',
                  organization: 'Quỹ Thiện Tâm',
                  amount: '3.000.000 VND',
                  imageAsset: 'assets/nguoikhokhan8.jpg',
                  color: Colors.red,
                ),
                NotificationCard(
                  title:
                      '3 cha con sống trong căn nhà 2m2, cơm ăn bữa đói bữa no',
                  organization: 'Nguyễn Văn Huy',
                  amount: '10.000.000 VND',
                  imageAsset: 'assets/HinhAnh_0.png',
                  color: Colors.red,
                ),
                NotificationCard(
                  title:
                      'Mẹ già 80 tuổi còng lưng chăm con trai suy thận, con gái mắc bệnh ung thư',
                  organization: 'Trương Anh Vịnh',
                  amount: '60.000.000 VND',
                  imageAsset: 'assets/nguoikhokhan9.jpg',
                  color: Colors.red,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: MyNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final String title;
  final String organization;
  final String amount;
  final String imageAsset;
  final Color color;

  const NotificationCard({
    super.key,
    required this.title,
    required this.organization,
    required this.amount,
    required this.imageAsset,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Only navigate if the title matches the specific one
        if (title == 'Tính mạng mong manh của bé gái 3 tuổi mắc bệnh xơ gan') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  const XemBaiDangKhoKhanDemo(), // Target screen
            ),
          );
        }
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                ),
                image: DecorationImage(
                  image: AssetImage(imageAsset),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Đăng bởi: $organization',
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Số tiền: $amount',
                      style: TextStyle(
                        fontSize: 12,
                        color: color,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
