import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repositories/admin/post_management_repository.dart';
import '../../models/admin/admin_post_model.dart';
import 'cubit/post_management_cubit.dart';
import 'cubit/post_management_state.dart';

class PostManagementScreen extends StatelessWidget {
  const PostManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          PostManagementCubit(PostRepositoryImpl())..loadPosts(),
      child: const _PostManagementView(),
    );
  }
}

class _PostManagementView extends StatefulWidget {
  const _PostManagementView();

  @override
  State<_PostManagementView> createState() => _PostManagementViewState();
}

class _PostManagementViewState extends State<_PostManagementView> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    if (mounted) {
      context.read<PostManagementCubit>().searchPosts(_searchController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostManagementCubit, PostManagementState>(
      listener: (context, state) async {
        // Thêm async ở đây
        if (state is PostManagementActionSuccess) {
          // Hiển thị dialog và chờ nó đóng
          _showSuccessDialog(state.message);
          // SAU KHI DIALOG ĐÓNG, ta load lại danh sách bài đăng
          // Gọi lại hàm loadPosts để load lại data
          context.read<PostManagementCubit>().loadPosts();
        } else if (state is PostManagementError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is PostManagementLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is PostManagementLoaded) {
          return _buildPostList(context, state);
        } else if (state is PostManagementError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(state.message),
                ElevatedButton(
                  onPressed: () =>
                      context.read<PostManagementCubit>().loadPosts(),
                  child: const Text('Thử lại'),
                ),
              ],
            ),
          );
        }
        // --- FIX: Hiển thị loading khi đang ở trạng thái Success (chờ reload list) ---
        else if (state is PostManagementActionSuccess) {
          return const SizedBox.shrink();
        }

        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildPostList(BuildContext context, PostManagementLoaded state) {
    // Bỏ Scaffold lồng nhau để tránh lỗi UI
    return Column(
      children: [
        _buildSearchBar(),
        _buildFilterSection(context, state),
        Expanded(
          child: ListView.builder(
            itemCount: state.filteredPosts.length,
            itemBuilder: (ctx, index) {
              final post = state.filteredPosts[index];
              return _buildPostItem(context, post);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: "Nhập tên bài đăng",
          prefixIcon: const Icon(Icons.search, color: Colors.grey),
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _buildFilterSection(BuildContext context, PostManagementLoaded state) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Lọc bài đăng:",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          DropdownButton<String>(
            value: state.selectedFilter,
            onChanged: (value) {
              if (value != null) {
                context.read<PostManagementCubit>().filterPosts(value);
              }
            },
            items: ["Tất cả", "Chưa hoàn thành", "Đã hoàn thành"]
                .map((filter) => DropdownMenuItem(
                      value: filter,
                      child: Text(filter),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildPostItem(BuildContext context, AdminPostModel post) {
    final cubit = context.read<PostManagementCubit>();
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                post.imagePath,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 80,
                    height: 80,
                    color: Colors.grey[300],
                    child: const Icon(Icons.image_not_supported),
                  );
                },
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    post.subtitle,
                    style: TextStyle(color: Colors.grey[600], fontSize: 12),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    post.amount,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.orange),
                  ),
                  const SizedBox(height: 4),
                  LinearProgressIndicator(
                    value: post.progress / 100,
                    backgroundColor: Colors.grey[300],
                    color: Colors.orange,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    post.statusText,
                    style: TextStyle(
                      color: post.isCompleted ? Colors.green : Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            PopupMenuButton<int>(
              icon: const Icon(Icons.more_vert),
              onSelected: (value) {
                switch (value) {
                  case 1:
                    _confirmDeletePost(cubit, post);
                    break;
                  case 2:
                    _confirmChangeStatus(cubit, post, "unavailable");
                    break;
                  case 3:
                    _confirmChangeStatus(cubit, post, "available");
                    break;
                }
              },
              itemBuilder: (BuildContext context) {
                List<PopupMenuEntry<int>> items = [
                  const PopupMenuItem<int>(value: 1, child: Text('Xóa')),
                ];
                if (post.status == 'available') {
                  items.add(const PopupMenuItem<int>(
                      value: 2,
                      child: Text('Đánh dấu hoàn thành (Unavailable)')));
                } else if (post.status == 'unavailable') {
                  items.add(const PopupMenuItem<int>(
                      value: 3, child: Text('Mở lại chiến dịch (Available)')));
                }
                return items;
              },
            ),
          ],
        ),
      ),
    );
  }

  void _confirmDeletePost(PostManagementCubit cubit, AdminPostModel post) {
    _showConfirmationDialog(
      'Xóa bài đăng',
      'Bạn có chắc chắn muốn xóa bài đăng "${post.title}" không?',
      () => cubit.deletePost(post.title),
    );
  }

  void _confirmChangeStatus(
      PostManagementCubit cubit, AdminPostModel post, String newStatus) {
    final title = newStatus == "unavailable"
        ? 'Đánh dấu hoàn thành'
        : 'Mở lại chiến dịch';
    final message = newStatus == "unavailable"
        ? 'Bạn có chắc chắn muốn chuyển trạng thái bài đăng này sang "Đã hoàn thành"?\n(Progress sẽ set về 100%)'
        : 'Bạn có chắc chắn muốn mở lại bài đăng này?\n(Progress sẽ khôi phục về trạng thái cũ)';

    _showConfirmationDialog(
      title,
      message,
      () => cubit.updatePostStatus(post.title, newStatus),
    );
  }

  void _showConfirmationDialog(
      String title, String message, VoidCallback onConfirm) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: const Text('Hủy'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
                onConfirm();
              },
              child: const Text('Xác nhận'),
            ),
          ],
        );
      },
    );
  }

  void _showSuccessDialog(String message) {
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
            // Bỏ chiều cao cố định để tránh overflow
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.check_circle_outline,
                  color: Colors.green,
                  size: 60,
                ),
                const SizedBox(height: 15),
                const Text(
                  "Thành công!",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
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
