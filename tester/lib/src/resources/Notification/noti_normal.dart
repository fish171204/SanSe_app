import 'package:flutter/material.dart';
import 'package:tester/src/resources/pages/MainNguoiKK.dart';
import 'package:tester/src/resources/pages/MainNhaHT.dart';
import 'package:tester/src/resources/Notification/noti_emergency.dart';
import 'package:tester/src/resources/pages/DangKyNhap.dart';
import 'package:tester/src/resources/pages/SharedPreferences.dart';
import 'package:tester/src/resources/pages/MyNavigationBar.dart';
import 'package:tester/src/resources/pages/XemBaiDangKhoKhanDemo.dart';

class ViewNotification extends StatefulWidget {
  const ViewNotification({super.key});

  @override
  _ViewNotificationState createState() => _ViewNotificationState();
}

class _ViewNotificationState extends State<ViewNotification> {
  int _currentIndex = 2;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  String selectedFilter = "Regular difficult circumstances";

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
                    "Filter",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    leading: Radio<String>(
                      value: "Regular difficult circumstances",
                      groupValue: selectedFilter,
                      onChanged: (String? value) {
                        setState(() {
                          selectedFilter = value!;
                        });
                        Navigator.pop(context);
                      },
                    ),
                    title: const Text("Regular difficult circumstances"),
                    trailing:
                        const Icon(Icons.notifications, color: Colors.orange),
                  ),
                  ListTile(
                    leading: Radio<String>(
                      value: "Emergency difficult circumstances",
                      groupValue: selectedFilter,
                      onChanged: (String? value) {
                        setState(() {
                          selectedFilter = value!;
                        });
                        Navigator.pop(context);
                        // Navigate to Emergency.dart screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const Emergency(), // Call Emergency screen
                          ),
                        );
                      },
                    ),
                    title: const Text("Emergency difficult circumstances"),
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
            // Get login status and account type
            bool isLoggedIn = await SharedPreferencesHelper.getLoginStatus();
            String? userType = await SharedPreferencesHelper.getUserType();

            // Navigate based on account type
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
              // If not logged in, navigate to login screen
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const Dangkynhap(),
                ),
              );
            }
          },
          child: const Icon(Icons.arrow_back,
              color: Colors.black), // Only use Icon here
        ),
        title: const Text(
          'Notifications',
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
                    'LIST OF DIFFICULT CIRCUMSTANCES',
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
                          "Filter",
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
                      'The fragile life of a 3-year-old girl with liver cirrhosis',
                  organization: 'Lê Thị Thuý Kiều',
                  amount: '5.000.000 VND',
                  imageAsset: 'assets/HinhAnh_Demo.jpg',
                  color: Colors.red,
                ),
                NotificationCard(
                  title:
                      '90-year-old grandmother abandoned by 4 children, crawling on the street to catch a ride to the hospital',
                  organization: 'Quỹ Thiện Tâm',
                  amount: '3.000.000 VND',
                  imageAsset: 'assets/nguoikhokhan8.jpg',
                  color: Colors.red,
                ),
                NotificationCard(
                  title:
                      '3 father and son living in a 2m2 house, eating irregularly',
                  organization: 'Nguyễn Văn Huy',
                  amount: '10.000.000 VND',
                  imageAsset: 'assets/HinhAnh_0.png',
                  color: Colors.red,
                ),
                NotificationCard(
                  title:
                      '80-year-old mother with hunched back caring for son with kidney failure and daughter with cancer',
                  organization: 'Trương Anh Vịnh',
                  amount: '60.000.000 VND',
                  imageAsset: 'assets/nguoikhokhan9.jpg',
                  color: Colors.red,
                ),
                NotificationCard(
                  title:
                      'Bridge Construction Project at Rach Cheo Commune, Phu Tan District, Ca Mau Province',
                  organization: 'Trường Thành',
                  amount: '500.000.000 VND',
                  imageAsset: 'assets/images/chiendich5.jpg',
                  color: Colors.red,
                ),
                NotificationCard(
                  title:
                      'A mother\'s plea to find the world\'s most expensive medicine to save her son\'s life!',
                  organization: 'Quynh Thai',
                  amount: '40.000.000.000 VND',
                  imageAsset: 'assets/images/chiendich8.jpg',
                  color: Colors.red,
                ),
                NotificationCard(
                  title:
                      'Project to Realize the Dream House of Pham Van Hieu Family in Ba To District, Quang Ngai and Do Van Minh Family',
                  organization: 'Infrastructure Connection Community',
                  amount: '100.000.000 VND',
                  imageAsset: 'assets/images/chiendich7.jpg',
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
        if (title ==
            'The fragile life of a 3-year-old girl with liver cirrhosis') {
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
                      'Posted by: $organization',
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Amount: $amount',
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
