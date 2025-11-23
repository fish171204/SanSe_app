import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoItemPlayer extends StatefulWidget {
  final String videoUrl;
  const VideoItemPlayer({super.key, required this.videoUrl});

  @override
  State<VideoItemPlayer> createState() => _VideoItemPlayerState();
}

class _VideoItemPlayerState extends State<VideoItemPlayer> {
  VideoPlayerController? _controller;
  bool _isInitialized = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  Future<void> _initializeVideo() async {
    try {
      print("DEBUG: Bắt đầu load video: ${widget.videoUrl}");

      if (widget.videoUrl.startsWith('http')) {
        _controller =
            VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
      } else {
        _controller = VideoPlayerController.asset(widget.videoUrl);
      }

      // Lắng nghe lỗi từ controller (quan trọng)
      _controller!.addListener(() {
        if (_controller!.value.hasError) {
          print(
              "DEBUG: Lỗi Controller: ${_controller!.value.errorDescription}");
          setState(() {
            _errorMessage = _controller!.value.errorDescription;
          });
        }
      });

      await _controller!.initialize();

      setState(() {
        _isInitialized = true;
        _errorMessage = null; // Clear lỗi nếu thành công
      });

      _controller!.setLooping(true);
      _controller!.play();
      print("DEBUG: Load thành công video: ${widget.videoUrl}");
    } catch (e, stackTrace) {
      print("DEBUG: Exception khi load video: $e");
      print("DEBUG: StackTrace: $stackTrace");
      setState(() {
        _errorMessage = "Lỗi load: $e";
      });
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Nếu có lỗi thì hiện lỗi ra màn hình đỏ
    if (_errorMessage != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            _errorMessage!,
            style: const TextStyle(
                color: Colors.red, backgroundColor: Colors.black),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    if (!_isInitialized || _controller == null) {
      return const Center(
        child: CircularProgressIndicator(color: Colors.white),
      );
    }

    return SizedBox.expand(
      child: FittedBox(
        fit: BoxFit.cover,
        child: SizedBox(
          width: _controller!.value.size.width,
          height: _controller!.value.size.height,
          child: VideoPlayer(_controller!),
        ),
      ),
    );
  }
}
