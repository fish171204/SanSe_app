import '../../models/admin/admin_post_model.dart';

abstract class PostRepository {
  Future<List<AdminPostModel>> getAllPosts();
  Future<List<AdminPostModel>> searchPosts(String query);
  Future<List<AdminPostModel>> getFilteredPosts(String filter);
  Future<void> deletePost(String title);
  Future<void> updatePostStatus(String title, String newStatus);
}

class PostRepositoryImpl implements PostRepository {
  // Mock data - trong thực tế sẽ kết nối với API hoặc database
  static final List<Map<String, dynamic>> _postsData = [
    {
      "imagePath": "assets/images/HinhAnh_Demo.jpg",
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

  @override
  Future<List<AdminPostModel>> getAllPosts() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));
    return _postsData
        .where((post) => !post['isDeleted'])
        .map((postData) => AdminPostModel.fromMap(postData))
        .toList();
  }

  @override
  Future<List<AdminPostModel>> searchPosts(String query) async {
    final posts = await getAllPosts();
    if (query.isEmpty) return posts;

    return posts.where((post) {
      return post.title.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }

  @override
  Future<List<AdminPostModel>> getFilteredPosts(String filter) async {
    final posts = await getAllPosts();

    switch (filter) {
      case "Chưa hoàn thành":
        return posts.where((post) => post.progress < 100).toList();
      case "Đã hoàn thành":
        return posts.where((post) => post.progress == 100).toList();
      default:
        return posts;
    }
  }

  @override
  Future<void> deletePost(String title) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 300));
    final index = _postsData.indexWhere((post) => post['title'] == title);
    if (index != -1) {
      _postsData[index]['isDeleted'] = true;
    }
  }

  @override
  Future<void> updatePostStatus(String title, String newStatus) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 300));
    final index = _postsData.indexWhere((post) => post['title'] == title);
    if (index != -1) {
      if (newStatus == "unavailable") {
        _postsData[index]['originalProgress'] = _postsData[index]['progress'];
        _postsData[index]['status'] = "unavailable";
        _postsData[index]['progress'] = 100;
      } else if (newStatus == "available") {
        _postsData[index]['status'] = "available";
        _postsData[index]['progress'] = _postsData[index]['originalProgress'];
      }
    }
  }
}
