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

  const UserManagementLoaded({
    required this.users,
    required this.filteredUsers,
    this.filterDays = 0,
  });

  UserManagementLoaded copyWith({
    List<AdminUserModel>? users,
    List<AdminUserModel>? filteredUsers,
    int? filterDays,
  }) {
    return UserManagementLoaded(
      users: users ?? this.users,
      filteredUsers: filteredUsers ?? this.filteredUsers,
      filterDays: filterDays ?? this.filterDays,
    );
  }

  @override
  List<Object?> get props => [users, filteredUsers, filterDays];
}

class UserManagementError extends UserManagementState {
  final String message;

  const UserManagementError(this.message);

  @override
  List<Object?> get props => [message];
}

class UserManagementActionSuccess extends UserManagementState {
  final String message;
  final String? userName;
  final String? userCCCD;

  const UserManagementActionSuccess(
    this.message, {
    this.userName,
    this.userCCCD,
  });

  @override
  List<Object?> get props => [message, userName, userCCCD];
}
