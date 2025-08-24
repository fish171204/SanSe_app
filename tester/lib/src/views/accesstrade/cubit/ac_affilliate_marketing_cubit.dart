import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../repositories/accesstrade/ac_affiliate_marketing_repository.dart';
import 'ac_affilliate_marketing_state.dart';

class AffiliateCubit extends Cubit<AffiliateState> {
  final AffiliateRepository _repository;

  AffiliateCubit(this._repository) : super(AffiliateInitial());

  Future<void> loadInitialData() async {
    try {
      emit(AffiliateLoading());

      final categories = await _repository.getCategories();
      final defaultCategory =
          categories.isNotEmpty ? categories.first : "Đồ uống";
      final items = await _repository.getItemsByCategory(defaultCategory);

      emit(AffiliateLoaded(
        categories: categories,
        selectedCategory: defaultCategory,
        currentItems: items,
        filteredItems: items,
      ));
    } catch (e) {
      emit(AffiliateError('Không thể tải dữ liệu: ${e.toString()}'));
    }
  }

  Future<void> selectCategory(String category) async {
    final currentState = state;
    if (currentState is! AffiliateLoaded) return;

    try {
      emit(AffiliateLoading());

      final items = await _repository.getItemsByCategory(category);
      final filteredItems = currentState.searchQuery.isEmpty
          ? items
          : await _repository.searchItems(currentState.searchQuery, category);

      emit(currentState.copyWith(
        selectedCategory: category,
        currentItems: items,
        filteredItems: filteredItems,
      ));
    } catch (e) {
      emit(AffiliateError('Không thể tải danh mục: ${e.toString()}'));
    }
  }

  Future<void> searchItems(String query) async {
    final currentState = state;
    if (currentState is! AffiliateLoaded) return;

    try {
      final filteredItems = await _repository.searchItems(
        query,
        currentState.selectedCategory,
      );

      emit(currentState.copyWith(
        filteredItems: filteredItems,
        searchQuery: query,
      ));
    } catch (e) {
      emit(AffiliateError('Không thể tìm kiếm: ${e.toString()}'));
    }
  }

  Future<void> openUrl(String? url) async {
    if (url == null || url.isEmpty) return;

    try {
      // ignore: deprecated_member_use
      await launch(url);
    } catch (e) {
      emit(AffiliateError('Không thể mở liên kết: ${e.toString()}'));
    }
  }
}
