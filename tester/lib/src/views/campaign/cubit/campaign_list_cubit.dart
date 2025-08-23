import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/campaign/campaign_model.dart';

part 'campaign_list_state.dart';

class CampaignListCubit extends Cubit<CampaignListState> {
  CampaignListCubit() : super(CampaignListInitial());

  final List<String> _categories = [
    "Xóa đói",
    "Trẻ em",
    "Người cao tuổi",
    "Người nghèo",
    "Người khuyết tật",
    "Bệnh hiểm nghèo",
    "Dân tộc thiểu số",
    "Lao động di cư",
    "Người vô gia cư",
    "Môi trường",
    "Xóa nghèo",
    "Khác",
    "Giáo dục",
    "Thiên tai",
  ];

  List<String> get categories => _categories;

  void loadCampaigns() {
    emit(CampaignListLoading());

    try {
      final campaigns = _getMockCampaigns();

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

  List<CampaignModel> _getMockCampaigns() {
    return [
      CampaignModel(
        id: "campaign_001",
        imagePath: "assets/images/chiendich1.jpg",
        title: "Hành trình nhân đạo - Lan tỏa yêu thương",
        subtitle: "1403 lượt ủng hộ • Còn lại 23 ngày",
        amount: "143.888.455 đ",
        progress: 14,
        categories: ["Khác", "Xóa nghèo"],
      ),
      CampaignModel(
        id: "campaign_002",
        imagePath: "assets/images/chiendich2.jpg",
        title: "Chung tay mang yêu thương đến cho trẻ em",
        subtitle: "453 lượt ủng hộ • Còn lại 36 ngày",
        amount: "24.211.956 đ",
        progress: 40,
        categories: ["Trẻ em"],
      ),
      CampaignModel(
        id: "campaign_003",
        imagePath: "assets/images/chiendich3.jpg",
        title: "CON ĐƯỜNG MƠ ƯỚC SỐ 3",
        subtitle: "1177 lượt ủng hộ • Còn lại 38 ngày",
        amount: "28.934.033 đ",
        progress: 36,
        categories: ["Giáo dục", "Trẻ em"],
      ),
      CampaignModel(
        id: "campaign_004",
        imagePath: "assets/images/chiendich4.jpg",
        title: "Cầu Mơ Ước số 8",
        subtitle: "192 lượt ủng hộ • Còn lại 39 ngày",
        amount: "6.471.490 đ",
        progress: 22,
        categories: ["Khác"],
      ),
      CampaignModel(
        id: "campaign_005",
        imagePath: "assets/images/chiendich5.jpg",
        title: "Dự Án Xây Cầu Tại Xã Rạch Chèo; huyện Phú Tân; Tỉnh Cà Mau",
        subtitle: "784 lượt ủng hộ • Còn lại 2 ngày",
        amount: "105.471.490 đ",
        progress: 28,
        categories: ["Khác", "Xóa nghèo"],
      ),
      CampaignModel(
        id: "campaign_006",
        imagePath: "assets/images/chiendich6.jpg",
        title: "Quỹ Yêu thương HLC",
        subtitle: "1.804 lượt ủng hộ • Còn lại 1013 ngày",
        amount: "155.551.490 đ",
        progress: 44,
        categories: ["Khác", "Bệnh hiểm nghèo"],
      ),
      CampaignModel(
        id: "campaign_007",
        imagePath: "assets/images/chiendich7.jpg",
        title: "Dự Án Hiện Thực Hoá Ước Mơ...",
        subtitle: "656 lượt ủng hộ • Còn lại 7 ngày",
        amount: "24.136.620 đ",
        progress: 32,
        categories: ["Trẻ em", "Giáo dục"],
      ),
      CampaignModel(
        id: "campaign_008",
        imagePath: "assets/images/chiendich8.jpg",
        title: "Lời khẩn cầu của một người mẹ...",
        subtitle: "191 lượt ủng hộ • Còn lại 6 ngày",
        amount: "6.471.222 đ",
        progress: 59,
        categories: ["Bệnh hiểm nghèo", "Người nghèo"],
      ),
      CampaignModel(
        id: "campaign_009",
        imagePath: "assets/images/chiendich9.jpg",
        title: "Dự án cúng dường đại hồng...",
        subtitle: "2.517 lượt ủng hộ • Còn lại 29 ngày",
        amount: "73.397.490 đ",
        progress: 12,
        categories: ["Khác"],
      ),
      CampaignModel(
        id: "campaign_010",
        imagePath: "assets/images/chiendich10.jpg",
        title: "Dự án kêu gọi quỹ Mixed Nuts",
        subtitle: "4.623 lượt ủng hộ • Còn lại 24 ngày",
        amount: "160.020.490 đ",
        progress: 39,
        categories: ["Xóa đói", "Người nghèo"],
      ),
    ];
  }
}
