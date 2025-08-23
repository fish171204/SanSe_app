import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/campaign/campaign_model.dart';
import '../../../repositories/campaign/campaign_repository.dart';

part 'campaign_list_state.dart';

class CampaignListCubit extends Cubit<CampaignListState> {
  final CampaignRepository _repository;

  CampaignListCubit(this._repository) : super(CampaignListInitial());

  List<String> _categories = [];
  List<String> get categories => _categories;

  Future<void> loadCampaigns() async {
    emit(CampaignListLoading());

    try {
      // Load categories and campaigns concurrently
      final results = await Future.wait([
        _repository.getCategories(),
        _repository.getCampaigns(),
      ]);

      _categories = results[0] as List<String>;
      final campaigns = results[1] as List<CampaignModel>;

      emit(CampaignListLoaded(
        campaigns: campaigns,
        filteredCampaigns: campaigns,
        searchQuery: '',
      ));
    } catch (e) {
      emit(CampaignListError('Không thể tải danh sách chiến dịch: $e'));
    }
  }

  void searchCampaigns(String query) {
    if (state is CampaignListLoaded) {
      final currentState = state as CampaignListLoaded;
      final filteredCampaigns = _filterCampaigns(
        currentState.campaigns,
        query,
        currentState.selectedCategory,
      );

      emit(currentState.copyWith(
        searchQuery: query,
        filteredCampaigns: filteredCampaigns,
      ));
    }
  }

  void filterByCategory(String? category) {
    if (state is CampaignListLoaded) {
      final currentState = state as CampaignListLoaded;
      final filteredCampaigns = _filterCampaigns(
        currentState.campaigns,
        currentState.searchQuery,
        category,
      );

      emit(currentState.copyWith(
        selectedCategory: category,
        filteredCampaigns: filteredCampaigns,
      ));
    }
  }

  List<CampaignModel> _filterCampaigns(
    List<CampaignModel> campaigns,
    String searchQuery,
    String? category,
  ) {
    return campaigns.where((campaign) {
      final matchesSearch =
          campaign.title.toLowerCase().contains(searchQuery.toLowerCase());

      final matchesCategory =
          category == null || campaign.categories.contains(category);

      return matchesSearch && matchesCategory;
    }).toList();
  }
}
