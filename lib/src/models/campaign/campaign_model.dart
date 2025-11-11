class CampaignModel {
  final String id;
  final String imagePath;
  final String title;
  final String subtitle;
  final String amount;
  final int progress;
  final List<String> categories;
  final DateTime? endDate;
  final int supportersCount;
  final bool isActive;

  CampaignModel({
    required this.id,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.progress,
    this.categories = const [],
    this.endDate,
    this.supportersCount = 0,
    this.isActive = true,
  });

  factory CampaignModel.fromJson(Map<String, dynamic> json) {
    return CampaignModel(
      id: json['id'] ?? '',
      imagePath: json['imagePath'] ?? '',
      title: json['title'] ?? '',
      subtitle: json['subtitle'] ?? '',
      amount: json['amount'] ?? '',
      progress: json['progress'] ?? 0,
      categories: List<String>.from(json['categories'] ?? []),
      endDate: json['endDate'] != null ? DateTime.parse(json['endDate']) : null,
      supportersCount: json['supportersCount'] ?? 0,
      isActive: json['isActive'] ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'imagePath': imagePath,
      'title': title,
      'subtitle': subtitle,
      'amount': amount,
      'progress': progress,
      'categories': categories,
      'endDate': endDate?.toIso8601String(),
      'supportersCount': supportersCount,
      'isActive': isActive,
    };
  }

  CampaignModel copyWith({
    String? id,
    String? imagePath,
    String? title,
    String? subtitle,
    String? amount,
    int? progress,
    List<String>? categories,
    DateTime? endDate,
    int? supportersCount,
    bool? isActive,
  }) {
    return CampaignModel(
      id: id ?? this.id,
      imagePath: imagePath ?? this.imagePath,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      amount: amount ?? this.amount,
      progress: progress ?? this.progress,
      categories: categories ?? this.categories,
      endDate: endDate ?? this.endDate,
      supportersCount: supportersCount ?? this.supportersCount,
      isActive: isActive ?? this.isActive,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CampaignModel && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'CampaignModel(id: $id, title: $title, progress: $progress%)';
  }
}
