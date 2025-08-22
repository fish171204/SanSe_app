import 'package:flutter/material.dart';
import 'package:tester/src/resources/pages/MainNguoiKK.dart';
import 'package:tester/src/resources/pages/MainNhaHT.dart';
import 'package:tester/src/resources/Notification/noti_normal.dart';
import 'package:tester/src/resources/pages/DangKyNhap.dart';
import 'package:tester/src/resources/pages/SharedPreferences.dart';
import 'package:tester/src/resources/pages/MyNavigationBar.dart';

class Emergency extends StatefulWidget {
  const Emergency({super.key});

  @override
  _EmergencyState createState() => _EmergencyState();
}

class _EmergencyState extends State<Emergency> {
  int _currentIndex = 2;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  String selectedFilter = "Emergency difficult circumstances";

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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ViewNotification(),
                          ),
                        );
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
          child: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: const Text(
          'Notifications',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.notification_important,
                  color: Colors.red,
                  size: 26,
                ),
                onPressed: () {},
              ),
              Positioned(
                right: 5,
                top: 2,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: const Text(
                    '2',
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
                    'LIST OF EMERGENCY CIRCUMSTANCES',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.red,
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
                EmergencyNotificationCard(
                  title:
                      '3 father and son living in a 2m2 house, eating irregularly',
                  organization: 'Emergency Relief Fund ...',
                  amount: '10.000.000 VND',
                  imageAsset: 'assets/HinhAnh_0.png',
                  color: Colors.red,
                ),
                EmergencyNotificationCard(
                  title:
                      '90-year-old grandmother abandoned by 4 children, crawling on the street to catch a ride to the hospital',
                  organization: 'Charity Fund',
                  amount: '3.000.000 VND',
                  imageAsset: 'assets/HinhAnh1.png',
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

class EmergencyNotificationCard extends StatelessWidget {
  final String title;
  final String organization;
  final String amount;
  final String imageAsset;
  final Color color;

  const EmergencyNotificationCard({
    super.key,
    required this.title,
    required this.organization,
    required this.amount,
    required this.imageAsset,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
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
    );
  }
}
