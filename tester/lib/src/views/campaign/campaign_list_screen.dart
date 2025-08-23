import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tester/src/views/DangKyNhap.dart';
import 'package:tester/src/views/MainNguoiKK.dart';
import 'package:tester/src/views/MainNhaHT.dart';
import 'package:tester/src/views/MyNavigationBar.dart';
import 'package:tester/src/views/SharedPreferences.dart';
import 'cubit/campaign_list_cubit.dart';

class CampaignListScreen extends StatelessWidget {
  const CampaignListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CampaignListCubit()..loadCampaigns(),
      child: const _CampaignListView(),
    );
  }
}

class _CampaignListView extends StatefulWidget {
  const _CampaignListView();

  @override
  State<_CampaignListView> createState() => _CampaignListViewState();
}

class _CampaignListViewState extends State<_CampaignListView> {
  int _currentIndex = 1;
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    context.read<CampaignListCubit>().searchCampaigns(query);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Danh sách chiến dịch nổi bật",
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () async {
            bool isLoggedIn = await SharedPreferencesHelper.getLoginStatus();
            String? userType = await SharedPreferencesHelper.getUserType();

            Widget page = const Dangkynhap();

            if (isLoggedIn) {
              page = (userType == "nguoikhokhan" || userType == "045304004088")
                  ? const MainNguoiKK()
                  : const MainNguoiHT();
            }

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => page),
            );
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              controller: _searchController,
              onChanged: _onSearchChanged,
              decoration: InputDecoration(
                hintText: "Nhập tên chiến dịch",
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: SizedBox(
              height: 50,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: BlocBuilder<CampaignListCubit, CampaignListState>(
                  builder: (context, state) {
                    final cubit = context.read<CampaignListCubit>();
                    final selectedCategory = state is CampaignListLoaded
                        ? state.selectedCategory
                        : null;

                    return Row(
                      children: cubit.categories
                          .map((category) => _buildCategoryButton(
                                category,
                                selectedCategory == category,
                              ))
                          .toList(),
                    );
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<CampaignListCubit, CampaignListState>(
              builder: (context, state) {
                if (state is CampaignListLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is CampaignListError) {
                  return Center(child: Text(state.message));
                } else if (state is CampaignListLoaded) {
                  return ListView.builder(
                    itemCount: state.filteredCampaigns.length,
                    itemBuilder: (context, index) {
                      final campaign = state.filteredCampaigns[index];
                      return _buildCampaignItem(
                        campaign.imagePath,
                        campaign.title,
                        campaign.subtitle,
                        campaign.amount,
                        campaign.progress,
                      );
                    },
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: MyNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  Widget _buildCampaignItem(String imagePath, String title, String subtitle,
      String amount, int progress) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(imagePath,
                  width: 80, height: 80, fit: BoxFit.cover),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 4),
                  Text(subtitle, style: TextStyle(color: Colors.grey[600])),
                  const SizedBox(height: 4),
                  Text(amount,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.orange)),
                  const SizedBox(height: 4),
                  LinearProgressIndicator(
                    value: progress / 100,
                    backgroundColor: Colors.grey[300],
                    color: Colors.orange,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryButton(String text, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? Colors.blue : Colors.white70,
          foregroundColor: isSelected ? Colors.white : Colors.black,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        onPressed: () {
          final cubit = context.read<CampaignListCubit>();
          cubit.filterByCategory(isSelected ? null : text);
        },
        child: Text(text),
      ),
    );
  }
}
