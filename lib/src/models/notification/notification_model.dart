class NotificationCard {
  final String id;
  final String title;
  final String message;
  final String type; // 'emergency' or 'normal'
  final DateTime timestamp;
  final bool isRead;
  final String? actionUrl;
  final Map<String, dynamic>? metadata;
  final String? organization;
  final String? amount;
  final String? imageAsset;

  const NotificationCard({
    required this.id,
    required this.title,
    required this.message,
    required this.type,
    required this.timestamp,
    this.isRead = false,
    this.actionUrl,
    this.metadata,
    this.organization,
    this.amount,
    this.imageAsset,
  });

  NotificationCard copyWith({
    String? id,
    String? title,
    String? message,
    String? type,
    DateTime? timestamp,
    bool? isRead,
    String? actionUrl,
    Map<String, dynamic>? metadata,
    String? organization,
    String? amount,
    String? imageAsset,
  }) {
    return NotificationCard(
      id: id ?? this.id,
      title: title ?? this.title,
      message: message ?? this.message,
      type: type ?? this.type,
      timestamp: timestamp ?? this.timestamp,
      isRead: isRead ?? this.isRead,
      actionUrl: actionUrl ?? this.actionUrl,
      metadata: metadata ?? this.metadata,
      organization: organization ?? this.organization,
      amount: amount ?? this.amount,
      imageAsset: imageAsset ?? this.imageAsset,
    );
  }

  factory NotificationCard.fromJson(Map<String, dynamic> json) {
    return NotificationCard(
      id: json['id'] as String,
      title: json['title'] as String,
      message: json['message'] as String,
      type: json['type'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      isRead: json['isRead'] as bool? ?? false,
      actionUrl: json['actionUrl'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
      organization: json['organization'] as String?,
      amount: json['amount'] as String?,
      imageAsset: json['imageAsset'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'message': message,
      'type': type,
      'timestamp': timestamp.toIso8601String(),
      'isRead': isRead,
      'actionUrl': actionUrl,
      'metadata': metadata,
      'organization': organization,
      'amount': amount,
      'imageAsset': imageAsset,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is NotificationCard &&
        other.id == id &&
        other.title == title &&
        other.message == message &&
        other.type == type &&
        other.timestamp == timestamp &&
        other.isRead == isRead &&
        other.actionUrl == actionUrl;
  }

  @override
  int get hashCode {
    return Object.hash(
      id,
      title,
      message,
      type,
      timestamp,
      isRead,
      actionUrl,
    );
  }

  @override
  String toString() {
    return 'NotificationCard(id: $id, title: $title, type: $type, isRead: $isRead)';
  }
}
