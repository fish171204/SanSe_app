part of 'campaign_list_cubit.dart';

@immutable
abstract class CampaignListState {}

class CampaignListInitial extends CampaignListState {}

class CampaignListLoading extends CampaignListState {}

class CampaignListLoaded extends CampaignListState {
  final List<CampaignModel> campaigns;
  final List<CampaignModel> filteredCampaigns;
  final String searchQuery;
  final String? selectedCategory;

  CampaignListLoaded({
    required this.campaigns,
    required this.filteredCampaigns,
    required this.searchQuery,
    this.selectedCategory,
  });

  CampaignListLoaded copyWith({
    List<CampaignModel>? campaigns,
    List<CampaignModel>? filteredCampaigns,
    String? searchQuery,
    String? selectedCategory,
  }) {
    return CampaignListLoaded(
      campaigns: campaigns ?? this.campaigns,
      filteredCampaigns: filteredCampaigns ?? this.filteredCampaigns,
      searchQuery: searchQuery ?? this.searchQuery,
      selectedCategory: selectedCategory ?? this.selectedCategory,
    );
  }
}

class CampaignListError extends CampaignListState {
  final String message;

  CampaignListError(this.message);
}
