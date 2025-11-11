import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repositories/admin/user_management_repository.dart';
import '../../models/admin/admin_user_model.dart';
import 'cubit/user_management_cubit.dart';
import 'cubit/user_management_state.dart';

class UserManagementScreen extends StatelessWidget {
  const UserManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          UserManagementCubit(UserRepositoryImpl())..loadUsers(),
      child: const _UserManagementView(),
    );
  }
}

class _UserManagementView extends StatefulWidget {
  const _UserManagementView();

  @override
  State<_UserManagementView> createState() => _UserManagementViewState();
}

class _UserManagementViewState extends State<_UserManagementView> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserManagementCubit, UserManagementState>(
      listener: (context, state) {
        if (state is UserManagementActionSuccess) {
          if (state.userName != null && state.userCCCD != null) {
            _showSuccessDialog(state.message, state.userName!, state.userCCCD!);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        } else if (state is UserManagementError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is UserManagementLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is UserManagementLoaded) {
          return _buildUserList(state);
        } else if (state is UserManagementError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(state.message),
                ElevatedButton(
                  onPressed: () =>
                      context.read<UserManagementCubit>().loadUsers(),
                  child: const Text('Thử lại'),
                ),
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildUserList(UserManagementLoaded state) {
    return Column(
      children: [
        _buildFilterSection(state),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
            itemCount: state.filteredUsers.length,
            itemBuilder: (context, index) {
              final user = state.filteredUsers[index];
              return _buildUserCard(user);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildFilterSection(UserManagementLoaded state) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Text(
            'Lọc theo số ngày hoạt động:',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(width: 10),
          DropdownButton<int>(
            value: state.filterDays,
            onChanged: (newValue) {
              if (newValue != null) {
                context.read<UserManagementCubit>().filterUsers(newValue);
              }
            },
            items: const [
              DropdownMenuItem(
                value: 0,
                child: Text('Tất cả người dùng'),
              ),
              DropdownMenuItem(
                value: 30,
                child: Text('30 ngày trở đi'),
              ),
              DropdownMenuItem(
                value: 60,
                child: Text('60 ngày trở đi'),
              ),
              DropdownMenuItem(
                value: 90,
                child: Text('90 ngày trở đi'),
              ),
              DropdownMenuItem(
                value: 365,
                child: Text('1 năm trở đi'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildUserCard(AdminUserModel user) {
    final daysInactive = user.getDaysInactive();

    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(10),
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(user.avatar),
        ),
        title: Text(
          user.name,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("CCCD: ${user.cccd}"),
            Row(
              children: [
                const Text("Trạng thái: "),
                Text(
                  user.status,
                  style: TextStyle(
                    color:
                        user.status == 'Hoạt động' ? Colors.green : Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Text("Số ngày không hoạt động: $daysInactive ngày"),
          ],
        ),
        trailing: PopupMenuButton<String>(
          onSelected: (value) {
            switch (value) {
              case 'delete':
                _confirmDeleteUser(user);
                break;
              case 'suspend':
                _confirmSuspendUser(user);
                break;
              case 'unlock':
                _confirmUnlockUser(user);
                break;
            }
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            const PopupMenuItem<String>(
              value: 'delete',
              child: Text('Xóa'),
            ),
            const PopupMenuItem<String>(
              value: 'suspend',
              child: Text('Tạm khóa'),
            ),
            const PopupMenuItem<String>(
              value: 'unlock',
              child: Text('Mở khóa'),
            ),
          ],
        ),
      ),
    );
  }

  void _confirmDeleteUser(AdminUserModel user) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Xác nhận xóa"),
        content: Text("Bạn có chắc muốn xóa ${user.name} không?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Hủy"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              context.read<UserManagementCubit>().deleteUser(user.cccd);
            },
            child: const Text("Xóa", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  void _confirmSuspendUser(AdminUserModel user) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Xác nhận tạm khóa"),
        content: Text("Bạn có chắc muốn tạm khóa ${user.name} không?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Hủy"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              context.read<UserManagementCubit>().suspendUser(user.cccd);
            },
            child:
                const Text("Tạm khóa", style: TextStyle(color: Colors.orange)),
          ),
        ],
      ),
    );
  }

  void _confirmUnlockUser(AdminUserModel user) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Xác nhận mở khóa"),
        content: Text("Bạn có chắc muốn mở khóa ${user.name} không?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Hủy"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              context.read<UserManagementCubit>().unlockUser(user.cccd);
            },
            child: const Text("Mở khóa", style: TextStyle(color: Colors.green)),
          ),
        ],
      ),
    );
  }

  void _showSuccessDialog(String message, String name, String cccd) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 10,
          child: Container(
            padding: const EdgeInsets.all(20),
            height: 260,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.check_circle_outline,
                  color: Colors.green,
                  size: 60,
                ),
                const SizedBox(height: 15),
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  "Người dùng: $name\nCCCD: $cccd",
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 15),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    "OK",
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
