import 'package:flutter/material.dart';

class PostManagementTab extends StatefulWidget {
  const PostManagementTab({super.key});

  @override
  _PostManagementTabState createState() => _PostManagementTabState();
}

class _PostManagementTabState extends State<PostManagementTab> {
  String _searchQuery = "";
  String _selectedFilter = "Tất cả";
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> posts = [
    {
      "imagePath": "assets/HinhAnh_Demo.jpg",
      "title": "Tính mạng mong manh của bé gái 3 tuổi mắc bệnh xơ gan",
      "subtitle": "1 lượt ủng hộ • Còn lại 18 ngày",
      "amount": "5.000.000 đ",
      "progress": 100,
      "originalProgress": 100,
      "isDeleted": false,
      "status": "unavailable",
    },
    {
      "imagePath": "assets/images/chiendich1.jpg",
      "title": "Hành trình nhân đạo - Lan tỏa yêu thương",
      "subtitle": "1403 lượt ủng hộ • Còn lại 23 ngày",
      "amount": "143.888.455 đ",
      "progress": 14,
      "originalProgress": 14,
      "isDeleted": false,
      "status": "available",
    },
    {
      "imagePath": "assets/images/chiendich2.jpg",
      "title": "Chung tay mang yêu thương đến cho trẻ em",
      "subtitle": "453 lượt ủng hộ • Còn lại 36 ngày",
      "amount": "24.211.956 đ",
      "progress": 40,
      "originalProgress": 40,
      "isDeleted": false,
      "status": "unavailable",
    },
    {
      "imagePath": "assets/images/chiendich3.jpg",
      "title": "CON ĐƯỜNG MƠ ƯỚC SỐ 3",
      "subtitle": "1177 lượt ủng hộ • Còn lại 38 ngày",
      "amount": "28.934.033 đ",
      "progress": 36,
      "originalProgress": 36,
      "isDeleted": false,
      "status": "available",
    },
    {
      "imagePath": "assets/images/chiendich4.jpg",
      "title": "Cầu Mơ Ước số 8",
      "subtitle": "192 lượt ủng hộ • Còn lại 39 ngày",
      "amount": "6.471.490 đ",
      "progress": 22,
      "originalProgress": 22,
      "isDeleted": false,
      "status": "unavailable",
    },
    {
      "imagePath": "assets/images/chiendich5.jpg",
      "title": "Dự Án Xây Cầu Tại Xã Rạch Chèo; huyện Phú Tân; Tỉnh Cà Mau",
      "subtitle": "784 lượt ủng hộ • Còn lại 2 ngày",
      "amount": "105.471.490 đ",
      "progress": 28,
      "originalProgress": 28,
      "isDeleted": false,
      "status": "available",
    },
    {
      "imagePath": "assets/images/chiendich6.jpg",
      "title": "Quỹ Yêu thương HLC",
      "subtitle": "1.804 lượt ủng hộ • Còn lại 1013 ngày",
      "amount": "155.551.490 đ",
      "progress": 44,
      "originalProgress": 44,
      "isDeleted": false,
      "status": "available",
    },
    {
      "imagePath": "assets/images/chiendich7.jpg",
      "title": "Dự Án Hiện Thực Hoá Ước Mơ...",
      "subtitle": "656 lượt ủng hộ • Còn lại 7 ngày",
      "amount": "25.000.000 đ",
      "progress": 100,
      "originalProgress": 100,
      "isDeleted": false,
      "status": "available",
    },
    {
      "imagePath": "assets/images/chiendich8.jpg",
      "title": "Lời khẩn cầu của một người mẹ...",
      "subtitle": "191 lượt ủng hộ • Còn lại 6 ngày",
      "amount": "6.471.222 đ",
      "progress": 59,
      "originalProgress": 59,
      "isDeleted": false,
      "status": "available",
    },
    {
      "imagePath": "assets/images/chiendich9.jpg",
      "title": "Dự án cúng dường đại hồng...",
      "subtitle": "2.517 lượt ủng hộ • Còn lại 29 ngày",
      "amount": "73.397.490 đ",
      "progress": 12,
      "originalProgress": 12,
      "isDeleted": false,
      "status": "available",
    },
    {
      "imagePath": "assets/images/chiendich10.jpg",
      "title": "Dự án kêu gọi quỹ Mixed Nuts",
      "subtitle": "4.623 lượt ủng hộ • Còn lại 24 ngày",
      "amount": "160.020.490 đ",
      "progress": 39,
      "originalProgress": 39,
      "isDeleted": false,
      "status": "available",
    },
  ];

  void _changeStatus(String title, String newStatus) {
    setState(() {
      var post = posts.firstWhere((post) => post["title"] == title);

      if (newStatus == "unavailable") {
        post["originalProgress"] = post["progress"];
        post["status"] = "unavailable";
        post["progress"] = 100;
      } else if (newStatus == "available") {
        post["status"] = "available";
        post["progress"] = post["originalProgress"];
      }
    });
  }

  void _onSearchChanged(String query) {
    setState(() {
      _searchQuery = query;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              controller: _searchController,
              onChanged: _onSearchChanged,
              decoration: InputDecoration(
                hintText: "Nhập tên bài đăng",
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
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Lọc bài đăng:",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                DropdownButton<String>(
                  value: _selectedFilter,
                  onChanged: (value) {
                    setState(() {
                      _selectedFilter = value!;
                    });
                  },
                  items: ["Tất cả", "Chưa hoàn thành", "Đã hoàn thành"]
                      .map((filter) => DropdownMenuItem(
                            value: filter,
                            child: Text(filter),
                          ))
                      .toList(),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: _buildFilteredPosts(),
            ),
          ),
        ],
      ),
    );
  }

  // Để hiển thị các bài đăng và trạng thái
  List<Widget> _buildFilteredPosts() {
    return posts
        .where((post) =>
            post["title"].toLowerCase().contains(_searchQuery.toLowerCase()) &&
            !_isFilteredOut(post) && // Áp dụng bộ lọc
            !post["isDeleted"])
        .map((post) => _buildPostItem(
              post["imagePath"],
              post["title"],
              post["subtitle"],
              post["amount"],
              post["progress"],
              post["status"],
            ))
        .toList();
  }

  // Xây dựng item cho bài đăng
  Widget _buildPostItem(String imagePath, String title, String subtitle,
      String amount, int progress, String status) {
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
                  const SizedBox(height: 4),
                  // Hiển thị trạng thái (available/unavailable)
                  Text(
                    progress == 100
                        ? "Trạng thái: Đã hoàn thành"
                        : "Trạng thái: Chưa hoàn thành",
                    style: TextStyle(
                      color: progress == 100 ? Colors.green : Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            PopupMenuButton<int>(
              icon: const Icon(Icons.more_vert),
              onSelected: (value) {
                switch (value) {
                  case 1:
                    _showConfirmationDialog('Xóa bài đăng',
                        'Bạn có chắc chắn muốn xóa bài đăng này?', () {
                      setState(() {
                        posts.firstWhere(
                                (post) => post["title"] == title)["isDeleted"] =
                            true;
                      });
                      _showSuccessDialog('Xóa bài đăng thành công!');
                    });
                    break;
                  case 2:
                    _showConfirmationDialog('Chuyển sang Unavailable',
                        'Bạn có chắc chắn muốn chuyển trạng thái bài đăng này sang Unavailable (Đã hoàn thành) ?',
                        () {
                      _changeStatus(title, "unavailable");
                      _showSuccessDialog(
                          'Chuyển trạng thái sang Unavailable thành công!');
                    });
                    break;
                  case 3:
                    _showConfirmationDialog('Chuyển sang Available',
                        'Bạn có chắc chắn muốn chuyển trạng thái bài đăng này sang Available (Chưa hoàn thành) ?',
                        () {
                      _changeStatus(title, "available");
                      _showSuccessDialog(
                          'Chuyển trạng thái sang Available thành công!');
                    });
                    break;
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
                const PopupMenuItem<int>(value: 1, child: Text('Xóa')),
                const PopupMenuItem<int>(value: 2, child: Text('Unavailable')),
                const PopupMenuItem<int>(value: 3, child: Text('Available')),
              ],
            ),
          ],
        ),
      ),
    );
  }

  bool _isFilteredOut(Map<String, dynamic> post) {
    if (_selectedFilter == "Chưa hoàn thành") {
      return post["progress"] == 100;
    } else if (_selectedFilter == "Đã hoàn thành") {
      return post["progress"] < 100;
    }
    return false; // Nếu không có bộ lọc nào được chọn (Tất cả), thì không lọc bài đăng nào.
  }

  void _showConfirmationDialog(
      String title, String message, VoidCallback onConfirm) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Hủy'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                onConfirm(); // Call the action on confirm
              },
              child: const Text('Xác nhận'),
            ),
          ],
        );
      },
    );
  }

  void _showSuccessDialog(String message) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 10,
          child: Container(
            padding: const EdgeInsets.all(20),
            height: 260,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.check_circle_outline,
                  color: Colors.green,
                  size: 60,
                ),
                const SizedBox(height: 15),
                const Text(
                  "Thành công!",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 15),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    "OK",
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
