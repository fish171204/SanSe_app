import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../repositories/admin/post_management_repository.dart';
import 'post_management_state.dart';

class PostManagementCubit extends Cubit<PostManagementState> {
  final PostRepository _repository;

  PostManagementCubit(this._repository) : super(PostManagementInitial());

  Future<void> loadPosts() async {
    try {
      emit(PostManagementLoading());

      final posts = await _repository.getAllPosts();

      emit(PostManagementLoaded(
        posts: posts,
        filteredPosts: posts,
      ));
    } catch (e) {
      emit(PostManagementError(
          'Không thể tải danh sách bài đăng: ${e.toString()}'));
    }
  }

  Future<void> searchPosts(String query) async {
    final currentState = state;
    if (currentState is! PostManagementLoaded) return;

    try {
      final searchResults = await _repository.searchPosts(query);
      final filteredByStatus =
          await _repository.getFilteredPosts(currentState.selectedFilter);

      // Apply both search and status filter
      final finalResults = query.isEmpty
          ? filteredByStatus
          : searchResults.where((post) {
              switch (currentState.selectedFilter) {
                case "Chưa hoàn thành":
                  return post.progress < 100;
                case "Đã hoàn thành":
                  return post.progress == 100;
                default:
                  return true;
              }
            }).toList();

      emit(currentState.copyWith(
        filteredPosts: finalResults,
        searchQuery: query,
      ));
    } catch (e) {
      emit(PostManagementError('Không thể tìm kiếm bài đăng: ${e.toString()}'));
    }
  }

  Future<void> filterPosts(String filter) async {
    final currentState = state;
    if (currentState is! PostManagementLoaded) return;

    try {
      final filteredPosts = await _repository.getFilteredPosts(filter);

      // Apply search filter if exists
      final finalResults = currentState.searchQuery.isEmpty
          ? filteredPosts
          : filteredPosts.where((post) {
              return post.title.toLowerCase().contains(
                    currentState.searchQuery.toLowerCase(),
                  );
            }).toList();

      emit(currentState.copyWith(
        filteredPosts: finalResults,
        selectedFilter: filter,
      ));
    } catch (e) {
      emit(PostManagementError('Không thể lọc bài đăng: ${e.toString()}'));
    }
  }

  Future<void> deletePost(String title) async {
    final currentState = state;
    if (currentState is! PostManagementLoaded) return;

    try {
      await _repository.deletePost(title);

      // Reload posts after deletion
      await _refreshPosts();

      emit(const PostManagementActionSuccess('Xóa bài đăng thành công!'));

      // Return to loaded state
      await _refreshPosts();
    } catch (e) {
      emit(PostManagementError('Không thể xóa bài đăng: ${e.toString()}'));
    }
  }

  Future<void> updatePostStatus(String title, String newStatus) async {
    final currentState = state;
    if (currentState is! PostManagementLoaded) return;

    try {
      await _repository.updatePostStatus(title, newStatus);

      // Reload posts after status change
      await _refreshPosts();

      final statusMessage = newStatus == "unavailable"
          ? 'Chuyển trạng thái sang Unavailable thành công!'
          : 'Chuyển trạng thái sang Available thành công!';

      emit(PostManagementActionSuccess(statusMessage));

      // Return to loaded state
      await _refreshPosts();
    } catch (e) {
      emit(PostManagementError(
          'Không thể cập nhật trạng thái bài đăng: ${e.toString()}'));
    }
  }

  Future<void> _refreshPosts() async {
    final currentState = state;
    if (currentState is! PostManagementLoaded) return;

    try {
      final posts = await _repository.getAllPosts();
      final filteredPosts =
          await _repository.getFilteredPosts(currentState.selectedFilter);

      // Apply search filter if exists
      final finalResults = currentState.searchQuery.isEmpty
          ? filteredPosts
          : filteredPosts.where((post) {
              return post.title.toLowerCase().contains(
                    currentState.searchQuery.toLowerCase(),
                  );
            }).toList();

      emit(currentState.copyWith(
        posts: posts,
        filteredPosts: finalResults,
      ));
    } catch (e) {
      emit(PostManagementError(
          'Không thể tải lại danh sách bài đăng: ${e.toString()}'));
    }
  }
}
