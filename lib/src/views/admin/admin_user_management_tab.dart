import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:intl/intl.dart';

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
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  // --- HÀM XUẤT PDF (CÓ ID/CCCD) ---
  Future<void> _exportToPdf(List<AdminUserModel> users) async {
    final doc = pw.Document();

    final font = await PdfGoogleFonts.robotoRegular();
    final fontBold = await PdfGoogleFonts.robotoBold();

    doc.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        theme: pw.ThemeData.withFont(base: font, bold: fontBold),
        build: (pw.Context context) {
          return [
            pw.Header(
              level: 0,
              child: pw.Center(
                child: pw.Text('DANH SÁCH NGƯỜI DÙNG',
                    style: pw.TextStyle(
                        fontSize: 24, fontWeight: pw.FontWeight.bold)),
              ),
            ),
            pw.SizedBox(height: 20),
            pw.Align(
              alignment: pw.Alignment.centerRight,
              child: pw.Text(
                  'Ngày xuất: ${DateFormat('dd/MM/yyyy HH:mm').format(DateTime.now())}'),
            ),
            pw.SizedBox(height: 20),
            pw.TableHelper.fromTextArray(
              context: context,
              border: pw.TableBorder.all(),
              headerStyle: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold, color: PdfColors.white),
              headerDecoration: const pw.BoxDecoration(color: PdfColors.blue),
              cellAlignment: pw.Alignment.centerLeft,
              columnWidths: {
                0: const pw.FixedColumnWidth(35), // Cột STT nhỏ
                1: const pw.FlexColumnWidth(2), // Tên
                2: const pw.FlexColumnWidth(1.5), // CCCD
                3: const pw.FlexColumnWidth(1), // Trạng thái
                4: const pw.FlexColumnWidth(1.2), // Ngày đăng nhập
              },
              headers: [
                'STT', // Header mới
                'Họ và Tên',
                'ID / CCCD',
                'Trạng thái',
                'Đăng nhập cuối'
              ],
              data: List<List<dynamic>>.generate(
                users.length,
                (index) => [
                  (index + 1).toString(),
                  users[index].name,
                  users[index].cccd,
                  users[index].status,
                  users[index].lastLoginDate
                ],
              ),
            ),
          ];
        },
      ),
    );

    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => doc.save(),
      name: 'danh_sach_nguoi_dung.pdf',
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserManagementCubit, UserManagementState>(
      listener: (context, state) {
        if (state is UserManagementLoaded && state.actionMessage != null) {
          // 1. Hiển thị Dialog thành công
          _showSuccessDialog(context, state.actionMessage!,
              state.actionUser?.name ?? "", state.actionUser?.cccd ?? "");
          // 2. Xóa message trong state để tránh hiện lại khi rebuild
          context.read<UserManagementCubit>().clearActionMessage();
        } else if (state is UserManagementError) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.message), backgroundColor: Colors.red));
        }
      },
      builder: (context, state) {
        if (state is UserManagementLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is UserManagementLoaded) {
          return Column(
            children: [
              // --- 1. THANH TÌM KIẾM ---
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Tìm kiếm theo tên, CCCD...',
                    prefixIcon: const Icon(Icons.search),
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25)),
                    filled: true,
                    fillColor: Colors.grey[100],
                  ),
                  onChanged: (value) {
                    context.read<UserManagementCubit>().searchUsers(value);
                  },
                ),
              ),

              // --- 2. THANH LỌC VÀ EXPORT ---
              _buildFilterBar(context, state),

              // --- 3. DANH SÁCH ---
              Expanded(
                child: state.filteredUsers.isEmpty
                    ? const Center(
                        child: Text("Không tìm thấy người dùng nào."))
                    : ListView.builder(
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
        } else if (state is UserManagementError) {
          return Center(child: Text(state.message));
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildFilterBar(BuildContext context, UserManagementLoaded state) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      child: Row(
        children: [
          // Lọc Trạng Thái
          const Text("Trạng thái: ",
              style: TextStyle(fontWeight: FontWeight.bold)),
          DropdownButton<String>(
            value: state.filterStatus,
            onChanged: (newValue) {
              if (newValue != null) {
                context.read<UserManagementCubit>().filterByStatus(newValue);
              }
            },
            items: ["Tất cả", "Hoạt động", "Tạm khóa"]
                .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                .toList(),
          ),

          const SizedBox(width: 15),

          // Lọc Ngày
          const Text("Vắng: ", style: TextStyle(fontWeight: FontWeight.bold)),
          DropdownButton<int>(
            value: state.filterDays,
            onChanged: (newValue) {
              if (newValue != null) {
                context.read<UserManagementCubit>().filterByDays(newValue);
              }
            },
            items: const [
              DropdownMenuItem(value: 0, child: Text('Tất cả')),
              DropdownMenuItem(value: 30, child: Text('> 30 ngày')),
              DropdownMenuItem(value: 60, child: Text('> 60 ngày')),
              DropdownMenuItem(value: 365, child: Text('> 1 năm')),
            ],
          ),

          const SizedBox(width: 15),

          // Nút Xuất PDF
          IconButton(
            icon: const Icon(Icons.picture_as_pdf, color: Colors.red),
            tooltip: "Xuất PDF danh sách này",
            onPressed: () {
              if (state.filteredUsers.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Danh sách trống, không thể xuất PDF!")));
              } else {
                _exportToPdf(state.filteredUsers);
              }
            },
          )
        ],
      ),
    );
  }

  Widget _buildUserCard(BuildContext context, AdminUserModel user) {
    final daysInactive = user.getDaysInactive();
    final cubit = context.read<UserManagementCubit>();

    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        leading: CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage(user.avatar),
          onBackgroundImageError: (_, __) => const Icon(Icons.person),
        ),
        title: Text(
          user.name,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text("ID/CCCD: ${user.cccd}", style: const TextStyle(fontSize: 12)),
            Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: user.status == 'Hoạt động'
                        ? Colors.green
                        : Colors.orange,
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  user.status,
                  style: TextStyle(
                    fontSize: 12,
                    color: user.status == 'Hoạt động'
                        ? Colors.green
                        : Colors.orange,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 10),
                Text("| $daysInactive ngày vắng",
                    style: const TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
          ],
        ),
        trailing: PopupMenuButton<String>(
          icon: const Icon(Icons.more_vert),
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
          itemBuilder: (context) {
            List<PopupMenuEntry<String>> menuItems = [
              const PopupMenuItem(
                  value: 'delete',
                  child: Row(children: [
                    Icon(Icons.delete, color: Colors.red, size: 20),
                    SizedBox(width: 8),
                    Text('Xóa')
                  ])),
            ];
            if (user.status == 'Hoạt động') {
              menuItems.add(const PopupMenuItem(
                  value: 'suspend',
                  child: Row(children: [
                    Icon(Icons.block, color: Colors.orange, size: 20),
                    SizedBox(width: 8),
                    Text('Tạm khóa')
                  ])));
            } else {
              menuItems.add(const PopupMenuItem(
                  value: 'unlock',
                  child: Row(children: [
                    Icon(Icons.lock_open, color: Colors.green, size: 20),
                    SizedBox(width: 8),
                    Text('Mở khóa')
                  ])));
            }
            return menuItems;
          },
        ),
      ),
    );
  }

  void _confirmDeleteUser(
      BuildContext context, UserManagementCubit cubit, AdminUserModel user) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Xác nhận xóa"),
        content: Text("Bạn có chắc muốn xóa ${user.name} không?"),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx), child: const Text("Hủy")),
          TextButton(
              onPressed: () {
                Navigator.pop(ctx);
                cubit.deleteUser(user.cccd);
              },
              child: const Text("Xóa", style: TextStyle(color: Colors.red))),
        ],
      ),
    );
  }

  void _confirmSuspendUser(
      BuildContext context, UserManagementCubit cubit, AdminUserModel user) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Xác nhận tạm khóa"),
        content: Text("Bạn có muốn tạm khóa ${user.name}?"),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx), child: const Text("Hủy")),
          TextButton(
              onPressed: () {
                Navigator.pop(ctx);
                cubit.suspendUser(user.cccd);
              },
              child: const Text("Tạm khóa",
                  style: TextStyle(color: Colors.orange))),
        ],
      ),
    );
  }

  void _confirmUnlockUser(
      BuildContext context, UserManagementCubit cubit, AdminUserModel user) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Xác nhận mở khóa"),
        content: Text("Mở khóa tài khoản cho ${user.name}?"),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx), child: const Text("Hủy")),
          TextButton(
              onPressed: () {
                Navigator.pop(ctx);
                cubit.unlockUser(user.cccd);
              },
              child:
                  const Text("Mở khóa", style: TextStyle(color: Colors.green))),
        ],
      ),
    );
  }

  void _showSuccessDialog(
      BuildContext context, String message, String name, String cccd) {
    showDialog(
      context: context,
      builder: (ctx) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.check_circle_outline,
                  color: Colors.green, size: 60),
              const SizedBox(height: 15),
              Text(message,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
              const SizedBox(height: 10),
              Text("User: $name\nCCCD: $cccd",
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.grey)),
              const SizedBox(height: 20),
              TextButton(
                  onPressed: () => Navigator.pop(ctx),
                  child: const Text("OK", style: TextStyle(fontSize: 16))),
            ],
          ),
        ),
      ),
    );
  }
}
