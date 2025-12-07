class AdminPostModel {
  final String imagePath;
  final String title;
  final String subtitle;
  final String amount;
  final int progress;
  final int originalProgress;
  final bool isDeleted;
  final String status; // 'available', 'unavailable', 'pending', 'rejected'
  final String submissionDate;
  final String senderName;

  const AdminPostModel({
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.progress,
    required this.originalProgress,
    this.isDeleted = false,
    this.status = 'available',
    this.submissionDate = '',
    this.senderName = '',
  });

  factory AdminPostModel.fromMap(Map<String, dynamic> map) {
    return AdminPostModel(
      imagePath: map['imagePath'] ?? '',
      title: map['title'] ?? '',
      subtitle: map['subtitle'] ?? '',
      amount: map['amount'] ?? '',
      progress: map['progress'] ?? 0,
      originalProgress: map['originalProgress'] ?? 0,
      isDeleted: map['isDeleted'] ?? false,
      status: map['status'] ?? 'available',
      submissionDate: map['submissionDate'] ?? '01/01/2025',
      senderName: map['senderName'] ?? 'Ẩn danh',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'imagePath': imagePath,
      'title': title,
      'subtitle': subtitle,
      'amount': amount,
      'progress': progress,
      'originalProgress': originalProgress,
      'isDeleted': isDeleted,
      'status': status,
      'submissionDate': submissionDate,
      'senderName': senderName,
    };
  }

  AdminPostModel copyWith({
    String? imagePath,
    String? title,
    String? subtitle,
    String? amount,
    int? progress,
    int? originalProgress,
    bool? isDeleted,
    String? status,
    String? submissionDate,
    String? senderName,
  }) {
    return AdminPostModel(
      imagePath: imagePath ?? this.imagePath,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      amount: amount ?? this.amount,
      progress: progress ?? this.progress,
      originalProgress: originalProgress ?? this.originalProgress,
      isDeleted: isDeleted ?? this.isDeleted,
      status: status ?? this.status,
      submissionDate: submissionDate ?? this.submissionDate,
      senderName: senderName ?? this.senderName,
    );
  }

  bool get isCompleted => progress == 100;

  String get statusText => isCompleted ? "Đã hoàn thành" : "Chưa hoàn thành";

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AdminPostModel &&
        other.imagePath == imagePath &&
        other.title == title &&
        other.subtitle == subtitle &&
        other.amount == amount &&
        other.progress == progress &&
        other.originalProgress == originalProgress &&
        other.isDeleted == isDeleted &&
        other.status == status;
  }

  @override
  int get hashCode {
    return imagePath.hashCode ^
        title.hashCode ^
        subtitle.hashCode ^
        amount.hashCode ^
        progress.hashCode ^
        originalProgress.hashCode ^
        isDeleted.hashCode ^
        status.hashCode;
  }

  @override
  String toString() {
    return 'AdminPostModel(imagePath: $imagePath, title: $title, subtitle: $subtitle, amount: $amount, progress: $progress, originalProgress: $originalProgress, isDeleted: $isDeleted, status: $status)';
  }
}
