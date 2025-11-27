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
          // Truyền context gốc (có chứa Provider) vào hàm build list
          return _buildUserList(context, state);
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

  Widget _buildUserList(BuildContext context, UserManagementLoaded state) {
    return Column(
      children: [
        _buildFilterSection(context, state),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
            itemCount: state.filteredUsers.length,
            itemBuilder: (ctx, index) {
              final user = state.filteredUsers[index];
              return _buildUserCard(context, user);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildFilterSection(BuildContext context, UserManagementLoaded state) {
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

  Widget _buildUserCard(BuildContext context, AdminUserModel user) {
    final daysInactive = user.getDaysInactive();

    // Lấy instance của Cubit từ context gốc để truyền vào Dialog sau này
    final cubit = context.read<UserManagementCubit>();

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
                    color: user.status == 'Hoạt động'
                        ? Colors.green
                        : Colors.orange, // Màu cam cho Tạm khóa
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
                _confirmDeleteUser(context, cubit, user);
                break;
              case 'suspend':
                _confirmSuspendUser(context, cubit, user);
                break;
              case 'unlock':
                _confirmUnlockUser(context, cubit, user);
                break;
            }
          },
          itemBuilder: (BuildContext context) {
            List<PopupMenuEntry<String>> menuItems = [
              const PopupMenuItem<String>(
                value: 'delete',
                child: Text('Xóa'),
              ),
            ];

            // Logic hiển thị menu dựa trên trạng thái hiện tại
            if (user.status == 'Hoạt động') {
              menuItems.add(const PopupMenuItem<String>(
                value: 'suspend',
                child: Text('Tạm khóa'),
              ));
            } else if (user.status == 'Tạm khóa') {
              menuItems.add(const PopupMenuItem<String>(
                value: 'unlock',
                child: Text('Mở khóa'),
              ));
            }

            return menuItems;
          },
        ),
      ),
    );
  }

  // Truyền cubit vào để gọi hàm, tránh lỗi ProviderNotFoundException
  void _confirmDeleteUser(
      BuildContext context, UserManagementCubit cubit, AdminUserModel user) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text("Xác nhận xóa"),
        content: Text("Bạn có chắc muốn xóa ${user.name} không?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text("Hủy"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext);
              cubit.deleteUser(user.cccd);
            },
            child: const Text("Xóa", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  void _confirmSuspendUser(
      BuildContext context, UserManagementCubit cubit, AdminUserModel user) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text("Xác nhận tạm khóa"),
        content: Text("Bạn có chắc muốn tạm khóa ${user.name} không?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text("Hủy"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext);
              cubit.suspendUser(user.cccd);
            },
            child:
                const Text("Tạm khóa", style: TextStyle(color: Colors.orange)),
          ),
        ],
      ),
    );
  }

  void _confirmUnlockUser(
      BuildContext context, UserManagementCubit cubit, AdminUserModel user) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text("Xác nhận mở khóa"),
        content: Text("Bạn có chắc muốn mở khóa tài khoản ${user.name} không?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text("Hủy"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext);
              cubit.unlockUser(user.cccd);
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
