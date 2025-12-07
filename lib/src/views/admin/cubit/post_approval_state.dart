import 'package:equatable/equatable.dart';
import 'package:tester/src/models/admin/admin_post_model.dart';

abstract class PostApprovalState extends Equatable {
  const PostApprovalState();
  @override
  List<Object?> get props => [];
}

class PostApprovalInitial extends PostApprovalState {}

class PostApprovalLoading extends PostApprovalState {}

class PostApprovalLoaded extends PostApprovalState {
  final List<AdminPostModel> pendingPosts;
  final bool isFilterSpamActive;
  final Set<String> selectedPostTitles;

  const PostApprovalLoaded(this.pendingPosts,
      {this.isFilterSpamActive = false, this.selectedPostTitles = const {}});

  @override
  List<Object?> get props =>
      [pendingPosts, isFilterSpamActive, selectedPostTitles];

  PostApprovalLoaded copyWith({
    List<AdminPostModel>? pendingPosts,
    bool? isFilterSpamActive,
    Set<String>? selectedPostTitles,
  }) {
    return PostApprovalLoaded(
      pendingPosts ?? this.pendingPosts,
      isFilterSpamActive: isFilterSpamActive ?? this.isFilterSpamActive,
      selectedPostTitles: selectedPostTitles ?? this.selectedPostTitles,
    );
  }
}

class PostApprovalError extends PostApprovalState {
  final String message;
  const PostApprovalError(this.message);
  @override
  List<Object?> get props => [message];
}

class PostApprovalActionSuccess extends PostApprovalState {
  final String message;
  const PostApprovalActionSuccess(this.message);
  @override
  List<Object?> get props => [message];
}
