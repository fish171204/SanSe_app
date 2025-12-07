import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tester/src/repositories/admin/post_management_repository.dart';
import 'post_approval_state.dart';

class PostApprovalCubit extends Cubit<PostApprovalState> {
  final PostRepositoryImpl _repository;

  PostApprovalCubit(this._repository) : super(PostApprovalInitial());

  Future<void> loadPendingPosts() async {
    try {
      emit(PostApprovalLoading());
      final posts = await _repository.getPendingPosts();
      emit(PostApprovalLoaded(posts, isFilterSpamActive: false));
    } catch (e) {
      emit(PostApprovalError('Lỗi tải danh sách: ${e.toString()}'));
    }
  }

  Future<void> toggleSpamFilter() async {
    final currentState = state;
    if (currentState is! PostApprovalLoaded) return;

    try {
      emit(PostApprovalLoading());

      if (!currentState.isFilterSpamActive) {
        final spamPosts = await _repository.getSpamPosts();
        emit(PostApprovalLoaded(spamPosts, isFilterSpamActive: true));
      } else {
        final allPosts = await _repository.getPendingPosts();
        emit(PostApprovalLoaded(allPosts, isFilterSpamActive: false));
      }
    } catch (e) {
      emit(PostApprovalError('Lỗi lọc spam: ${e.toString()}'));
    }
  }

  // --- MỚI: Chọn/Bỏ chọn một bài ---
  void togglePostSelection(String title) {
    final currentState = state;
    if (currentState is! PostApprovalLoaded) return;

    final updatedSelection = Set<String>.from(currentState.selectedPostTitles);
    if (updatedSelection.contains(title)) {
      updatedSelection.remove(title);
    } else {
      updatedSelection.add(title);
    }

    emit(currentState.copyWith(selectedPostTitles: updatedSelection));
  }

  void toggleAllSelection() {
    final currentState = state;
    if (currentState is! PostApprovalLoaded) return;

    final allUniqueTitles =
        currentState.pendingPosts.map((e) => e.title).toSet();

    final isAllSelected =
        currentState.selectedPostTitles.length == allUniqueTitles.length;

    emit(currentState.copyWith(
      selectedPostTitles: isAllSelected ? {} : allUniqueTitles,
    ));
  }

  Future<void> rejectSelectedPosts() async {
    final currentState = state;
    if (currentState is! PostApprovalLoaded) return;
    final selectedTitles = currentState.selectedPostTitles;

    if (selectedTitles.isEmpty) return;

    try {
      final postsToDelete = currentState.pendingPosts
          .where((post) => selectedTitles.contains(post.title))
          .toList();

      for (var post in postsToDelete) {
        await _repository.rejectPost(post.title);
      }

      emit(PostApprovalActionSuccess(
          "Đã từ chối ${postsToDelete.length} bài đăng."));

      await _reloadList(currentState.isFilterSpamActive);
    } catch (e) {
      emit(PostApprovalError('Lỗi xóa bài: ${e.toString()}'));
    }
  }

  Future<void> rejectPost(String title) async {
    final currentState = state;
    bool keepSpamMode = false;
    if (currentState is PostApprovalLoaded) {
      keepSpamMode = currentState.isFilterSpamActive;
    }
    try {
      await _repository.rejectPost(title);
      emit(const PostApprovalActionSuccess("Đã từ chối bài đăng."));
      await _reloadList(keepSpamMode);
    } catch (e) {
      emit(PostApprovalError('Lỗi từ chối bài: ${e.toString()}'));
    }
  }

  Future<void> approvePost(String title) async {
    final currentState = state;
    bool keepSpamMode = false;
    if (currentState is PostApprovalLoaded) {
      keepSpamMode = currentState.isFilterSpamActive;
    }
    try {
      await _repository.approvePost(title);
      emit(const PostApprovalActionSuccess("Đã duyệt bài đăng thành công!"));
      await _reloadList(keepSpamMode);
    } catch (e) {
      emit(PostApprovalError('Lỗi duyệt bài: ${e.toString()}'));
    }
  }

  Future<void> _reloadList(bool isSpamMode) async {
    try {
      if (isSpamMode) {
        final spamPosts = await _repository.getSpamPosts();
        // Reset selection về rỗng sau khi reload
        emit(PostApprovalLoaded(spamPosts,
            isFilterSpamActive: true, selectedPostTitles: const {}));
      } else {
        final allPosts = await _repository.getPendingPosts();
        emit(PostApprovalLoaded(allPosts,
            isFilterSpamActive: false, selectedPostTitles: const {}));
      }
    } catch (e) {
      emit(PostApprovalError('Lỗi tải lại danh sách: ${e.toString()}'));
    }
  }
}
