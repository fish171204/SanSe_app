import 'package:tester/src/models/accesstrade/ac_affiliate_item.dart';

import '../../models/accesstrade/ac_category_data.dart';

abstract class AffiliateRepository {
  Future<List<String>> getCategories();
  Future<List<AffiliateItem>> getItemsByCategory(String category);
  Future<List<AffiliateItem>> searchItems(String query, String category);
}

class AffiliateRepositoryImpl implements AffiliateRepository {
  @override
  Future<List<String>> getCategories() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 50));
    return categoryData.keys.toList();
  }

  @override
  Future<List<AffiliateItem>> getItemsByCategory(String category) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 50));

    final items = categoryData[category] ?? [];
    return items.map((item) => AffiliateItem.fromMap(item)).toList();
  }

  @override
  Future<List<AffiliateItem>> searchItems(String query, String category) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 50));

    final items = await getItemsByCategory(category);
    if (query.isEmpty) return items;

    return items
        .where((item) => item.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
