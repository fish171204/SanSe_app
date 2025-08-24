class AdminUserModel {
  final String name;
  final String cccd;
  final String avatar;
  final String lastLoginDate;
  final String status;

  const AdminUserModel({
    required this.name,
    required this.cccd,
    required this.avatar,
    required this.lastLoginDate,
    this.status = 'Hoạt động',
  });

  factory AdminUserModel.fromMap(Map<String, dynamic> map) {
    return AdminUserModel(
      name: map['name'] ?? '',
      cccd: map['cccd'] ?? '',
      avatar: map['avatar'] ?? '',
      lastLoginDate: map['lastLoginDate'] ?? '',
      status: map['status'] ?? 'Hoạt động',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'cccd': cccd,
      'avatar': avatar,
      'lastLoginDate': lastLoginDate,
      'status': status,
    };
  }

  AdminUserModel copyWith({
    String? name,
    String? cccd,
    String? avatar,
    String? lastLoginDate,
    String? status,
  }) {
    return AdminUserModel(
      name: name ?? this.name,
      cccd: cccd ?? this.cccd,
      avatar: avatar ?? this.avatar,
      lastLoginDate: lastLoginDate ?? this.lastLoginDate,
      status: status ?? this.status,
    );
  }

  int getDaysInactive() {
    DateTime lastLogin = DateTime.parse(lastLoginDate);
    DateTime now = DateTime.now();
    return now.difference(lastLogin).inDays;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AdminUserModel &&
        other.name == name &&
        other.cccd == cccd &&
        other.avatar == avatar &&
        other.lastLoginDate == lastLoginDate &&
        other.status == status;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        cccd.hashCode ^
        avatar.hashCode ^
        lastLoginDate.hashCode ^
        status.hashCode;
  }

  @override
  String toString() {
    return 'AdminUserModel(name: $name, cccd: $cccd, avatar: $avatar, lastLoginDate: $lastLoginDate, status: $status)';
  }
}
