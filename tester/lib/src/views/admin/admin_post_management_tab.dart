import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tester/src/repositories/admin/post_management_repository.dart';
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
    context.read<PostManagementCubit>().searchPosts(_searchController.text);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostManagementCubit, PostManagementState>(
      listener: (context, state) {
        if (state is PostManagementActionSuccess) {
          _showSuccessDialog(state.message);
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
          return _buildPostList(state);
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
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildPostList(PostManagementLoaded state) {
    return Scaffold(
      body: Column(
        children: [
          _buildSearchBar(),
          _buildFilterSection(state),
          Expanded(
            child: ListView(
              children: state.filteredPosts
                  .map((post) => _buildPostItem(post))
                  .toList(),
            ),
          ),
        ],
      ),
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

  Widget _buildFilterSection(PostManagementLoaded state) {
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

  Widget _buildPostItem(AdminPostModel post) {
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
                  ),
                  const SizedBox(height: 4),
                  Text(
                    post.subtitle,
                    style: TextStyle(color: Colors.grey[600]),
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
                    _confirmDeletePost(post);
                    break;
                  case 2:
                    _confirmChangeStatus(post, "unavailable");
                    break;
                  case 3:
                    _confirmChangeStatus(post, "available");
                    break;
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
                const PopupMenuItem<int>(value: 1, child: Text('Xóa')),
                const PopupMenuItem<int>(value: 2, child: Text('Unavailable')),
                const PopupMenuItem<int>(value: 3, child: Text('Available')),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _confirmDeletePost(AdminPostModel post) {
    _showConfirmationDialog(
      'Xóa bài đăng',
      'Bạn có chắc chắn muốn xóa bài đăng này?',
      () => context.read<PostManagementCubit>().deletePost(post.title),
    );
  }

  void _confirmChangeStatus(AdminPostModel post, String newStatus) {
    final title = newStatus == "unavailable"
        ? 'Chuyển sang Unavailable'
        : 'Chuyển sang Available';
    final message = newStatus == "unavailable"
        ? 'Bạn có chắc chắn muốn chuyển trạng thái bài đăng này sang Unavailable (Đã hoàn thành)?'
        : 'Bạn có chắc chắn muốn chuyển trạng thái bài đăng này sang Available (Chưa hoàn thành)?';

    _showConfirmationDialog(
      title,
      message,
      () => context
          .read<PostManagementCubit>()
          .updatePostStatus(post.title, newStatus),
    );
  }

  void _showConfirmationDialog(
      String title, String message, VoidCallback onConfirm) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Hủy'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
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
                const Text(
                  "Thành công!",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  message,
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
