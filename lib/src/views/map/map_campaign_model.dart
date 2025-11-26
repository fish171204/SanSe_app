import 'package:flutter/material.dart';

// 1. Model dữ liệu chiến dịch
class MapCampaignModel {
  final String id;
  final String title;
  final String imageUrl;
  final int supportCount;
  final int daysLeft;
  final String raisedAmount;
  final double progress; // 0.0 đến 1.0

  MapCampaignModel({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.supportCount,
    required this.daysLeft,
    required this.raisedAmount,
    required this.progress,
  });
}

// 2. Danh sách dữ liệu giả (Global hoặc Static)
final List<MapCampaignModel> dummyCampaigns = [
  MapCampaignModel(
    id: '1',
    title: 'Trái tim cho em An',
    imageUrl: 'assets/videos/image_1.png',
    supportCount: 1,
    daysLeft: 23,
    raisedAmount: '80.000.000 đ',
    progress: 19.3,
  ),
  MapCampaignModel(
    id: '2',
    title: 'Mái ấm cho em',
    imageUrl: 'assets/videos/image_2.png',
    supportCount: 1,
    daysLeft: 36,
    raisedAmount: '25.000.000 đ',
    progress: 72.0,
  ),
  MapCampaignModel(
    id: '3',
    title: 'Hỗ trợ sinh hoạt phí & sửa lều',
    imageUrl: 'assets/videos/image_3.png',
    supportCount: 1,
    daysLeft: 38,
    raisedAmount: '5.000.000 đ',
    progress: 84.0,
  ),
  MapCampaignModel(
    id: '8',
    title: 'Gánh hàng rong của Ngoại',
    imageUrl: 'assets/videos/image_8.png',
    supportCount: 1,
    daysLeft: 39,
    raisedAmount: '20.000.000 đ',
    progress: 10.0,
  ),
  MapCampaignModel(
    id: '5',
    title: 'Hỗ trợ sinh hoạt phí tuổi già',
    imageUrl: 'assets/videos/image_5.png',
    supportCount: 1,
    daysLeft: 33,
    raisedAmount: '30.000.000 đ',
    progress: 75.0,
  ),
  MapCampaignModel(
    id: '4',
    title: 'Giúp cụ Lành nuôi con bại liệt',
    imageUrl: 'assets/videos/image_4.png',
    supportCount: 1,
    daysLeft: 22,
    raisedAmount: '20.000.000 đ',
    progress: 60.0,
  ),
  MapCampaignModel(
    id: '6',
    title: 'Giúp ông cụ bán vé số',
    imageUrl: 'assets/videos/image_6.png',
    supportCount: 1,
    daysLeft: 15,
    raisedAmount: '40.000.000 đ',
    progress: 31.2,
  ),
  MapCampaignModel(
    id: '7',
    title: 'Tiếp sức mưu sinh',
    imageUrl: 'assets/videos/image_7.png',
    supportCount: 1,
    daysLeft: 31,
    raisedAmount: '20.000.000 đ',
    progress: 20.0,
  ),
  MapCampaignModel(
    id: '9',
    title: '3 cha con sống trong căn nhà 2m2',
    imageUrl: 'assets/images/nguoikhokhan1.jpg',
    supportCount: 1,
    daysLeft: 20,
    raisedAmount: '20.000.000 đ',
    progress: 20.0,
  ),
  MapCampaignModel(
    id: '10',
    title: 'Cụ bà 90 tuổi bị 4 con bỏ rơi, tự bò ngoài đường...',
    imageUrl: 'assets/images/nguoikhokhan8.jpg',
    supportCount: 1,
    daysLeft: 44,
    raisedAmount: '10.000.000 đ',
    progress: 10.0,
  ),
  MapCampaignModel(
    id: '11',
    title: 'Mẹ già 80 tuổi còng lưng chăm con trai suy thận',
    imageUrl: 'assets/images/nguoikhokhan9.jpg',
    supportCount: 1,
    daysLeft: 22,
    raisedAmount: '40.000.000 đ',
    progress: 5.0,
  ),
  MapCampaignModel(
    id: '12',
    title: 'Tính mạng mong manh của bé gái 3 tuổi mắc bệnh xơ gan',
    imageUrl: 'assets/images/HinhAnh_Demo.jpg',
    supportCount: 1,
    daysLeft: 20,
    raisedAmount: '5.000.000 đ',
    progress: 100.0,
  ),
];

// 3. Widget Card hiển thị thông tin (Giống ảnh bạn gửi)
class CampaignCard extends StatelessWidget {
  final MapCampaignModel data;
  const CampaignCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F5FA),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Ảnh
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: _buildImage(data.imageUrl),
          ),
          const SizedBox(width: 12),
          // Nội dung
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  '${data.supportCount} lượt ủng hộ • Còn lại ${data.daysLeft} ngày',
                  style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                ),
                const SizedBox(height: 6),
                Text(
                  data.raisedAmount,
                  style: const TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 6),
                // Progress Bar
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: data.progress / 100,
                    minHeight: 6,
                    backgroundColor: Colors.grey[300],
                    color: Colors.orange,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImage(String url) {
    // Nếu đường dẫn bắt đầu bằng http hoặc https -> Dùng Image.network
    if (url.startsWith('http')) {
      return Image.network(
        url,
        width: 80,
        height: 80,
        fit: BoxFit.cover,
        errorBuilder: (c, o, s) => _buildErrorPlaceholder(),
      );
    }
    // Ngược lại -> Dùng Image.asset
    else {
      return Image.asset(
        url,
        width: 80,
        height: 80,
        fit: BoxFit.cover,
        errorBuilder: (c, o, s) => _buildErrorPlaceholder(),
      );
    }
  }

  Widget _buildErrorPlaceholder() {
    return Container(
      width: 80,
      height: 80,
      color: Colors.grey[300],
      child: const Icon(Icons.image_not_supported),
    );
  }
}
