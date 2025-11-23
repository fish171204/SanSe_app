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

  static final List<VideoNeedyPersonModel> _mockVideoData = [
    // Video 1: Bệnh tim bẩm sinh
    VideoNeedyPersonModel(
      id: '1',
      name: 'Mẹ con bé An',
      location: 'Bệnh viện E, Hà Nội',
      caption:
          'Bé An 3 tuổi cần mổ tim gấp, mẹ nghèo bất lực nhìn con đau đớn 💔',
      description:
          'Cháu bé bị bệnh quê ở dak nong hoàn cảnh người mẹ rất khó khăn xin các anh chị chia sẻ cho bé ít ỏi.',
      likes: 1,
      comments: 0,
      shares: 0,
      videoUrl: 'assets/videos/video_1.mp4',
      thumbnailUrl: 'assets/videos/image_1.png',
      avatarUrl: 'assets/videos/image_1_1.jpeg',
      targetAmount: 80000000.0,
      currentAmount: 15500000.0,
      createdAt: DateTime.now().subtract(const Duration(days: 2)),
      tags: ['tim_bam_sinh', 'tre_em', 'khan_cap'],
      campaignTitle: 'Trái tim cho em An',
      campaignSubtitle: 'Cần phẫu thuật gấp',
      campaignImageUrl: 'assets/videos/image_1.png',
      progressPercentage: 19.3,
    ),

    // Video 2: Mái ấm cho em
    VideoNeedyPersonModel(
      id: '2',
      name: 'Anh Long',
      location: 'Huyện Giồng Trôm, Bến Tre',
      caption:
          'Những đứa trẻ vùng cao, cuộc sống tuy còn nhiều khó khăn nhưng gương mặt của chúng vẫn bừng sáng những nụ cười. Thật hồn nhiên và ngây thơ biết mấy.',
      description:
          'Tuổi thơ những đứa trẻ vùng cao bị "đánh cắp" bởi nỗi vất vả, nhọc nhằn và hơn nữa, chúng còn bị cuốn theo vòng mưu sinh của gia đình.',
      likes: 1,
      comments: 0,
      shares: 0,
      videoUrl: 'assets/videos/video_2.mp4',
      thumbnailUrl: 'assets/videos/image_2.png',
      avatarUrl: 'assets/videos/image_2_2.jpeg',
      targetAmount: 25000000.0,
      currentAmount: 18000000.0,
      createdAt: DateTime.now().subtract(const Duration(days: 5)),
      tags: ['tre_em', 'khan_cap', 'mien_tay'],
      campaignTitle: 'Trẻ em hôm nay, thế giới ngày mai.',
      campaignSubtitle: 'Mái ấm cho em',
      campaignImageUrl: 'assets/videos/image_2.png',
      progressPercentage: 72.0,
    ),

    // Video 3: Bà cụ nhặt ve chai
    VideoNeedyPersonModel(
      id: '3',
      name: 'Đoàn Đức Hoàng',
      location: 'Gầm cầu Long Biên, Hà Nội',
      caption:
          '70 tuổi vẫn cặm cụi nhặt từng vỏ lon giữa trời đông giá rét để mưu sinh ❄️😔',
      description:
          'Cụ Thơm không con cái, sống tạm bợ trong túp lều dựng tạm. Hàng ngày cụ đi nhặt ve chai từ sáng sớm, thu nhập chỉ vài chục nghìn đủ mua rau cháo. Mùa đông về, cụ vẫn chưa có lấy một chiếc chăn ấm.',
      likes: 1,
      comments: 0,
      shares: 0,
      videoUrl: 'assets/videos/video_3.mp4',
      thumbnailUrl: 'assets/videos/image_3.png',
      avatarUrl: 'assets/videos/image_3_3.jpeg',
      targetAmount: 5000000.0,
      currentAmount: 4200000.0,
      createdAt: DateTime.now().subtract(const Duration(hours: 12)),
      tags: ['nguoi_gia', 've_chai', 'mua_dong', 'kho_khan'],
      campaignTitle: 'Mùa đông ấm cho cụ Thơm',
      campaignSubtitle: 'Hỗ trợ sinh hoạt phí & sửa lều',
      campaignImageUrl: 'assets/videos/image_3.png',
      progressPercentage: 84.0,
    ),

    // Video 8: Bà 70 tuổi bán lặt vặt sơri, dâu tây, mứt dâu tằm
    VideoNeedyPersonModel(
      id: '8',
      name: 'saigonhoale.vn',
      location: 'TP. Thủ Đức, TP.HCM',
      caption:
          'Gánh hàng rong tuổi 70: Bà cụ bán từng bịch sơ ri, dâu tằm mưu sinh qua ngày giữa Sài Gòn 🍒🍓',
      description:
          'Bà Tư năm nay đã ngoài 70, ngày ngày ngồi góc đường bán từng bịch sơ ri, dâu tây, hũ mứt dâu tằm tự làm. Lời lãi chẳng bao nhiêu nhưng là nguồn sống duy nhất để bà trang trải tiền nhà trọ và thuốc thang tuổi già. Mong mọi người ghé ủng hộ bà.',
      likes: 1,
      comments: 0,
      shares: 0,
      videoUrl: 'assets/videos/video_8.mp4',
      thumbnailUrl: 'assets/videos/image_8.png',
      avatarUrl: 'assets/videos/image_8_8.jpeg',
      targetAmount: 20000000.0,
      currentAmount: 2000000.0,
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
      tags: ['nguoi_gia', 'muu_sinh', 'buon_ban', 'hoan_canh_kho_khan'],
      campaignTitle: 'Gánh hàng rong của Ngoại',
      campaignSubtitle: 'Hỗ trợ vốn nhập hàng & thuốc men',
      campaignImageUrl: 'assets/videos/image_8.png',
      progressPercentage: 10.0,
    ),

    // Video 5: Bà cụ lớn tuổi đi lụm ve chai, thông điệp về chữ Hiếu
    VideoNeedyPersonModel(
      id: '5',
      name: 'Huỳnh Đăng Thông',
      location: 'Quận Bình Tân, TP.HCM',
      caption:
          'Bà đã lớn tuổi đi lụm ve chai sống qua ngày xin anh chị giúp đỡ cho bà. Những ai còn mẹ xin hãy báo hiếu. A Di Đà Phật 🙏',
      description:
          'Nhìn dáng bà cụ lưng còng, tay run rẩy nhặt từng vỏ chai nhựa mà xót xa. Ở cái tuổi lẽ ra được an hưởng tuổi già thì bà vẫn phải lang thang mưu sinh từng bữa. Bà không có con cái nương tựa, mong mọi người chung tay giúp đỡ để bà có bữa cơm no.',
      likes: 1,
      comments: 0,
      shares: 0,
      videoUrl: 'assets/videos/video_5.mp4',
      thumbnailUrl: 'assets/videos/image_5.png',
      avatarUrl: 'assets/videos/image_5_5.jpeg',
      targetAmount: 30000000.0,
      currentAmount: 8500000.0,
      createdAt: DateTime.now().subtract(const Duration(days: 3)),
      tags: ['nguoi_gia', 've_chai', 'bao_hieu', 'phat_giao'],
      campaignTitle: 'Giúp bà cụ nhặt ve chai',
      campaignSubtitle: 'Hỗ trợ sinh hoạt phí tuổi già',
      campaignImageUrl: 'assets/videos/image_5.png',
      progressPercentage: 75.0,
    ),

    // Video 4: Cụ bà 90 tuổi nhặt ve chai
    VideoNeedyPersonModel(
      id: '4',
      name: 'Anh Nguyễn Vĩ Nhân',
      location: 'TP. Thủ Đức, TP.HCM',
      caption:
          'Hơn 90 tuổi rồi vẫn lặn lội đi nhặt phế liệu ở thùng rác để nuôi người con hơn 60t bị bại liệt 😔🥡',
      description:
          'Cụ Lành đã ở cái tuổi "gần đất xa trời" nhưng chưa một ngày được ngơi nghỉ. Con trai duy nhất của cụ bị bại liệt nằm một chỗ hơn 40 năm nay. Dù lưng còng, mắt kém, cụ vẫn cố gắng bới từng thùng rác để kiếm tiền mua thuốc và cháo cho con.',
      likes: 1,
      comments: 0,
      shares: 0,
      videoUrl: 'assets/videos/video_4.mp4',
      thumbnailUrl: 'assets/videos/image_4.png',
      avatarUrl: 'assets/videos/image_4_4.jpeg',
      targetAmount: 20000000.0,
      currentAmount: 12000000.0,
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
      tags: ['nguoi_gia', 'bai_liet', 've_chai', 'hoan_canh_dac_biet'],
      campaignTitle: 'Gánh nặng tuổi xế chiều',
      campaignSubtitle: 'Giúp cụ Lành nuôi con bại liệt',
      campaignImageUrl: 'assets/videos/image_4.png',
      progressPercentage: 60.0,
    ),

    // Video 6: Ông cụ 90 tuổi bán vé số nuôi vợ bệnh
    VideoNeedyPersonModel(
      id: '6',
      name: 'Từ Bi Hỷ Xả 1988',
      location: 'Châu Thành, Tiền Giang',
      caption:
          'Ông cụ 75 tuổi lưng còng sát đất vẫn đi bán từng tờ vé số nuôi vợ nằm một chỗ. Thương ông quá cả nhà ơi 😭🙏 A Di Đà Phật.',
      description:
          'Ở cái tuổi xưa nay hiếm, ông cụ vẫn phải gồng gánh mưu sinh. Vợ ông bị tai biến nằm liệt giường 5 năm nay, mọi sinh hoạt thuốc thang đều trông chờ vào xấp vé số của ông. Ông chỉ ước bán đắt hàng để về sớm lo cơm nước cho bà. Mong các mạnh thường quân hỗ trợ ông bà chút kinh phí dưỡng già.',
      likes: 1,
      comments: 0,
      shares: 0,
      videoUrl: 'assets/videos/video_6.mp4',
      thumbnailUrl: 'assets/videos/image_6.png',
      avatarUrl: 'assets/videos/image_6_6.jpeg',
      targetAmount: 40000000.0,
      currentAmount: 12500000.0,
      createdAt: DateTime.now().subtract(const Duration(days: 10)),
      tags: ['nguoi_gia', 'ban_ve_so', 'neo_don', 'a_di_da_phat'],
      campaignTitle: 'Tình già nghĩa nặng',
      campaignSubtitle: 'Giúp ông cụ bán vé số',
      campaignImageUrl: 'assets/videos/image_6.png',
      progressPercentage: 31.2,
    ),

    // Video 7: Cụ bà 85 tuổi bán vé số mưu sinh
    VideoNeedyPersonModel(
      id: '7',
      name: 'saigonhoale.vn',
      location: 'Quận 1, TP.HCM',
      caption:
          'Thương ngoại 85 tuổi, mắt mờ chân chậm vẫn lặn lội bán từng bó rau để mưu sinh giữa Sài Gòn hoa lệ 🥺❤️',
      description:
          'Ngoại tâm sự con cái đều đi làm ăn xa, ngoại không muốn làm gánh nặng nên ngày nào cũng đi bán từ sáng sớm đến tối mịt. Hôm nay tụi con bao hết xấp vé số cho ngoại về sớm nghỉ ngơi. Mong ngoại luôn khỏe mạnh.',
      likes: 1,
      comments: 0,
      shares: 0,
      videoUrl: 'assets/videos/video_7.mp4',
      thumbnailUrl: 'assets/videos/image_7.png',
      avatarUrl: 'assets/videos/image_7_7.jpeg',
      targetAmount: 20000000.0,
      currentAmount: 4000000.0,
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
      tags: ['nguoi_gia', 'ban_ve_so', 'sai_gon', 'tinh_nguoi'],
      campaignTitle: 'Tiếp sức mưu sinh',
      campaignSubtitle: 'Hỗ trợ người già',
      campaignImageUrl: 'assets/videos/image_7.png',
      progressPercentage: 20.0,
    ),
  ];
}
