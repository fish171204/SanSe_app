import 'package:equatable/equatable.dart';
import '../../../models/admin/admin_user_model.dart';

abstract class UserManagementState extends Equatable {
  const UserManagementState();

  @override
  List<Object?> get props => [];
}

class UserManagementInitial extends UserManagementState {}

class UserManagementLoading extends UserManagementState {}

class UserManagementLoaded extends UserManagementState {
  final List<AdminUserModel> users;
  final List<AdminUserModel> filteredUsers;

  final int filterDays;
  final String filterStatus; // "Tất cả", "Hoạt động", "Tạm khóa"
  final String searchQuery;

  final String? actionMessage;
  final AdminUserModel? actionUser;

  const UserManagementLoaded({
    required this.users,
    required this.filteredUsers,
    this.filterDays = 0,
    this.filterStatus = "Tất cả",
    this.searchQuery = "",
    this.actionMessage,
    this.actionUser,
  });

  UserManagementLoaded copyWith({
    List<AdminUserModel>? users,
    List<AdminUserModel>? filteredUsers,
    int? filterDays,
    String? filterStatus,
    String? searchQuery,
    String? actionMessage,
    AdminUserModel? actionUser,
    bool clearMessage = false,
  }) {
    return UserManagementLoaded(
      users: users ?? this.users,
      filteredUsers: filteredUsers ?? this.filteredUsers,
      filterDays: filterDays ?? this.filterDays,
      filterStatus: filterStatus ?? this.filterStatus,
      searchQuery: searchQuery ?? this.searchQuery,
      actionMessage:
          clearMessage ? null : (actionMessage ?? this.actionMessage),
      actionUser: clearMessage ? null : (actionUser ?? this.actionUser),
    );
  }

  @override
  List<Object?> get props => [
        users,
        filteredUsers,
        filterDays,
        filterStatus,
        searchQuery,
        actionMessage,
        actionUser
      ];
}

class UserManagementError extends UserManagementState {
  final String message;
  const UserManagementError(this.message);
  @override
  List<Object?> get props => [message];
}
