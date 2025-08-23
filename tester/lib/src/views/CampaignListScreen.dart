// import 'package:flutter/material.dart';
// import 'package:tester/src/resources/pages/DangKyNhap.dart';
// import 'package:tester/src/resources/pages/MainNguoiKK.dart';
// import 'package:tester/src/resources/pages/MainNhaHT.dart';
// import 'package:tester/src/resources/pages/MyNavigationBar.dart';
// import 'package:tester/src/resources/pages/SharedPreferences.dart';

// class CampaignListScreen extends StatefulWidget {
//   const CampaignListScreen({super.key});

//   @override
//   State<CampaignListScreen> createState() => _CampaignListScreenState();
// }

// class _CampaignListScreenState extends State<CampaignListScreen> {
//   int _currentIndex = 1;

//   void _onTabTapped(int index) {
//     setState(() {
//       _currentIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Danh sách chiến dịch nổi bật"),
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.orange),
//           onPressed: () async {
//             bool isLoggedIn = await SharedPreferencesHelper.getLoginStatus();
//             String? userType = await SharedPreferencesHelper.getUserType();

//             Widget page =
//                 const Dangkynhap(); // Mặc định là trang đăng nhập nếu chưa đăng nhập

//             if (isLoggedIn) {
//               page = (userType == "nguoikhokhan" || userType == "045304004088")
//                   ? const MainNguoiKK()
//                   : const MainNguoiHT();
//             }

//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(builder: (context) => page),
//             );
//           },
//         ),
//       ),
//       body: Column(
//         children: [
//           // Thanh tìm kiếm
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//             child: TextField(
//               decoration: InputDecoration(
//                 hintText: "Nhập tên chiến dịch",
//                 prefixIcon: const Icon(Icons.search, color: Colors.grey),
//                 filled: true,
//                 fillColor: Colors.grey[200],
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(30),
//                   borderSide: BorderSide.none,
//                 ),
//               ),
//             ),
//           ),

//           // Danh mục cuộn ngang
//           SizedBox(
//             height: 40,
//             child: SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 children: [
//                   _buildCategoryButton("Xóa đói"),
//                   _buildCategoryButton("Trẻ em"),
//                   _buildCategoryButton("Người cao tuổi"),
//                   _buildCategoryButton("Người nghèo"),
//                   _buildCategoryButton("Người khuyết tật"),
//                   _buildCategoryButton("Bệnh hiểm nghèo"),
//                   _buildCategoryButton("Dân tộc thiểu số"),
//                   _buildCategoryButton("Lao động di cư"),
//                   _buildCategoryButton("Người vô gia cư"),
//                   _buildCategoryButton("Môi trường"),
//                   _buildCategoryButton("Xóa nghèo"),
//                   _buildCategoryButton("Khác"),
//                   _buildCategoryButton("Giáo dục"),
//                   _buildCategoryButton("Thiên tai"),
//                 ],
//               ),
//             ),
//           ),

//           // Danh sách chiến dịch
//           Expanded(
//             child: ListView(
//               children: [
//                 _buildCampaignItem(
//                     "assets/images/chiendich1.jpg",
//                     "Hành trình nhân đạo - Lan tỏa yêu thương",
//                     "1403 lượt ủng hộ • Còn lại 23 ngày",
//                     "143.888.455 đ",
//                     14),
//                 _buildCampaignItem(
//                     "assets/images/chiendich2.jpg",
//                     "Chung tay mang yêu thương đến cho trẻ em",
//                     "453 lượt ủng hộ • Còn lại 36 ngày",
//                     "24.211.956 đ",
//                     40),
//                 _buildCampaignItem(
//                     "assets/images/chiendich3.jpg",
//                     "CON ĐƯỜNG MƠ ƯỚC SỐ 3",
//                     "1177 lượt ủng hộ • Còn lại 38 ngày",
//                     "28.934.033 đ",
//                     36),
//                 _buildCampaignItem(
//                     "assets/images/chiendich4.jpg",
//                     "Cầu Mơ Ước số 8",
//                     "192 lượt ủng hộ • Còn lại 39 ngày",
//                     "6.471.490 đ",
//                     22),
//                 _buildCampaignItem(
//                     "assets/images/chiendich5.jpg",
//                     "Dự Án Xây Cầu Tại Xã Rạch Chèo; huyện Phú Tân; Tỉnh Cà Mau",
//                     "784 lượt ủng hộ • Còn lại 2 ngày",
//                     "105.471.490 đ",
//                     22),
//                 _buildCampaignItem(
//                     "assets/images/chiendich6.jpg",
//                     "Quỹ Yêu thương HLC",
//                     "1.804 lượt ủng hộ • Còn lại 1013 ngày",
//                     "155.551.490 đ",
//                     22),
//                 _buildCampaignItem(
//                     "assets/images/chiendich7.jpg",
//                     "Dự Án Hiện Thực Hoá Ước Mơ...",
//                     "656 lượt ủng hộ • Còn lại 7 ngày",
//                     "24.136.620 đ",
//                     22),
//                 _buildCampaignItem(
//                     "assets/images/chiendich8.jpg",
//                     "Lời khẩn cầu của một người mẹ...",
//                     "191 lượt ủng hộ • Còn lại 6 ngày",
//                     "6.471.222 đ",
//                     22),
//                 _buildCampaignItem(
//                     "assets/images/chiendich9.jpg",
//                     "Dự án cúng dường đại hồng...",
//                     "2.517 lượt ủng hộ • Còn lại 29 ngày",
//                     "73.397.490 đ",
//                     22),
//                 _buildCampaignItem(
//                     "assets/images/chiendich10.jpg",
//                     "Kêu gọi quỹ Mixed Nuts",
//                     "4.623 lượt ủng hộ • Còn lại 24 ngày",
//                     "160.020.490 đ",
//                     22),
//               ],
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: MyNavigationBar(
//         currentIndex: _currentIndex,
//         onTap: _onTabTapped,
//       ),
//     );
//   }

//   // Widget cho mỗi chiến dịch
//   Widget _buildCampaignItem(String imagePath, String title, String subtitle,
//       String amount, int progress) {
//     return Card(
//       margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: Padding(
//         padding: const EdgeInsets.all(12),
//         child: Row(
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(8),
//               child: Image.asset(imagePath,
//                   width: 80, height: 80, fit: BoxFit.cover),
//             ),
//             const SizedBox(width: 12),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(title,
//                       style: const TextStyle(
//                           fontWeight: FontWeight.bold, fontSize: 16)),
//                   const SizedBox(height: 4),
//                   Text(subtitle, style: TextStyle(color: Colors.grey[600])),
//                   const SizedBox(height: 4),
//                   Text(amount,
//                       style: const TextStyle(
//                           fontWeight: FontWeight.bold, color: Colors.orange)),
//                   const SizedBox(height: 4),
//                   LinearProgressIndicator(
//                     value: progress / 100,
//                     backgroundColor: Colors.grey[300],
//                     color: Colors.orange,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // Widget cho nút danh mục cuộn ngang
//   Widget _buildCategoryButton(String text) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 4),
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Colors.white70,
//           foregroundColor: Colors.black,
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//         ),
//         onPressed: () {},
//         child: Text(text),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:tester/src/views/DangKyNhap.dart';
import 'package:tester/src/views/MainNguoiKK.dart';
import 'package:tester/src/views/MainNhaHT.dart';
import 'package:tester/src/views/MyNavigationBar.dart';
import 'package:tester/src/views/SharedPreferences.dart';

class CampaignListScreen extends StatefulWidget {
  const CampaignListScreen({super.key});

  @override
  State<CampaignListScreen> createState() => _CampaignListScreenState();
}

class _CampaignListScreenState extends State<CampaignListScreen> {
  int _currentIndex = 1;
  String _searchQuery = "";
  final TextEditingController _searchController = TextEditingController();

  void _onSearchChanged(String query) {
    setState(() {
      _searchQuery = query;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Danh sách chiến dịch nổi bật",
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () async {
            bool isLoggedIn = await SharedPreferencesHelper.getLoginStatus();
            String? userType = await SharedPreferencesHelper.getUserType();

            Widget page =
                const Dangkynhap(); // Mặc định là trang đăng nhập nếu chưa đăng nhập

            if (isLoggedIn) {
              page = (userType == "nguoikhokhan" || userType == "045304004088")
                  ? const MainNguoiKK()
                  : const MainNguoiHT();
            }

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => page),
            );
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              controller: _searchController,
              onChanged: _onSearchChanged,
              decoration: InputDecoration(
                hintText: "Nhập tên chiến dịch",
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: SizedBox(
              height: 50,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildCategoryButton("Xóa đói"),
                    _buildCategoryButton("Trẻ em"),
                    _buildCategoryButton("Người cao tuổi"),
                    _buildCategoryButton("Người nghèo"),
                    _buildCategoryButton("Người khuyết tật"),
                    _buildCategoryButton("Bệnh hiểm nghèo"),
                    _buildCategoryButton("Dân tộc thiểu số"),
                    _buildCategoryButton("Lao động di cư"),
                    _buildCategoryButton("Người vô gia cư"),
                    _buildCategoryButton("Môi trường"),
                    _buildCategoryButton("Xóa nghèo"),
                    _buildCategoryButton("Khác"),
                    _buildCategoryButton("Giáo dục"),
                    _buildCategoryButton("Thiên tai"),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: _buildFilteredCampaigns(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: MyNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  List<Widget> _buildFilteredCampaigns() {
    final List<Map<String, dynamic>> campaigns = [
      {
        "imagePath": "assets/images/chiendich1.jpg",
        "title": "Hành trình nhân đạo - Lan tỏa yêu thương",
        "subtitle": "1403 lượt ủng hộ • Còn lại 23 ngày",
        "amount": "143.888.455 đ",
        "progress": 14,
      },
      {
        "imagePath": "assets/images/chiendich2.jpg",
        "title": "Chung tay mang yêu thương đến cho trẻ em",
        "subtitle": "453 lượt ủng hộ • Còn lại 36 ngày",
        "amount": "24.211.956 đ",
        "progress": 40,
      },
      {
        "imagePath": "assets/images/chiendich3.jpg",
        "title": "CON ĐƯỜNG MƠ ƯỚC SỐ 3",
        "subtitle": "1177 lượt ủng hộ • Còn lại 38 ngày",
        "amount": "28.934.033 đ",
        "progress": 36,
      },
      {
        "imagePath": "assets/images/chiendich4.jpg",
        "title": "Cầu Mơ Ước số 8",
        "subtitle": "192 lượt ủng hộ • Còn lại 39 ngày",
        "amount": "6.471.490 đ",
        "progress": 22,
      },
      {
        "imagePath": "assets/images/chiendich5.jpg",
        "title": "Dự Án Xây Cầu Tại Xã Rạch Chèo; huyện Phú Tân; Tỉnh Cà Mau",
        "subtitle": "784 lượt ủng hộ • Còn lại 2 ngày",
        "amount": "105.471.490 đ",
        "progress": 28,
      },
      {
        "imagePath": "assets/images/chiendich6.jpg",
        "title": "Quỹ Yêu thương HLC",
        "subtitle": "1.804 lượt ủng hộ • Còn lại 1013 ngày",
        "amount": "155.551.490 đ",
        "progress": 44,
      },
      {
        "imagePath": "assets/images/chiendich7.jpg",
        "title": "Dự Án Hiện Thực Hoá Ước Mơ...",
        "subtitle": "656 lượt ủng hộ • Còn lại 7 ngày",
        "amount": "24.136.620 đ",
        "progress": 32,
      },
      {
        "imagePath": "assets/images/chiendich8.jpg",
        "title": "Lời khẩn cầu của một người mẹ...",
        "subtitle": "191 lượt ủng hộ • Còn lại 6 ngày",
        "amount": "6.471.222 đ",
        "progress": 59,
      },
      {
        "imagePath": "assets/images/chiendich9.jpg",
        "title": "Dự án cúng dường đại hồng...",
        "subtitle": "2.517 lượt ủng hộ • Còn lại 29 ngày",
        "amount": "73.397.490 đ",
        "progress": 12,
      },
      {
        "imagePath": "assets/images/chiendich10.jpg",
        "title": "Dự án kêu gọi quỹ Mixed Nuts",
        "subtitle": "4.623 lượt ủng hộ • Còn lại 24 ngày",
        "amount": "160.020.490 đ",
        "progress": 39,
      },
    ];

    return campaigns
        .where((campaign) => campaign["title"]
            .toLowerCase()
            .contains(_searchQuery.toLowerCase()))
        .map((campaign) => _buildCampaignItem(
              campaign["imagePath"],
              campaign["title"],
              campaign["subtitle"],
              campaign["amount"],
              campaign["progress"],
            ))
        .toList();
  }

  Widget _buildCampaignItem(String imagePath, String title, String subtitle,
      String amount, int progress) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(imagePath,
                  width: 80, height: 80, fit: BoxFit.cover),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 4),
                  Text(subtitle, style: TextStyle(color: Colors.grey[600])),
                  const SizedBox(height: 4),
                  Text(amount,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.orange)),
                  const SizedBox(height: 4),
                  LinearProgressIndicator(
                    value: progress / 100,
                    backgroundColor: Colors.grey[300],
                    color: Colors.orange,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryButton(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white70,
          foregroundColor: Colors.black,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        onPressed: () {},
        child: Text(text),
      ),
    );
  }
}
