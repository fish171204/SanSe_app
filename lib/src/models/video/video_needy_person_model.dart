class VideoNeedyPersonModel {
  final String id;
  final String name;
  final String location;
  final String caption;
  final String description;
  final int likes;
  final int comments;
  final int shares;
  final String videoUrl;
  final String thumbnailUrl;
  final String avatarUrl;
  final double targetAmount;
  final double currentAmount;
  final DateTime createdAt;
  final List<String> tags;

  // Campaign card fields
  final String campaignTitle;
  final String campaignSubtitle;
  final String campaignImageUrl;
  final int progressPercentage;

  const VideoNeedyPersonModel({
    required this.id,
    required this.name,
    required this.location,
    required this.caption,
    required this.description,
    required this.likes,
    required this.comments,
    required this.shares,
    required this.videoUrl,
    required this.thumbnailUrl,
    required this.avatarUrl,
    required this.targetAmount,
    required this.currentAmount,
    required this.createdAt,
    required this.tags,
    required this.campaignTitle,
    required this.campaignSubtitle,
    required this.campaignImageUrl,
    required this.progressPercentage,
  });

  VideoNeedyPersonModel copyWith({
    String? id,
    String? name,
    String? location,
    String? caption,
    String? description,
    int? likes,
    int? comments,
    int? shares,
    String? videoUrl,
    String? thumbnailUrl,
    String? avatarUrl,
    double? targetAmount,
    double? currentAmount,
    DateTime? createdAt,
    List<String>? tags,
    String? campaignTitle,
    String? campaignSubtitle,
    String? campaignImageUrl,
    int? progressPercentage,
  }) {
    return VideoNeedyPersonModel(
      id: id ?? this.id,
      name: name ?? this.name,
      location: location ?? this.location,
      caption: caption ?? this.caption,
      description: description ?? this.description,
      likes: likes ?? this.likes,
      comments: comments ?? this.comments,
      shares: shares ?? this.shares,
      videoUrl: videoUrl ?? this.videoUrl,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      targetAmount: targetAmount ?? this.targetAmount,
      currentAmount: currentAmount ?? this.currentAmount,
      createdAt: createdAt ?? this.createdAt,
      tags: tags ?? this.tags,
      campaignTitle: campaignTitle ?? this.campaignTitle,
      campaignSubtitle: campaignSubtitle ?? this.campaignSubtitle,
      campaignImageUrl: campaignImageUrl ?? this.campaignImageUrl,
      progressPercentage: progressPercentage ?? this.progressPercentage,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'location': location,
      'caption': caption,
      'description': description,
      'likes': likes,
      'comments': comments,
      'shares': shares,
      'videoUrl': videoUrl,
      'thumbnailUrl': thumbnailUrl,
      'avatarUrl': avatarUrl,
      'targetAmount': targetAmount,
      'currentAmount': currentAmount,
      'createdAt': createdAt.toIso8601String(),
      'tags': tags,
      'campaignTitle': campaignTitle,
      'campaignSubtitle': campaignSubtitle,
      'campaignImageUrl': campaignImageUrl,
      'progressPercentage': progressPercentage,
    };
  }

  factory VideoNeedyPersonModel.fromJson(Map<String, dynamic> json) {
    return VideoNeedyPersonModel(
      id: json['id'] as String,
      name: json['name'] as String,
      location: json['location'] as String,
      caption: json['caption'] as String,
      description: json['description'] as String,
      likes: json['likes'] as int,
      comments: json['comments'] as int,
      shares: json['shares'] as int,
      videoUrl: json['videoUrl'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
      avatarUrl: json['avatarUrl'] as String,
      targetAmount: (json['targetAmount'] as num).toDouble(),
      currentAmount: (json['currentAmount'] as num).toDouble(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      tags: List<String>.from(json['tags'] as List),
      campaignTitle: json['campaignTitle'] as String,
      campaignSubtitle: json['campaignSubtitle'] as String,
      campaignImageUrl: json['campaignImageUrl'] as String,
      progressPercentage: json['progressPercentage'] as int,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is VideoNeedyPersonModel &&
        other.id == id &&
        other.name == name &&
        other.location == location &&
        other.caption == caption &&
        other.description == description &&
        other.likes == likes &&
        other.comments == comments &&
        other.shares == shares &&
        other.videoUrl == videoUrl &&
        other.thumbnailUrl == thumbnailUrl &&
        other.avatarUrl == avatarUrl &&
        other.targetAmount == targetAmount &&
        other.currentAmount == currentAmount &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return Object.hash(
      id,
      name,
      location,
      caption,
      description,
      likes,
      comments,
      shares,
      videoUrl,
      thumbnailUrl,
      avatarUrl,
      targetAmount,
      currentAmount,
      createdAt,
    );
  }

  @override
  String toString() {
    return 'VideoNeedyPersonModel(id: $id, name: $name, location: $location, caption: $caption)';
  }
}
