import 'package:equatable/equatable.dart';
import 'package:tester/src/models/admin/admin_post_model.dart';

abstract class PostManagementState extends Equatable {
  const PostManagementState();

  @override
  List<Object?> get props => [];
}

class PostManagementInitial extends PostManagementState {}

class PostManagementLoading extends PostManagementState {}

class PostManagementExporting extends PostManagementState {}

class PostManagementExportSuccess extends PostManagementState {
 final String filePath;
 final String message;

 const PostManagementExportSuccess(this.filePath, this.message);

 @override
 List<Object?> get props => [filePath, message];
}

class PostManagementLoaded extends PostManagementState {
  final List<AdminPostModel> posts;
  final List<AdminPostModel> filteredPosts;
  final String searchQuery;
  final String selectedFilter;

  const PostManagementLoaded({
    required this.posts,
    required this.filteredPosts,
    this.searchQuery = '',
    this.selectedFilter = 'Tất cả',
  });

  PostManagementLoaded copyWith({
    List<AdminPostModel>? posts,
    List<AdminPostModel>? filteredPosts,
    String? searchQuery,
    String? selectedFilter,
  }) {
    return PostManagementLoaded(
      posts: posts ?? this.posts,
      filteredPosts: filteredPosts ?? this.filteredPosts,
      searchQuery: searchQuery ?? this.searchQuery,
      selectedFilter: selectedFilter ?? this.selectedFilter,
    );
  }

  @override
  List<Object?> get props =>
      [posts, filteredPosts, searchQuery, selectedFilter];
}

class PostManagementError extends PostManagementState {
  final String message;

  const PostManagementError(this.message);

  @override
  List<Object?> get props => [message];
}

class PostManagementActionSuccess extends PostManagementState {
  final String message;

  const PostManagementActionSuccess(this.message);

  @override
  List<Object?> get props => [message];
}
