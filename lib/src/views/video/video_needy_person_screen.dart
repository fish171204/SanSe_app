import 'package:flutter/material.dart';

class VideoNeedyReelsScreen extends StatefulWidget {
  const VideoNeedyReelsScreen({super.key});

  @override
  State<VideoNeedyReelsScreen> createState() => _VideoNeedyReelsScreenState();
}

class _VideoNeedyReelsScreenState extends State<VideoNeedyReelsScreen> {
  final PageController _pageController = PageController();
  final List<_ReelItem> _items = const [
    _ReelItem(
      name: "Chị Hoa (Q.8)",
      caption: "Cần hỗ trợ học phí cho 2 bé trong năm học mới.",
      likes: 1240,
      comments: 57,
      shares: 12,
      // demo: dùng ảnh nền màu + icon play; sau này thay bằng video player
      color: Colors.black87,
    ),
    _ReelItem(
      name: "Bác Tư (Gò Vấp)",
      caption: "Phẫu thuật mắt – mong nhận được sự giúp đỡ.",
      likes: 980,
      comments: 33,
      shares: 9,
      color: Colors.black,
    ),
    _ReelItem(
      name: "Em Minh (Cần Giờ)",
      caption: "Ước mơ có chiếc xe đạp đến trường.",
      likes: 1560,
      comments: 61,
      shares: 18,
      color: Colors.black54,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        itemCount: _items.length,
        itemBuilder: (context, index) {
          final item = _items[index];
          return _ReelCard(item: item);
        },
      ),
    );
  }
}

class _ReelItem {
  final String name;
  final String caption;
  final int likes;
  final int comments;
  final int shares;
  final Color color;

  const _ReelItem({
    required this.name,
    required this.caption,
    required this.likes,
    required this.comments,
    required this.shares,
    required this.color,
  });
}

class _ReelCard extends StatelessWidget {
  const _ReelCard({required this.item});
  final _ReelItem item;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Nền (tạm thời màu + icon play)
        Container(
          color: item.color,
          alignment: Alignment.center,
          child: const Icon(Icons.play_circle_fill,
              size: 96, color: Colors.white70),
        ),

        // Gradient đen ở dưới để đọc text dễ hơn
        const Positioned.fill(
          child: IgnorePointer(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                  colors: [Colors.black54, Colors.transparent],
                ),
              ),
            ),
          ),
        ),

        // Cột actions bên phải
        Positioned(
          right: 12,
          bottom: 80,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _ActionButton(icon: Icons.favorite, label: "${item.likes}"),
              const SizedBox(height: 14),
              _ActionButton(
                  icon: Icons.mode_comment_outlined, label: "${item.comments}"),
              const SizedBox(height: 14),
              _ActionButton(icon: Icons.share, label: "${item.shares}"),
            ],
          ),
        ),

        // Thông tin người cần giúp + caption ở dưới
        Positioned(
          left: 12,
          right: 80,
          bottom: 24,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Avatar + tên
              Row(
                children: [
                  const CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.white24,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      item.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // TODO: chuyển tới trang chi tiết / quyên góp
                    },
                    child: const Text("Ủng hộ",
                        style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                item.caption,
                style: const TextStyle(color: Colors.white, fontSize: 14),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({required this.icon, required this.label});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DecoratedBox(
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: Colors.white12),
          child: IconButton(
            onPressed: () {},
            icon: Icon(icon, color: Colors.white),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 12),
        ),
      ],
    );
  }
}
