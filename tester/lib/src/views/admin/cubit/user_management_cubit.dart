import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../repositories/admin/user_management_repository.dart';
import 'user_management_state.dart';

class UserManagementCubit extends Cubit<UserManagementState> {
  final UserRepository _repository;

  UserManagementCubit(this._repository) : super(UserManagementInitial());

  Future<void> loadUsers() async {
    try {
      emit(UserManagementLoading());

      final users = await _repository.getAllUsers();

      emit(UserManagementLoaded(
        users: users,
        filteredUsers: users,
      ));
    } catch (e) {
      emit(UserManagementError(
          'Không thể tải danh sách người dùng: ${e.toString()}'));
    }
  }

  Future<void> filterUsers(int filterDays) async {
    final currentState = state;
    if (currentState is! UserManagementLoaded) return;

    try {
      emit(UserManagementLoading());

      final filteredUsers = await _repository.getFilteredUsers(filterDays);

      emit(currentState.copyWith(
        filteredUsers: filteredUsers,
        filterDays: filterDays,
      ));
    } catch (e) {
      emit(UserManagementError('Không thể lọc người dùng: ${e.toString()}'));
    }
  }

  Future<void> deleteUser(String cccd) async {
    final currentState = state;
    if (currentState is! UserManagementLoaded) return;

    try {
      // Find user info before deletion
      final user = currentState.users.firstWhere((u) => u.cccd == cccd);

      await _repository.deleteUser(cccd);

      // Reload users after deletion
      final updatedUsers = await _repository.getAllUsers();
      final filteredUsers =
          await _repository.getFilteredUsers(currentState.filterDays);

      emit(currentState.copyWith(
        users: updatedUsers,
        filteredUsers: filteredUsers,
      ));

      // Emit success state with user info
      emit(UserManagementActionSuccess(
        'Xóa người dùng thành công!',
        userName: user.name,
        userCCCD: user.cccd,
      ));

      // Return to loaded state
      emit(currentState.copyWith(
        users: updatedUsers,
        filteredUsers: filteredUsers,
      ));
    } catch (e) {
      emit(UserManagementError('Không thể xóa người dùng: ${e.toString()}'));
    }
  }

  Future<void> suspendUser(String cccd) async {
    final currentState = state;
    if (currentState is! UserManagementLoaded) return;

    try {
      await _repository.suspendUser(cccd);

      // Reload users after suspension
      final updatedUsers = await _repository.getAllUsers();
      final filteredUsers =
          await _repository.getFilteredUsers(currentState.filterDays);

      emit(currentState.copyWith(
        users: updatedUsers,
        filteredUsers: filteredUsers,
      ));

      emit(const UserManagementActionSuccess('Tạm khóa người dùng thành công'));

      // Return to loaded state
      emit(currentState.copyWith(
        users: updatedUsers,
        filteredUsers: filteredUsers,
      ));
    } catch (e) {
      emit(UserManagementError(
          'Không thể tạm khóa người dùng: ${e.toString()}'));
    }
  }

  Future<void> unlockUser(String cccd) async {
    final currentState = state;
    if (currentState is! UserManagementLoaded) return;

    try {
      await _repository.unlockUser(cccd);

      // Reload users after unlocking
      final updatedUsers = await _repository.getAllUsers();
      final filteredUsers =
          await _repository.getFilteredUsers(currentState.filterDays);

      emit(currentState.copyWith(
        users: updatedUsers,
        filteredUsers: filteredUsers,
      ));

      emit(const UserManagementActionSuccess('Mở khóa người dùng thành công'));

      // Return to loaded state
      emit(currentState.copyWith(
        users: updatedUsers,
        filteredUsers: filteredUsers,
      ));
    } catch (e) {
      emit(
          UserManagementError('Không thể mở khóa người dùng: ${e.toString()}'));
    }
  }
}
