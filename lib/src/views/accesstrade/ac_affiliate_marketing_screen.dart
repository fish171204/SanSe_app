import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repositories/accesstrade/ac_affiliate_marketing_repository.dart';
import '../../models/accesstrade/ac_affiliate_item_model.dart';
import 'cubit/ac_affilliate_marketing_cubit.dart';
import 'cubit/ac_affilliate_marketing_state.dart';

class AffiliateMarketingScreen extends StatelessWidget {
  const AffiliateMarketingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AffiliateCubit(AffiliateRepositoryImpl())..loadInitialData(),
      child: const _AffiliateMarketingScreenView(),
    );
  }
}

class _AffiliateMarketingScreenView extends StatefulWidget {
  const _AffiliateMarketingScreenView();

  @override
  State<_AffiliateMarketingScreenView> createState() =>
      _AffiliateMarketingScreenViewState();
}

class _AffiliateMarketingScreenViewState
    extends State<_AffiliateMarketingScreenView> {
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    searchController.removeListener(_onSearchChanged);
    searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    context.read<AffiliateCubit>().searchItems(searchController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Mua hàng doanh nghiệp từ thiện",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.black),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: BlocBuilder<AffiliateCubit, AffiliateState>(
        builder: (context, state) {
          if (state is AffiliateLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is AffiliateError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.message),
                  ElevatedButton(
                    onPressed: () =>
                        context.read<AffiliateCubit>().loadInitialData(),
                    child: const Text('Thử lại'),
                  ),
                ],
              ),
            );
          } else if (state is AffiliateLoaded) {
            return Row(
              children: [
                _buildCategoryPanel(state),
                _buildContentPanel(state),
              ],
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildCategoryPanel(AffiliateLoaded state) {
    return Container(
      width: 100,
      color: Colors.grey.shade200,
      child: ListView(
        children: state.categories
            .map(
                (category) => _categoryButton(category, state.selectedCategory))
            .toList(),
      ),
    );
  }

  Widget _buildContentPanel(AffiliateLoaded state) {
    return Expanded(
      child: Column(
        children: [
          _buildSearchBar(),
          _buildItemGrid(state.filteredItems),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        controller: searchController,
        decoration: InputDecoration(
          hintText: "Bạn muốn mua gì...",
          prefixIcon: const Icon(Icons.search),
          suffixIcon: const Icon(Icons.shopping_cart),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  Widget _buildItemGrid(List<AffiliateItemModel> items) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        padding: const EdgeInsets.all(16),
        children: items.map((item) => _gridItem(item)).toList(),
      ),
    );
  }

  Widget _categoryButton(String text, String selectedCategory) {
    bool isSelected = text == selectedCategory;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: TextButton(
        onPressed: () => context.read<AffiliateCubit>().selectCategory(text),
        style: TextButton.styleFrom(
          backgroundColor: isSelected ? Colors.white : Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(
                color: isSelected ? Colors.blue : Colors.transparent),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.blue : Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget _gridItem(AffiliateItemModel item) {
    return GestureDetector(
      onTap: () => context.read<AffiliateCubit>().openUrl(item.url),
      child: Column(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.network(
                item.image,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[300],
                    child: const Icon(Icons.image_not_supported),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            item.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
