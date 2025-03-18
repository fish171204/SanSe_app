import 'package:flutter/material.dart';
import 'package:tester/src/resources/MainNhaHT.dart';
import 'package:tester/src/resources/MainNguoiKK.dart';
import 'package:tester/src/resources/SharedPreferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:tester/src/models/category_data.dart';

class affiliateMarkteting extends StatefulWidget {
  const affiliateMarkteting({super.key});

  @override
  State<affiliateMarkteting> createState() => _affiliateMarktetingState();
}

class _affiliateMarktetingState extends State<affiliateMarkteting> {
  // Danh sách doanh nghiệp hiện tại (thay đổi theo danh mục)
  List<Map<String, String>> currentItems = [];
  // Biến để lưu trữ danh mục đang được chọn
  String selectedCategory = "Đồ uống";

  @override
  void initState() {
    super.initState();
    // Đặt danh mục mặc định là "Đồ uống"
    currentItems = categoryData[selectedCategory] ?? [];
  }

  // Hàm cập nhật danh sách doanh nghiệp
  void updateGridItems(String category) {
    setState(() {
      selectedCategory = category;
      currentItems = categoryData[category] ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
        title: const Text(
          "Mua hàng doanh nghiệp từ thiện",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.black),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Row(
        children: [
          // Danh sách danh mục bên trái
          Container(
            width: 100,
            color: Colors.grey.shade200,
            child: ListView(
              children: [
                categoryButton("Thực phẩm"),
                categoryButton("Đồ uống"),
                categoryButton("Thương mại điện tử"),
                categoryButton("Dịch vụ tài chính"),
                categoryButton("Du lịch"),
                categoryButton("Mobile app"),
                categoryButton("Dịch vụ trực tuyến"),
                categoryButton("Giáo dục"),
                categoryButton("Viễn thông"),
                categoryButton("Làm đẹp"),
                categoryButton("Bất động sản"),
                categoryButton("Giải trí"),
                categoryButton("Khác"),
              ],
            ),
          ),
          // Nội dung bên phải
          Expanded(
            child: Column(
              children: [
                // Thanh tìm kiếm
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Bạn muốn mua gì...",
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: const Icon(Icons.shopping_cart),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                // Lưới doanh nghiệp
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16, // Khoảng cách ngang
                    mainAxisSpacing: 16, // Khoảng cách dọc
                    padding: const EdgeInsets.all(16),
                    children: currentItems.map((item) {
                      return gridItem(
                        item["image"] ??
                            'https://yourdefaultimageurl.com/default.jpg', // Ảnh mặc định nếu null
                        item["title"] ??
                            'Không có tiêu đề', // Tiêu đề mặc định nếu null
                        item["url"], // url có thể là null, không cần ép kiểu
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Hàm tạo nút danh mục với căn chỉnh đồng đều
  Widget categoryButton(String text) {
    bool isSelected =
        text == selectedCategory; // Kiểm tra xem nút này có được chọn không
    return Padding(
      padding:
          const EdgeInsets.symmetric(vertical: 4.0), // Khoảng cách giữa các nút
      child: TextButton(
        onPressed: () => updateGridItems(text),
        style: TextButton.styleFrom(
          backgroundColor: isSelected
              ? Colors.white
              : Colors.transparent, // Màu nền khi chọn
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(
                color: isSelected
                    ? Colors.blue
                    : Colors.transparent), // Màu viền khi chọn
          ),
          padding: const EdgeInsets.symmetric(
              vertical: 12.0, horizontal: 10.0), // Căn chỉnh
        ),
        child: Align(
          alignment: Alignment.center, // Căn giữa chữ
          child: Text(
            text,
            style: TextStyle(
              color:
                  isSelected ? Colors.blue : Colors.black, // Màu chữ khi chọn
              fontSize: 14, // Kích thước chữ
              fontWeight: FontWeight.w500, // Độ dày chữ
            ),
            textAlign: TextAlign.center, // Căn giữa chữ
          ),
        ),
      ),
    );
  }

  Widget gridItem(String imageUrl, String title, String? url) {
    return GestureDetector(
      onTap: () {
        if (url != null) {
          // Open URL if it is not null
          launchURL(url);
        }
      },
      child: Column(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover, // This ensures the image fits the container
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center, // Apply textAlign directly here
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  // Hàm mở URL
  void launchURL(String url) {
    // Dùng package url_launcher để mở URL trong trình duyệt
    // ignore: deprecated_member_use
    launch(url);
  }
}
