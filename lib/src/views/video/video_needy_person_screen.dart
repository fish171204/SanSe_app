import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:tester/src/models/video/video_needy_person_model.dart';
import 'package:tester/src/repositories/video/video_needy_person_repo.dart';
import 'package:tester/src/views/ayns/post_video_test_id1.dart';
import 'package:tester/src/views/ayns/post_video_test_id2.dart';
import 'package:tester/src/views/ayns/post_video_test_id3.dart';
import 'package:tester/src/views/ayns/post_video_test_id4.dart';
import 'package:tester/src/views/ayns/post_video_test_id5.dart';
import 'package:tester/src/views/ayns/post_video_test_id6.dart';
import 'package:tester/src/views/ayns/post_video_test_id7.dart';
import 'package:tester/src/views/ayns/post_video_test_id8.dart';
import 'package:tester/src/views/video/cubit/video_needy_person_cubit.dart';
import 'package:tester/src/views/video/cubit/video_needy_person_state.dart';
import 'package:tester/src/views/video/video_item_player_widget.dart';

class VideoNeedyReelsScreen extends StatefulWidget {
  const VideoNeedyReelsScreen({super.key});

  @override
  State<VideoNeedyReelsScreen> createState() => _VideoNeedyReelsScreenState();
}

class _VideoNeedyReelsScreenState extends State<VideoNeedyReelsScreen> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => VideoNeedyPersonCubit(
        repository: VideoNeedyPersonRepositoryImpl(),
      )..loadVideos(),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            BlocBuilder<VideoNeedyPersonCubit, VideoNeedyPersonState>(
              builder: (context, state) {
                if (state is VideoNeedyPersonLoading) {
                  return const Center(
                    child: CircularProgressIndicator(color: Colors.white),
                  );
                }
                if (state is VideoNeedyPersonError) {
                  return Center(
                    child: Text(
                      'Lỗi: ${state.message}',
                      style: const TextStyle(color: Colors.white),
                    ),
                  );
                }
                if (state is VideoNeedyPersonLoaded) {
                  return PageView.builder(
                    controller: _pageController,
                    scrollDirection: Axis.vertical,
                    itemCount: state.videos.length,
                    onPageChanged: (i) => context
                        .read<VideoNeedyPersonCubit>()
                        .changeVideoIndex(i),
                    itemBuilder: (_, i) => _ReelCard(video: state.videos[i]),
                  );
                }
                return const SizedBox.shrink();
              },
            ),

            // Back button
            Positioned(
              top: MediaQuery.of(context).padding.top + 16,
              left: 16,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ReelCard extends StatelessWidget {
  const _ReelCard({required this.video});
  final VideoNeedyPersonModel video;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // LỚP 1: VIDEO PLAYER (Thay thế nền màu đen cũ)
        Positioned.fill(
          child: VideoItemPlayer(videoUrl: video.videoUrl),
        ),

        // LỚP 2: Gradient đen mờ ở dưới để chữ dễ đọc
        const Positioned.fill(
          child: IgnorePointer(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                  colors: [Colors.black87, Colors.transparent],
                  stops: [0.0, 0.6], // Chỉnh lại gradient cho đẹp hơn
                ),
              ),
            ),
          ),
        ),

        // actions bên phải
        Positioned(
          right: 12,
          bottom: 84,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _ActionButton(
                icon: Icons.favorite,
                label: '${video.likes}',
                onPressed: () =>
                    context.read<VideoNeedyPersonCubit>().likeVideo(video.id),
              ),
              const SizedBox(height: 14),
              _ActionButton(
                icon: Icons.mode_comment_outlined,
                label: '${video.comments}',
                onPressed: () {
                  // TODO: mở bình luận
                },
              ),
              const SizedBox(height: 14),
              _ActionButton(
                icon: Icons.share,
                label: '${video.shares}',
                onPressed: () =>
                    context.read<VideoNeedyPersonCubit>().shareVideo(video.id),
              ),
            ],
          ),
        ),

        // thông tin dưới
        Positioned(
          left: 12,
          right: 80,
          bottom: 24,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ===== MINI CAMPAIGN CARD (tap để đi tới bài viết) =====
              _CampaignMiniCard(
                imagePath: video.campaignImageUrl,
                title: video.campaignTitle,
                subtitle: video.campaignSubtitle,
                amount: _formatVnCurrency(video.currentAmount),
                progress: video.progressPercentage,

                // --- LOGIC ĐIỀU HƯỚNG Ở ĐÂY ---
                onTap: () {
                  switch (video.id) {
                    case '1':
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PostVideoTestPageId1()),
                      );
                      break;
                    case '2':
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PostVideoTestPageId2()),
                      );
                      break;
                    case '3':
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PostVideoTestPageId3()),
                      );
                      break;
                    case '4':
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PostVideoTestPageId4()),
                      );
                      break;
                    case '5':
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PostVideoTestPageId5()),
                      );
                      break;
                    case '6':
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PostVideoTestPageId6()),
                      );
                      break;
                    case '7':
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PostVideoTestPageId7()),
                      );
                      break;
                    case '8':
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PostVideoTestPageId8()),
                      );
                      break;
                    default:
                      print("Chưa có trang chi tiết cho video id: ${video.id}");
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text(
                                "Chưa có bài viết chi tiết cho ID: ${video.id}")),
                      );
                      break;
                  }
                },
              ),
              const SizedBox(height: 10),

              // Avatar + tên người đăng
              Row(
                children: [
                  _Avatar(url: video.avatarUrl),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      '${video.name} (${video.location})',
                      style: const TextStyle(
                        color: Colors.white, fontSize: 16,
                        fontWeight: FontWeight.w700,
                        shadows: [
                          Shadow(color: Colors.black, blurRadius: 2)
                        ], // Thêm bóng chữ
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Ủng hộ',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),

              // caption
              Text(
                video.caption,
                style: const TextStyle(color: Colors.white, fontSize: 14),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),

              // tiến độ tổng quan
              Text(
                'Đã quyên góp: ${_formatVnCurrency(video.currentAmount)} / ${_formatVnCurrency(video.targetAmount)}',
                style: const TextStyle(color: Colors.white70, fontSize: 12),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// MINI CARD (giống layout bạn gửi)
class _CampaignMiniCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final String amount;
  final double progress;
  final VoidCallback? onTap;

  const _CampaignMiniCard({
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.progress,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final card = Card(
      margin: const EdgeInsets.only(right: 24), // tránh đè vào cột action
      color: Colors.white.withOpacity(0.95),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: _imageAuto(imagePath),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 4),
                  Text(subtitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.grey[700])),
                  const SizedBox(height: 6),
                  Text(amount,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      )),
                  const SizedBox(height: 6),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: (progress.clamp(0, 100)) / 100,
                      backgroundColor: Colors.grey[300],
                      color: Colors.orange,
                      minHeight: 6,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    if (onTap == null) return card;
    return InkWell(
        onTap: onTap, borderRadius: BorderRadius.circular(12), child: card);
  }

  Widget _imageAuto(String path) {
    final isNet = path.startsWith('http');
    final img = isNet
        ? Image.network(path, width: 80, height: 80, fit: BoxFit.cover)
        : Image.asset(path, width: 80, height: 80, fit: BoxFit.cover);
    return SizedBox(width: 80, height: 80, child: img);
  }
}

class _Avatar extends StatelessWidget {
  const _Avatar({required this.url});
  final String url;

  @override
  Widget build(BuildContext context) {
    final isNet = url.startsWith('http');
    return CircleAvatar(
      radius: 18,
      backgroundColor: Colors.white24,
      backgroundImage:
          isNet ? NetworkImage(url) : AssetImage(url) as ImageProvider,
      onBackgroundImageError: (_, __) {},
      child:
          (url.isEmpty) ? const Icon(Icons.person, color: Colors.white) : null,
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton(
      {required this.icon, required this.label, this.onPressed});

  final IconData icon;
  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DecoratedBox(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white12,
          ),
          child: IconButton(
            onPressed: onPressed,
            icon: Icon(icon, color: Colors.white),
          ),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
      ],
    );
  }
}

String _formatVnCurrency(double amount) {
  try {
    final f =
        NumberFormat.currency(locale: 'vi_VN', symbol: 'đ', decimalDigits: 0);
    return f.format(amount);
  } catch (_) {
    return '${amount.toStringAsFixed(0)} đ';
  }
}
