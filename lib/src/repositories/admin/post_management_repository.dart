import '../../models/admin/admin_post_model.dart';

abstract class PostRepository {
  Future<List<AdminPostModel>> getAllPosts();
  Future<List<AdminPostModel>> getPendingPosts();
  Future<List<AdminPostModel>> searchPosts(String query);
  Future<List<AdminPostModel>> getFilteredPosts(String filter);
  Future<void> deletePost(String title);
  Future<void> updatePostStatus(String title, String newStatus);
  Future<void> approvePost(String title);
  Future<void> rejectPost(String title);
  Future<List<AdminPostModel>> getSpamPosts();
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
      "imagePath": "assets/videos/image_2.png",
      "title": "Mái ấm cho em",
      "subtitle": "1 lượt ủng hộ • Còn lại 36 ngày",
      "amount": "25.000.000 đ",
      "progress": 72,
      "originalProgress": 72,
      "isDeleted": false,
      "status": "available",
    },
    {
      "imagePath": "assets/videos/image_3.png",
      "title": "Hỗ trợ sinh hoạt phí & sửa lều",
      "subtitle": "1 lượt ủng hộ • Còn lại 38 ngày",
      "amount": "5.000.000 đ",
      "progress": 84,
      "originalProgress": 84,
      "isDeleted": false,
      "status": "available",
    },
    {
      "imagePath": "assets/videos/image_8.png",
      "title": "Gánh hàng rong của Ngoại",
      "subtitle": "1 lượt ủng hộ • Còn lại 39 ngày",
      "amount": "20.000.000 đ",
      "progress": 10,
      "originalProgress": 10,
      "isDeleted": false,
      "status": "available",
    },
    {
      "imagePath": "assets/videos/image_5.png",
      "title": "Hỗ trợ sinh hoạt phí tuổi già",
      "subtitle": "1 lượt ủng hộ • Còn lại 33 ngày",
      "amount": "30.000.000 đ",
      "progress": 75,
      "originalProgress": 75,
      "isDeleted": false,
      "status": "available",
    },
    {
      "imagePath": "assets/videos/image_4.png",
      "title": "Giúp cụ Lành nuôi con bại liệt",
      "subtitle": "1 lượt ủng hộ • Còn lại 22 ngày",
      "amount": "20.000.000 đ",
      "progress": 60,
      "originalProgress": 60,
      "isDeleted": false,
      "status": "available",
    },
    {
      "imagePath": "assets/videos/image_6.png",
      "title": "Giúp ông cụ bán vé số",
      "subtitle": "1 lượt ủng hộ • Còn lại 15 ngày",
      "amount": "40.000.000 đ",
      "progress": 31,
      "originalProgress": 31,
      "isDeleted": false,
      "status": "available",
    },
    {
      "imagePath": "assets/videos/image_7.png",
      "title": "Tiếp sức mưu sinh",
      "subtitle": "1 lượt ủng hộ • Còn lại 31 ngày",
      "amount": "20.000.000 đ",
      "progress": 20,
      "originalProgress": 20,
      "isDeleted": false,
      "status": "available",
    },
    {
      "imagePath": "assets/images/nguoikhokhan1.jpg",
      "title": "3 cha con sống trong căn nhà 2m2",
      "subtitle": "1 lượt ủng hộ • Còn lại 20 ngày",
      "amount": "20.000.000 đ",
      "progress": 20,
      "originalProgress": 20,
      "isDeleted": false,
      "status": "available",
    },
    {
      "imagePath": "assets/images/nguoikhokhan8.jpg",
      "title": "Cụ bà 90 tuổi bị 4 con bỏ rơi, tự bò ngoài đường...",
      "subtitle": "1 lượt ủng hộ • Còn lại 44 ngày",
      "amount": "10.000.000 đ",
      "progress": 10,
      "originalProgress": 10,
      "isDeleted": false,
      "status": "available",
    },
    {
      "imagePath": "assets/images/nguoikhokhan9.jpg",
      "title": "Mẹ già 80 tuổi còng lưng chăm con trai suy thận",
      "subtitle": "1 lượt ủng hộ • Còn lại 22 ngày",
      "amount": "40.000.000 đ",
      "progress": 5,
      "originalProgress": 5,
      "isDeleted": false,
      "status": "available",
    },
    {
      "imagePath": "assets/images/HinhAnh_Demo.jpg",
      "title": "Tính mạng mong manh của bé gái 3 tuổi mắc bệnh xơ gan",
      "senderName": "Lê Thị Thúy Kiều",
      "subtitle": "Người gửi: Lê Thị Thúy Kiều",
      "amount": "5.000.000 đ",
      "progress": 0,
      "originalProgress": 0,
      "isDeleted": false,
      "status": "pending",
      "submissionDate": "13/12/2025",
    },
    {
      "imagePath": "assets/images/nguoikhokhan8.jpg",
      "title": "Cụ bà 90 tuổi bị 4 con bỏ rơi, tự bò ngoài đường...",
      "subtitle": "Người gửi: Hội từ thiện X",
      "amount": "20.000.000 đ",
      "progress": 0,
      "originalProgress": 0,
      "isDeleted": false,
      "status": "pending",
      "submissionDate": "06/12/2025",
    },
    // SPAM EXAMPLES
    {
      "imagePath": "assets/images/chiendich1.jpg",
      "title": "Cần tiền gấp hỗ trợ mổ tim",
      "subtitle": "Người gửi: Nguyễn Văn Spam",
      "senderName": "Nguyễn Văn Spam",
      "amount": "100.000.000 đ",
      "progress": 0,
      "originalProgress": 0,
      "isDeleted": false,
      "status": "pending",
      "submissionDate": "14/11/2025 09:00",
    },
    {
      "imagePath": "assets/images/chiendich1.jpg",
      "title": "Cần tiền gấp hỗ trợ mổ tim",
      "subtitle": "Người gửi: Nguyễn Văn Spam",
      "senderName": "Nguyễn Văn Spam",
      "amount": "100.000.000 đ",
      "progress": 0,
      "originalProgress": 0,
      "isDeleted": false,
      "status": "pending",
      "submissionDate": "14/11/2025 09:05",
    },
    {
      "imagePath": "assets/images/chiendich1.jpg",
      "title": "Cần tiền gấp hỗ trợ mổ tim",
      "subtitle": "Người gửi: Nguyễn Văn Spam",
      "senderName": "Nguyễn Văn Spam",
      "amount": "100.000.000 đ",
      "progress": 0,
      "originalProgress": 0,
      "isDeleted": false,
      "status": "pending",
      "submissionDate": "14/11/2025 09:10",
    },
    {
      "imagePath": "assets/images/chiendich5.jpg",
      "title": "Hỗ trợ xây cầu vượt lũ miền Trung",
      "subtitle": "Người gửi: Trần Văn Spam",
      "senderName": "Trần Văn Spam",
      "amount": "500.000.000 đ",
      "progress": 0,
      "originalProgress": 0,
      "isDeleted": false,
      "status": "pending",
      "submissionDate": "15/11/2025 10:00",
    },
    {
      "imagePath": "assets/images/chiendich5.jpg",
      "title": "Hỗ trợ xây cầu vượt lũ miền Trung",
      "subtitle": "Người gửi: Trần Văn Spam",
      "senderName": "Trần Văn Spam",
      "amount": "500.000.000 đ",
      "progress": 0,
      "originalProgress": 0,
      "isDeleted": false,
      "status": "pending",
      "submissionDate": "15/11/2025 10:05",
    },

    // --- MỚI THÊM: SPAM GROUP 3: PHẠM THỊ SPAM (2 bài) ---
    {
      "imagePath": "assets/images/chiendich6.jpg",
      "title": "Quyên góp sách vở cho vùng cao",
      "subtitle": "Người gửi: Phạm Thị Spam",
      "senderName": "Phạm Thị Spam",
      "amount": "20.000.000 đ",
      "progress": 0,
      "originalProgress": 0,
      "isDeleted": false,
      "status": "pending",
      "submissionDate": "16/11/2025 14:00",
    },
    {
      "imagePath": "assets/images/chiendich6.jpg",
      "title": "Quyên góp sách vở cho vùng cao",
      "subtitle": "Người gửi: Phạm Thị Spam",
      "senderName": "Phạm Thị Spam",
      "amount": "20.000.000 đ",
      "progress": 0,
      "originalProgress": 0,
      "isDeleted": false,
      "status": "pending",
      "submissionDate": "16/11/2025 14:30",
    },

    // END SPAM
    {
      "imagePath": "assets/images/chiendich3.jpg",
      "title": "CON ĐƯỜNG MƠ ƯỚC SỐ 3",
      "subtitle": "1 lượt ủng hộ • Còn lại 38 ngày",
      "amount": "28.934.033 đ",
      "progress": 36,
      "originalProgress": 36,
      "isDeleted": false,
      "status": "available",
    },
    {
      "imagePath": "assets/images/chiendich4.jpg",
      "title": "Cầu Mơ Ước số 8",
      "subtitle": "1 lượt ủng hộ • Còn lại 39 ngày",
      "amount": "6.471.490 đ",
      "progress": 22,
      "originalProgress": 22,
      "isDeleted": false,
      "status": "unavailable",
    },
    {
      "imagePath": "assets/images/chiendich5.jpg",
      "title": "Dự Án Xây Cầu Tại Xã Rạch Chèo; huyện Phú Tân; Tỉnh Cà Mau",
      "subtitle": "1 lượt ủng hộ • Còn lại 2 ngày",
      "amount": "105.471.490 đ",
      "progress": 28,
      "originalProgress": 28,
      "isDeleted": false,
      "status": "available",
    },
    {
      "imagePath": "assets/images/chiendich6.jpg",
      "title": "Quỹ Yêu thương HLC",
      "subtitle": "1 lượt ủng hộ • Còn lại 1013 ngày",
      "amount": "155.551.490 đ",
      "progress": 44,
      "originalProgress": 44,
      "isDeleted": false,
      "status": "available",
    },
    {
      "imagePath": "assets/images/chiendich7.jpg",
      "title": "Dự Án Hiện Thực Hoá Ước Mơ...",
      "subtitle": "1 lượt ủng hộ • Còn lại 7 ngày",
      "amount": "25.000.000 đ",
      "progress": 100,
      "originalProgress": 100,
      "isDeleted": false,
      "status": "available",
    },
    {
      "imagePath": "assets/images/chiendich8.jpg",
      "title": "Lời khẩn cầu của một người mẹ...",
      "subtitle": "1 lượt ủng hộ • Còn lại 6 ngày",
      "amount": "6.471.222 đ",
      "progress": 59,
      "originalProgress": 59,
      "isDeleted": false,
      "status": "available",
    },
    {
      "imagePath": "assets/images/chiendich9.jpg",
      "title": "Dự án cúng dường đại hồng...",
      "subtitle": "1 lượt ủng hộ • Còn lại 29 ngày",
      "amount": "73.397.490 đ",
      "progress": 12,
      "originalProgress": 12,
      "isDeleted": false,
      "status": "available",
    },
    {
      "imagePath": "assets/images/chiendich10.jpg",
      "title": "Dự án kêu gọi quỹ Mixed Nuts",
      "subtitle": "1 lượt ủng hộ • Còn lại 24 ngày",
      "amount": "160.020.490 đ",
      "progress": 39,
      "originalProgress": 39,
      "isDeleted": false,
      "status": "available",
    },
  ];

  @override
  Future<List<AdminPostModel>> getSpamPosts() async {
    List<AdminPostModel> allPending = await getPendingPosts();

    Map<String, List<AdminPostModel>> groupedPosts = {};

    for (var post in allPending) {
      String uniqueKey = "${post.senderName}_${post.title}";
      if (!groupedPosts.containsKey(uniqueKey)) {
        groupedPosts[uniqueKey] = [];
      }
      groupedPosts[uniqueKey]!.add(post);
    }

    List<AdminPostModel> spamResult = [];

    groupedPosts.forEach((key, postsInGroup) {
      if (postsInGroup.length > 1) {
        spamResult.addAll(postsInGroup.sublist(1));
      }
    });

    return spamResult;
  }

  @override
  Future<List<AdminPostModel>> getPendingPosts() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _postsData
        .where((post) => !post['isDeleted'] && post['status'] == 'pending')
        .map((postData) => AdminPostModel.fromMap(postData))
        .toList();
  }

  @override
  Future<void> approvePost(String title) async {
    await Future.delayed(const Duration(milliseconds: 300));

    final index = _postsData.indexWhere(
        (post) => post['title'] == title && post['status'] == 'pending');
    if (index != -1) {
      _postsData[index]['status'] = 'available';
    }
  }

  @override
  Future<void> rejectPost(String title) async {
    await Future.delayed(const Duration(milliseconds: 300));

    final index = _postsData.indexWhere(
        (post) => post['title'] == title && post['status'] == 'pending');

    if (index != -1) {
      _postsData[index]['status'] = 'rejected';
      _postsData[index]['isDeleted'] = true;
    }
  }

  @override
  Future<List<AdminPostModel>> getAllPosts() async {
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
    await Future.delayed(const Duration(milliseconds: 300));
    final index = _postsData.indexWhere((post) => post['title'] == title);
    if (index != -1) {
      _postsData[index]['isDeleted'] = true;
    }
  }

  @override
  Future<void> updatePostStatus(String title, String newStatus) async {
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
