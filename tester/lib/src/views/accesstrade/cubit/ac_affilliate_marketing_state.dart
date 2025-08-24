import 'package:equatable/equatable.dart';
import '../../../models/accesstrade/ac_affiliate_item.dart';

abstract class AffiliateState extends Equatable {
  const AffiliateState();

  @override
  List<Object?> get props => [];
}

class AffiliateInitial extends AffiliateState {}

class AffiliateLoading extends AffiliateState {}

class AffiliateLoaded extends AffiliateState {
  final List<String> categories;
  final String selectedCategory;
  final List<AffiliateItem> currentItems;
  final List<AffiliateItem> filteredItems;
  final String searchQuery;

  const AffiliateLoaded({
    required this.categories,
    required this.selectedCategory,
    required this.currentItems,
    required this.filteredItems,
    this.searchQuery = '',
  });

  AffiliateLoaded copyWith({
    List<String>? categories,
    String? selectedCategory,
    List<AffiliateItem>? currentItems,
    List<AffiliateItem>? filteredItems,
    String? searchQuery,
  }) {
    return AffiliateLoaded(
      categories: categories ?? this.categories,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      currentItems: currentItems ?? this.currentItems,
      filteredItems: filteredItems ?? this.filteredItems,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }

  @override
  List<Object?> get props => [
        categories,
        selectedCategory,
        currentItems,
        filteredItems,
        searchQuery,
      ];
}

class AffiliateError extends AffiliateState {
  final String message;

  const AffiliateError(this.message);

  @override
  List<Object?> get props => [message];
}
