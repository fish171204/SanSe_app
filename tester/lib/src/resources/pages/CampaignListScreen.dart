import 'package:flutter/material.dart';

class CampaignListScreen extends StatelessWidget {
  const CampaignListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Danh sách chiến dịch nổi bật"),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.orange),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          // Thanh tìm kiếm
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
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

          // Danh mục cuộn ngang
          SizedBox(
            height: 40,
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

          // Danh sách chiến dịch
          Expanded(
            child: ListView(
              children: [
                _buildCampaignItem(
                    "assets/image1.jpg",
                    "Hành trình nhân đạo - Lan tỏa yêu thương",
                    "1403 lượt ủng hộ • Còn lại 23 ngày",
                    "143.888.455 đ",
                    14),
                _buildCampaignItem(
                    "assets/image2.jpg",
                    "Chung tay mang yêu thương đến cho trẻ em",
                    "453 lượt ủng hộ • Còn lại 36 ngày",
                    "24.211.956 đ",
                    40),
                _buildCampaignItem("assets/image3.jpg", "CON ĐƯỜNG MƠ ƯỚC SỐ 3",
                    "1177 lượt ủng hộ • Còn lại 30 ngày", "28.934.033 đ", 36),
                _buildCampaignItem("assets/image4.jpg", "Cầu Mơ Ước số 8",
                    "191 lượt ủng hộ • Còn lại 29 ngày", "6.471.490 đ", 22),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget cho mỗi chiến dịch
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

  // Widget cho nút danh mục cuộn ngang
  Widget _buildCategoryButton(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange.withOpacity(0.2),
          foregroundColor: Colors.orange,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        onPressed: () {},
        child: Text(text),
      ),
    );
  }
}
