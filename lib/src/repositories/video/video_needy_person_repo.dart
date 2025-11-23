import 'package:tester/src/models/video/video_needy_person_model.dart';

abstract class VideoNeedyPersonRepository {
  Future<List<VideoNeedyPersonModel>> getVideos();
  Future<bool> likeVideo(String videoId);
  Future<void> shareVideo(String videoId);
  Future<void> addComment(String videoId, String comment);
}

class VideoNeedyPersonRepositoryImpl implements VideoNeedyPersonRepository {
  @override
  Future<List<VideoNeedyPersonModel>> getVideos() async {
    // Simulate API delay
    await Future.delayed(const Duration(milliseconds: 500));

    return _mockVideoData;
  }

  @override
  Future<bool> likeVideo(String videoId) async {
    // Simulate API delay
    await Future.delayed(const Duration(milliseconds: 300));

    // Find video and update likes
    final videoIndex =
        _mockVideoData.indexWhere((video) => video.id == videoId);
    if (videoIndex != -1) {
      final video = _mockVideoData[videoIndex];
      _mockVideoData[videoIndex] = video.copyWith(likes: video.likes + 1);
      return true;
    }
    return false;
  }

  @override
  Future<void> shareVideo(String videoId) async {
    // Simulate API delay
    await Future.delayed(const Duration(milliseconds: 300));

    // Find video and update shares
    final videoIndex =
        _mockVideoData.indexWhere((video) => video.id == videoId);
    if (videoIndex != -1) {
      final video = _mockVideoData[videoIndex];
      _mockVideoData[videoIndex] = video.copyWith(shares: video.shares + 1);
    }
  }

  @override
  Future<void> addComment(String videoId, String comment) async {
    // Simulate API delay
    await Future.delayed(const Duration(milliseconds: 300));

    // Find video and update comments
    final videoIndex =
        _mockVideoData.indexWhere((video) => video.id == videoId);
    if (videoIndex != -1) {
      final video = _mockVideoData[videoIndex];
      _mockVideoData[videoIndex] = video.copyWith(comments: video.comments + 1);
    }
  }

static final List<VideoNeedyPersonModel> _mockVideoData = List.generate(7, (index) {
    final id = index + 1;
    return VideoNeedyPersonModel(
      id: '$id',
      name: 'Người dùng $id',
      location: 'TP. Hồ Chí Minh',
      caption: 'Video demo số $id - Nội dung mẫu test giao diện Reels.',
      description: 'Mô tả chi tiết cho hoàn cảnh số $id...',
      likes: 100 * id,
      comments: 10 * id,
      shares: 5 * id,
      // QUAN TRỌNG: Trỏ đúng vào đường dẫn assets
      videoUrl: 'assets/videos/video_$id.mp4', 
      thumbnailUrl: '', // Tạm thời chưa cần
      avatarUrl: '',    // Sẽ hiện icon mặc định
      targetAmount: 10000000.0 * id,
      currentAmount: 2000000.0 * id,
      createdAt: DateTime.now(),
      tags: ['demo', 'test', 'video_$id'],
      campaignTitle: 'Chiến dịch mẫu $id',
      campaignSubtitle: 'Đang gây quỹ',
      campaignImageUrl: '', // Sẽ hiện ảnh placeholder
      progressPercentage: (10 * id) % 100,
    );
  });
}

  // Mock data - 20 video items with campaign cards
//   static final List<VideoNeedyPersonModel> _mockVideoData = [
//     VideoNeedyPersonModel(
//       id: '1',
//       name: 'Chị Hoa',
//       location: 'Quận 8, TP.HCM',
//       caption: 'Cần hỗ trợ học phí cho 2 bé trong năm học mới',
//       description:
//           'Chị Hoa là lao động tự do, có 2 con nhỏ đang tuổi đi học. Do ảnh hưởng của dịch bệnh, thu nhập không ổn định nên gặp khó khăn trong việc đóng học phí.',
//       likes: 1240,
//       comments: 57,
//       shares: 12,
//       videoUrl: 'https://example.com/video1.mp4',
//       thumbnailUrl: 'assets/images/nguoikhokhan1.jpg',
//       avatarUrl: 'assets/images/user1.png',
//       targetAmount: 5000000,
//       currentAmount: 2300000,
//       createdAt: DateTime.now().subtract(const Duration(hours: 2)),
//       tags: ['học phí', 'trẻ em', 'giáo dục'],
//       campaignTitle: 'Học phí cho 2 bé',
//       campaignSubtitle: 'Gia đình khó khăn cần hỗ trợ',
//       campaignImageUrl: 'assets/images/chiendich1.jpg',
//       progressPercentage: 46,
//     ),
//     VideoNeedyPersonModel(
//       id: '2',
//       name: 'Bác Tư',
//       location: 'Gò Vấp, TP.HCM',
//       caption: 'Phẫu thuật mắt – mong nhận được sự giúp đỡ',
//       description:
//           'Bác Tư 67 tuổi, bị đục thủy tinh thể cần phẫu thuật gấp. Gia đình hoàn cảnh khó khăn, không đủ tiền chi phí y tế.',
//       likes: 980,
//       comments: 33,
//       shares: 9,
//       videoUrl: 'https://example.com/video2.mp4',
//       thumbnailUrl: 'assets/images/thumb2.jpg',
//       avatarUrl: 'assets/images/avatar2.jpg',
//       targetAmount: 15000000,
//       currentAmount: 8500000,
//       createdAt: DateTime.now().subtract(const Duration(hours: 5)),
//       tags: ['y tế', 'người già', 'phẫu thuật'],
//       campaignTitle: 'Phẫu thuật mắt cấp thiết',
//       campaignSubtitle: 'Bác Tư cần được phẫu thuật gấp',
//       campaignImageUrl: 'assets/images/campaign2.jpg',
//       progressPercentage: 57,
//     ),
//     VideoNeedyPersonModel(
//       id: '3',
//       name: 'Em Minh',
//       location: 'Cần Giờ, TP.HCM',
//       caption: 'Ước mơ có chiếc xe đạp đến trường',
//       description:
//           'Em Minh học lớp 6, mỗi ngày phải đi bộ 5km đến trường. Em ước có chiếc xe đạp để việc đi học được thuận tiện hơn.',
//       likes: 1560,
//       comments: 61,
//       shares: 18,
//       videoUrl: 'https://example.com/video3.mp4',
//       thumbnailUrl: 'assets/images/thumb3.jpg',
//       avatarUrl: 'assets/images/avatar3.jpg',
//       targetAmount: 2000000,
//       currentAmount: 1200000,
//       createdAt: DateTime.now().subtract(const Duration(hours: 8)),
//       tags: ['học sinh', 'xe đạp', 'giáo dục'],
//       campaignTitle: 'Xe đạp đến trường',
//       campaignSubtitle: 'Giúp em Minh có phương tiện đi học',
//       campaignImageUrl: 'assets/images/campaign3.jpg',
//       progressPercentage: 60,
//     ),
//     VideoNeedyPersonModel(
//       id: '4',
//       name: 'Cô Lan',
//       location: 'Bình Thạnh, TP.HCM',
//       caption: 'Hỗ trợ chi phí điều trị ung thư',
//       description:
//           'Cô Lan 45 tuổi, vừa phát hiện ung thư vú giai đoạn 2. Cần hỗ trợ chi phí hóa trị và thuốc men.',
//       likes: 2100,
//       comments: 89,
//       shares: 45,
//       videoUrl: 'https://example.com/video4.mp4',
//       thumbnailUrl: 'assets/images/thumb4.jpg',
//       avatarUrl: 'assets/images/avatar4.jpg',
//       targetAmount: 50000000,
//       currentAmount: 18000000,
//       createdAt: DateTime.now().subtract(const Duration(hours: 12)),
//       tags: ['y tế', 'ung thư', 'điều trị'],
//       campaignTitle: 'Chống chọi ung thư',
//       campaignSubtitle: 'Cô Lan cần hỗ trợ điều trị',
//       campaignImageUrl: 'assets/images/campaign4.jpg',
//       progressPercentage: 36,
//     ),
//     VideoNeedyPersonModel(
//       id: '5',
//       name: 'Ông Hai',
//       location: 'Tân Bình, TP.HCM',
//       caption: 'Sửa chữa nhà sau bão lũ',
//       description:
//           'Nhà ông Hai bị hư hỏng nặng sau trận bão. Mái nhà bị tốc, tường nứt. Cần hỗ trợ sửa chữa để có nơi ở.',
//       likes: 756,
//       comments: 34,
//       shares: 22,
//       videoUrl: 'https://example.com/video5.mp4',
//       thumbnailUrl: 'assets/images/thumb5.jpg',
//       avatarUrl: 'assets/images/avatar5.jpg',
//       targetAmount: 20000000,
//       currentAmount: 5600000,
//       createdAt: DateTime.now().subtract(const Duration(days: 1)),
//       tags: ['nhà ở', 'thiên tai', 'sửa chữa'],
//       campaignTitle: 'Sửa chữa nhà sau bão',
//       campaignSubtitle: 'Giúp ông Hai có nơi ở ấm cúng',
//       campaignImageUrl: 'assets/images/campaign5.jpg',
//       progressPercentage: 28,
//     ),
//     VideoNeedyPersonModel(
//       id: '6',
//       name: 'Em Thủy',
//       location: 'Quận 1, TP.HCM',
//       caption: 'Mắc bệnh tim bẩm sinh cần phẫu thuật',
//       description:
//           'Em Thủy 8 tuổi, mắc bệnh tim bẩm sinh. Cần phẫu thuật càng sớm càng tốt để cứu sống em.',
//       likes: 3200,
//       comments: 156,
//       shares: 89,
//       videoUrl: 'https://example.com/video6.mp4',
//       thumbnailUrl: 'assets/images/thumb6.jpg',
//       avatarUrl: 'assets/images/avatar6.jpg',
//       targetAmount: 100000000,
//       currentAmount: 45000000,
//       createdAt: DateTime.now().subtract(const Duration(days: 1, hours: 3)),
//       tags: ['y tế', 'trẻ em', 'tim mạch'],
//       campaignTitle: 'Cứu trái tim em Thủy',
//       campaignSubtitle: 'Phẫu thuật tim gấp cho em',
//       campaignImageUrl: 'assets/images/campaign6.jpg',
//       progressPercentage: 45,
//     ),
//     VideoNeedyPersonModel(
//       id: '7',
//       name: 'Anh Dũng',
//       location: 'Quận 7, TP.HCM',
//       caption: 'Tai nạn giao thông, cần hỗ trợ điều trị',
//       description:
//           'Anh Dũng bị tai nạn giao thông, gãy chân nghiêm trọng. Đang điều trị tại bệnh viện, cần hỗ trợ chi phí.',
//       likes: 1890,
//       comments: 67,
//       shares: 31,
//       videoUrl: 'https://example.com/video7.mp4',
//       thumbnailUrl: 'assets/images/thumb7.jpg',
//       avatarUrl: 'assets/images/avatar7.jpg',
//       targetAmount: 25000000,
//       currentAmount: 12000000,
//       createdAt: DateTime.now().subtract(const Duration(days: 1, hours: 8)),
//       tags: ['y tế', 'tai nạn', 'điều trị'],
//       campaignTitle: 'Phục hồi sau tai nạn',
//       campaignSubtitle: 'Anh Dũng cần chi phí điều trị',
//       campaignImageUrl: 'assets/images/campaign7.jpg',
//       progressPercentage: 48,
//     ),
//     VideoNeedyPersonModel(
//       id: '8',
//       name: 'Bà Năm',
//       location: 'Thủ Đức, TP.HCM',
//       caption: 'Cần hỗ trợ mua máy thở',
//       description:
//           'Bà Năm 78 tuổi, bị suy hô hấp mãn tính. Cần máy thở tại nhà để hỗ trợ thở ban đêm.',
//       likes: 1456,
//       comments: 78,
//       shares: 43,
//       videoUrl: 'https://example.com/video8.mp4',
//       thumbnailUrl: 'assets/images/thumb8.jpg',
//       avatarUrl: 'assets/images/avatar8.jpg',
//       targetAmount: 30000000,
//       currentAmount: 15000000,
//       createdAt: DateTime.now().subtract(const Duration(days: 2)),
//       tags: ['y tế', 'người già', 'hô hấp'],
//       campaignTitle: 'Máy thở cho bà Năm',
//       campaignSubtitle: 'Hỗ trợ hô hấp cho người già',
//       campaignImageUrl: 'assets/images/campaign8.jpg',
//       progressPercentage: 50,
//     ),
//     VideoNeedyPersonModel(
//       id: '9',
//       name: 'Em Hoàng',
//       location: 'Bình Tân, TP.HCM',
//       caption: 'Khuyết tật tay chân, cần xe lăn',
//       description:
//           'Em Hoàng 12 tuổi, khuyết tật bẩm sinh. Cần một chiếc xe lăn để di chuyển và đến trường học.',
//       likes: 2300,
//       comments: 98,
//       shares: 56,
//       videoUrl: 'https://example.com/video9.mp4',
//       thumbnailUrl: 'assets/images/thumb9.jpg',
//       avatarUrl: 'assets/images/avatar9.jpg',
//       targetAmount: 8000000,
//       currentAmount: 4200000,
//       createdAt: DateTime.now().subtract(const Duration(days: 2, hours: 5)),
//       tags: ['khuyết tật', 'trẻ em', 'xe lăn'],
//       campaignTitle: 'Xe lăn cho em Hoàng',
//       campaignSubtitle: 'Giúp em có phương tiện di chuyển',
//       campaignImageUrl: 'assets/images/campaign9.jpg',
//       progressPercentage: 53,
//     ),
//     VideoNeedyPersonModel(
//       id: '10',
//       name: 'Chú Bảy',
//       location: 'Quận 12, TP.HCM',
//       caption: 'Hỗ trợ vốn buôn bán nhỏ',
//       description:
//           'Chú Bảy bán trái cây ven đường, bị mất vốn do kẻ cắp. Cần hỗ trợ vốn để có thể tiếp tục mưu sinh.',
//       likes: 890,
//       comments: 45,
//       shares: 19,
//       videoUrl: 'https://example.com/video10.mp4',
//       thumbnailUrl: 'assets/images/thumb10.jpg',
//       avatarUrl: 'assets/images/avatar10.jpg',
//       targetAmount: 3000000,
//       currentAmount: 1800000,
//       createdAt: DateTime.now().subtract(const Duration(days: 3)),
//       tags: ['vốn', 'buôn bán', 'mưu sinh'],
//       campaignTitle: 'Vốn buôn bán trái cây',
//       campaignSubtitle: 'Giúp chú Bảy phục hồi việc làm',
//       campaignImageUrl: 'assets/images/campaign10.jpg',
//       progressPercentage: 60,
//     ),
//   ];
// }
