import 'package:equatable/equatable.dart';
import 'package:tester/src/models/video/video_needy_person_model.dart';

abstract class VideoNeedyPersonState extends Equatable {
  const VideoNeedyPersonState();

  @override
  List<Object> get props => [];
}

class VideoNeedyPersonInitial extends VideoNeedyPersonState {}

class VideoNeedyPersonLoading extends VideoNeedyPersonState {}

class VideoNeedyPersonLoaded extends VideoNeedyPersonState {
  final List<VideoNeedyPersonModel> videos;
  final int currentIndex;

  const VideoNeedyPersonLoaded({
    required this.videos,
    this.currentIndex = 0,
  });

  VideoNeedyPersonLoaded copyWith({
    List<VideoNeedyPersonModel>? videos,
    int? currentIndex,
  }) {
    return VideoNeedyPersonLoaded(
      videos: videos ?? this.videos,
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }

  @override
  List<Object> get props => [videos, currentIndex];
}

class VideoNeedyPersonError extends VideoNeedyPersonState {
  final String message;

  const VideoNeedyPersonError({required this.message});

  @override
  List<Object> get props => [message];
}

class VideoNeedyPersonLiked extends VideoNeedyPersonState {
  final String videoId;
  final bool isLiked;

  const VideoNeedyPersonLiked({
    required this.videoId,
    required this.isLiked,
  });

  @override
  List<Object> get props => [videoId, isLiked];
}

class VideoNeedyPersonShared extends VideoNeedyPersonState {
  final String videoId;

  const VideoNeedyPersonShared({required this.videoId});

  @override
  List<Object> get props => [videoId];
}
