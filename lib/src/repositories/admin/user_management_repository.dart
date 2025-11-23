import '../../models/admin/admin_user_model.dart';

abstract class UserRepository {
  Future<List<AdminUserModel>> getAllUsers();
  Future<List<AdminUserModel>> getFilteredUsers(int filterDays);
  Future<void> deleteUser(String cccd);
  Future<void> suspendUser(String cccd);
  Future<void> unlockUser(String cccd);
}

class UserRepositoryImpl implements UserRepository {
  // Mock data - trong thực tế sẽ kết nối với API hoặc database
  static final List<Map<String, dynamic>> _usersData = [
    {
      "name": "Nguyễn Đăng Khoa",
      "cccd": "054204003257",
      "avatar": "assets/images/AnhCV.jpg",
      "lastLoginDate": "2025-10-02",
      "status": "Hoạt động",
    },
    {
      "name": "Lê Thị Thúy Kiều",
      "cccd": "045304004088",
      "avatar": "assets/images/HinhAnh_Demo.jpg",
      "lastLoginDate": "2025-10-02",
      "status": "Hoạt động",
    },
    {
      "name": "Nguyễn Văn HH",
      "cccd": "045304004214",
      "avatar": "assets/images/onghuy.png",
      "lastLoginDate": "2025-08-20",
      "status": "Hoạt động",
    },
    {
      "name": "Đinh Thị TT",
      "cccd": "045304004888",
      "avatar": "assets/images/HinhAnh_Demo1.jpg",
      "lastLoginDate": "2025-08-20",
      "status": "Hoạt động",
    },
    {
      "name": "Nguyễn Văn Huy",
      "cccd": "045304004311",
      "avatar": "assets/images/nguoikhokhan1.jpg",
      "lastLoginDate": "2025-07-05",
      "status": "Hoạt động",
    },
    {
      "name": "Nguyễn Thị Hòa",
      "cccd": "045304005132",
      "avatar": "assets/images/nguoikhokhan2.jpg",
      "lastLoginDate": "2025-11-05",
      "status": "Hoạt động",
    },
    {
      "name": "Thái Thị Hoa",
      "cccd": "045304005444",
      "avatar": "assets/images/nguoikhokhan3.jpg",
      "lastLoginDate": "2025-07-02",
      "status": "Hoạt động",
    },
    {
      "name": "Lại Tiến Dũng",
      "cccd": "045304005326",
      "avatar": "assets/images/nguoikhokhan4.jpg",
      "lastLoginDate": "2025-11-02",
      "status": "Hoạt động",
    },
    {
      "name": "Trần Văn Kiên",
      "cccd": "045304004889",
      "avatar": "assets/images/nguoikhokhan5.jpg",
      "lastLoginDate": "2025-11-01",
      "status": "Hoạt động",
    },
    {
      "name": "Nguyễn Thanh Trường",
      "cccd": "045304004005",
      "avatar": "assets/images/nguoikhokhan6.jpg",
      "lastLoginDate": "2025-10-28",
      "status": "Hoạt động",
    },
  ];

  @override
  Future<List<AdminUserModel>> getAllUsers() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));
    return _usersData
        .map((userData) => AdminUserModel.fromMap(userData))
        .toList();
  }

  @override
  Future<List<AdminUserModel>> getFilteredUsers(int filterDays) async {
    final users = await getAllUsers();
    if (filterDays == 0) return users;

    return users.where((user) {
      return user.getDaysInactive() >= filterDays;
    }).toList();
  }

  @override
  Future<void> deleteUser(String cccd) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 300));
    _usersData.removeWhere((user) => user['cccd'] == cccd);
  }

  @override
  Future<void> suspendUser(String cccd) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 300));
    final index = _usersData.indexWhere((user) => user['cccd'] == cccd);
    if (index != -1) {
      _usersData[index]['status'] = 'Tạm khóa';
    }
  }

  @override
  Future<void> unlockUser(String cccd) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 300));
    final index = _usersData.indexWhere((user) => user['cccd'] == cccd);
    if (index != -1) {
      _usersData[index]['status'] = 'Hoạt động';
    }
  }
}
