import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../repositories/admin/user_management_repository.dart';
import '../../../models/admin/admin_user_model.dart';

import 'user_management_state.dart';

class UserManagementCubit extends Cubit<UserManagementState> {
  final UserRepository _repository;

  UserManagementCubit(this._repository) : super(UserManagementInitial());

  Future<void> loadUsers() async {
    try {
      emit(UserManagementLoading());
      final users = await _repository.getAllUsers();
      emit(UserManagementLoaded(users: users, filteredUsers: users));
    } catch (e) {
      emit(UserManagementError('Lỗi tải danh sách: ${e.toString()}'));
    }
  }

  List<AdminUserModel> _calculateFilteredUsers(
      List<AdminUserModel> sourceList) {
    final currentState = state;
    if (currentState is! UserManagementLoaded) return sourceList;

    var result = sourceList;

    // --- Tìm kiếm theo Tên HOẶC CCCD ---
    if (currentState.searchQuery.isNotEmpty) {
      final query = currentState.searchQuery.toLowerCase();
      result = result.where((u) {
        final nameMatch = u.name.toLowerCase().contains(query);
        final cccdMatch = u.cccd.toLowerCase().contains(query);
        return nameMatch || cccdMatch;
      }).toList();
    }

    if (currentState.filterStatus != "Tất cả") {
      result =
          result.where((u) => u.status == currentState.filterStatus).toList();
    }

    if (currentState.filterDays > 0) {
      result = result
          .where((u) => u.getDaysInactive() >= currentState.filterDays)
          .toList();
    }

    return result;
  }

  // --- 3. APPLY FILTERS (DÙNG CHO UI SEARCH/FILTER) ---
  void _emitFilteredList() {
    final currentState = state;
    if (currentState is! UserManagementLoaded) return;

    final filtered = _calculateFilteredUsers(currentState.users);

    emit(currentState.copyWith(filteredUsers: filtered));
  }

  void searchUsers(String query) {
    final currentState = state;
    if (currentState is UserManagementLoaded) {
      emit(currentState.copyWith(searchQuery: query));
      _emitFilteredList();
    }
  }

  void filterByStatus(String status) {
    final currentState = state;
    if (currentState is UserManagementLoaded) {
      emit(currentState.copyWith(filterStatus: status));
      _emitFilteredList();
    }
  }

  void filterByDays(int days) {
    final currentState = state;
    if (currentState is UserManagementLoaded) {
      emit(currentState.copyWith(filterDays: days));
      _emitFilteredList();
    }
  }

  void clearActionMessage() {
    final currentState = state;
    if (currentState is UserManagementLoaded) {
      emit(currentState.copyWith(clearMessage: true));
    }
  }

  Future<void> deleteUser(String cccd) async {
    await _performAction(
        cccd, (id) => _repository.deleteUser(id), "Xóa người dùng thành công!");
  }

  Future<void> suspendUser(String cccd) async {
    await _performAction(
        cccd, (id) => _repository.suspendUser(id), "Đã tạm khóa tài khoản!");
  }

  Future<void> unlockUser(String cccd) async {
    await _performAction(
        cccd, (id) => _repository.unlockUser(id), "Đã mở khóa tài khoản!");
  }

  Future<void> _performAction(String cccd, Future<void> Function(String) action,
      String successMsg) async {
    final currentState = state;
    if (currentState is! UserManagementLoaded) return;

    try {
      final targetUser = currentState.users.firstWhere((u) => u.cccd == cccd,
          orElse: () => currentState.users.first);

      await action(cccd);

      final updatedUsers = await _repository.getAllUsers();

      final updatedFilteredUsers = _calculateFilteredUsers(updatedUsers);

      emit(currentState.copyWith(
        users: updatedUsers,
        filteredUsers: updatedFilteredUsers,
        actionMessage: successMsg,
        actionUser: targetUser,
      ));
    } catch (e) {
      emit(UserManagementError('Lỗi xử lý: ${e.toString()}'));
      loadUsers();
    }
  }
}
