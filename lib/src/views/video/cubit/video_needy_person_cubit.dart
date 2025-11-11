import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tester/src/models/video/video_needy_person_model.dart';
import 'package:tester/src/repositories/video/video_needy_person_repo.dart';
import 'video_needy_person_state.dart';

class VideoNeedyPersonCubit extends Cubit<VideoNeedyPersonState> {
  final VideoNeedyPersonRepository repository;

  VideoNeedyPersonCubit({required this.repository})
      : super(VideoNeedyPersonInitial());

  Future<void> loadVideos() async {
    try {
      emit(VideoNeedyPersonLoading());
      final videos = await repository.getVideos();
      emit(VideoNeedyPersonLoaded(videos: videos));
    } catch (e) {
      emit(VideoNeedyPersonError(message: e.toString()));
    }
  }

  void changeVideoIndex(int index) {
    final currentState = state;
    if (currentState is VideoNeedyPersonLoaded) {
      emit(currentState.copyWith(currentIndex: index));
    }
  }

  Future<void> likeVideo(String videoId) async {
    try {
      final isLiked = await repository.likeVideo(videoId);
      emit(VideoNeedyPersonLiked(videoId: videoId, isLiked: isLiked));

      // Cập nhật lại danh sách videos
      await loadVideos();
    } catch (e) {
      emit(VideoNeedyPersonError(message: e.toString()));
    }
  }

  Future<void> shareVideo(String videoId) async {
    try {
      await repository.shareVideo(videoId);
      emit(VideoNeedyPersonShared(videoId: videoId));

      // Cập nhật lại danh sách videos
      await loadVideos();
    } catch (e) {
      emit(VideoNeedyPersonError(message: e.toString()));
    }
  }

  Future<void> addComment(String videoId, String comment) async {
    try {
      await repository.addComment(videoId, comment);

      // Cập nhật lại danh sách videos
      await loadVideos();
    } catch (e) {
      emit(VideoNeedyPersonError(message: e.toString()));
    }
  }

  Future<void> refreshVideos() async {
    await loadVideos();
  }

  VideoNeedyPersonModel? getCurrentVideo() {
    final currentState = state;
    if (currentState is VideoNeedyPersonLoaded) {
      if (currentState.currentIndex < currentState.videos.length) {
        return currentState.videos[currentState.currentIndex];
      }
    }
    return null;
  }
}
