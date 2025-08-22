import 'package:flutter/material.dart';
import 'package:tester/src/resources/pages/MainNhaHT.dart';
import 'package:tester/src/resources/pages/MainNguoiKK.dart';
import 'package:tester/src/resources/pages/SharedPreferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:tester/src/models/ac_category_data.dart';

class affiliateMarkteting extends StatefulWidget {
  const affiliateMarkteting({super.key});

  @override
  State<affiliateMarkteting> createState() => _affiliateMarktetingState();
}

class _affiliateMarktetingState extends State<affiliateMarkteting> {
  List<Map<String, String>> currentItems = [];
  List<Map<String, String>> filteredItems = [];
  String selectedCategory = "Đồ uống";
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Đặt danh mục mặc định là "Đồ uống"
    currentItems = categoryData[selectedCategory] ?? [];
    filteredItems = currentItems;
    searchController.addListener(_filterItems);
  }

  @override
  void dispose() {
    searchController.removeListener(_filterItems);
    searchController.dispose();
    super.dispose();
  }

  // Hàm cập nhật danh sách doanh nghiệp
  void updateGridItems(String category) {
    setState(() {
      selectedCategory = category;
      currentItems = categoryData[category] ?? [];
      filteredItems = currentItems;
    });
  }

  // Hàm lọc doanh nghiệp theo từ khóa tìm kiếm
  void _filterItems() {
    setState(() {
      filteredItems = currentItems
          .where((item) => item['title']!
              .toLowerCase()
              .contains(searchController.text.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
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
          Expanded(
            child: Column(
              children: [
                // Thanh tìm kiếm
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: searchController,
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
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    padding: const EdgeInsets.all(16),
                    children: filteredItems.map((item) {
                      return gridItem(
                        item["image"] ??
                            'https://yourdefaultimageurl.com/default.jpg',
                        item["title"] ?? 'Không có tiêu đề',
                        item["url"],
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

  Widget categoryButton(String text) {
    bool isSelected = text == selectedCategory;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: TextButton(
        onPressed: () => updateGridItems(text),
        style: TextButton.styleFrom(
          backgroundColor: isSelected ? Colors.white : Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(
                color: isSelected ? Colors.blue : Colors.transparent),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.blue : Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
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
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
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
