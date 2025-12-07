import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repositories/admin/post_management_repository.dart';
import '../../models/admin/admin_post_model.dart';
import 'cubit/post_approval_cubit.dart';
import 'cubit/post_approval_state.dart';

class PostApprovalScreen extends StatelessWidget {
  const PostApprovalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          PostApprovalCubit(PostRepositoryImpl())..loadPendingPosts(),
      child: const _PostApprovalView(),
    );
  }
}

class _PostApprovalView extends StatefulWidget {
  const _PostApprovalView();

  @override
  State<_PostApprovalView> createState() => _PostApprovalViewState();
}

class _PostApprovalViewState extends State<_PostApprovalView> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostApprovalCubit, PostApprovalState>(
      listener: (context, state) {
        if (state is PostApprovalActionSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(state.message), backgroundColor: Colors.green),
          );
        } else if (state is PostApprovalError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message), backgroundColor: Colors.red),
          );
        }
      },
      builder: (context, state) {
        if (state is PostApprovalLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is PostApprovalLoaded) {
          return Column(
            children: [
              _buildControlBar(context, state.isFilterSpamActive),
              if (state.isFilterSpamActive && state.pendingPosts.isNotEmpty)
                _buildBulkActionBar(context, state),
              Expanded(
                child: state.pendingPosts.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.check_circle_outline,
                                size: 60, color: Colors.grey[300]),
                            const SizedBox(height: 10),
                            Text(
                              state.isFilterSpamActive
                                  ? "Không phát hiện bài đăng trùng lặp!"
                                  : "Không có bài đăng nào cần duyệt.",
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.grey),
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.all(10),
                        itemCount: state.pendingPosts.length,
                        itemBuilder: (ctx, index) {
                          final post = state.pendingPosts[index];
                          final isSelected =
                              state.selectedPostTitles.contains(post.title);

                          return _buildApprovalCard(context, post, isSelected,
                              state.isFilterSpamActive);
                        },
                      ),
              ),
            ],
          );
        } else if (state is PostApprovalError) {
          return Center(child: Text(state.message));
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildControlBar(BuildContext context, bool isFilterActive) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: Colors.grey[100],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Danh sách chờ duyệt",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          OutlinedButton.icon(
            onPressed: () {
              context.read<PostApprovalCubit>().toggleSpamFilter();
            },
            icon: Icon(
              isFilterActive ? Icons.filter_alt_off : Icons.filter_alt,
              color: isFilterActive ? Colors.white : Colors.orange,
            ),
            label: Text(
              isFilterActive ? "Tắt lọc Spam" : "Check Spam",
              style: TextStyle(
                color: isFilterActive ? Colors.white : Colors.orange,
              ),
            ),
            style: OutlinedButton.styleFrom(
              backgroundColor: isFilterActive ? Colors.orange : Colors.white,
              side: const BorderSide(color: Colors.orange),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBulkActionBar(BuildContext context, PostApprovalLoaded state) {
    final selectedCount = state.selectedPostTitles.length;

    final uniqueTitlesCount =
        state.pendingPosts.map((e) => e.title).toSet().length;

    final isAllSelected =
        selectedCount == uniqueTitlesCount && uniqueTitlesCount > 0;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      color: Colors.red[50],
      child: Row(
        children: [
          // Checkbox chọn tất cả
          Checkbox(
            value: isAllSelected,
            activeColor: Colors.red,
            onChanged: (val) {
              context.read<PostApprovalCubit>().toggleAllSelection();
            },
          ),
          const Text("Chọn tất cả",
              style: TextStyle(fontWeight: FontWeight.bold)),

          const Spacer(),

          if (selectedCount > 0)
            ElevatedButton.icon(
              onPressed: () => _confirmBulkAction(context, selectedCount),
              icon:
                  const Icon(Icons.delete_sweep, color: Colors.white, size: 20),
              label: Text("Từ chối ($selectedCount nhóm)",
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                elevation: 0,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
            ),
        ],
      ),
    );
  }

  // Card Item (Đã cập nhật để thêm Checkbox)
  Widget _buildApprovalCard(BuildContext context, AdminPostModel post,
      bool isSelected, bool isSpamMode) {
    final cubit = context.read<PostApprovalCubit>();

    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: isSelected
            ? const BorderSide(color: Colors.red, width: 1.5)
            : BorderSide.none,
      ),
      child: InkWell(
        onTap: isSpamMode ? () => cubit.togglePostSelection(post.title) : null,
        borderRadius: BorderRadius.circular(12),
        child: Column(
          children: [
            // Phần thông tin bài đăng
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (isSpamMode)
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0, top: 20),
                      child: SizedBox(
                        width: 24,
                        height: 24,
                        child: Checkbox(
                          value: isSelected,
                          activeColor: Colors.red,
                          onChanged: (val) =>
                              cubit.togglePostSelection(post.title),
                        ),
                      ),
                    ),
                  // -----------------------------------------------------

                  // Ảnh
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      post.imagePath,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        width: 80,
                        height: 80,
                        color: Colors.grey[300],
                        child: const Icon(Icons.image_not_supported),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),

                  // Nội dung text
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          post.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        const SizedBox(height: 6),
                        // Người đăng
                        Row(
                          children: [
                            const Icon(Icons.person,
                                size: 14, color: Colors.blueGrey),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                "Người đăng: ${post.senderName}",
                                style: TextStyle(
                                    fontSize: 13,
                                    color: isSpamMode
                                        ? Colors.red
                                        : Colors.blueGrey,
                                    fontWeight: FontWeight.bold),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        // Số tiền
                        Text("Số tiền: ${post.amount}",
                            style: const TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(height: 4),
                        // Thời gian
                        Row(
                          children: [
                            const Icon(Icons.access_time,
                                size: 14, color: Colors.grey),
                            const SizedBox(width: 4),
                            Text("Gửi lúc: ${post.submissionDate}",
                                style: const TextStyle(
                                    fontSize: 12, fontStyle: FontStyle.italic)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const Divider(height: 1),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton.icon(
                    onPressed: () => _confirmAction(
                        context,
                        "Từ chối bài viết",
                        "Bạn có chắc muốn từ chối bài viết này?",
                        () => cubit.rejectPost(post.title)),
                    icon: const Icon(Icons.close, color: Colors.red),
                    label: const Text("Từ chối",
                        style: TextStyle(color: Colors.red)),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.red),
                    ),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton.icon(
                    onPressed: () => _confirmAction(
                        context,
                        "Duyệt bài viết",
                        "Xác nhận duyệt bài viết này lên hệ thống?",
                        () => cubit.approvePost(post.title)),
                    icon: const Icon(Icons.check, color: Colors.white),
                    label: const Text("Duyệt bài",
                        style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _confirmAction(BuildContext context, String title, String content,
      VoidCallback onConfirm) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text("Hủy"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              onConfirm();
            },
            child: const Text("Đồng ý",
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  void _confirmBulkAction(BuildContext context, int count) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Xác nhận xóa hàng loạt"),
        content: Text(
            "Bạn có chắc chắn muốn từ chối $count bài đăng đã chọn không?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text("Hủy"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              context.read<PostApprovalCubit>().rejectSelectedPosts();
            },
            child: const Text("Xóa tất cả",
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
