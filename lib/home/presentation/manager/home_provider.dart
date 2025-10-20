import 'package:flutter/material.dart';

import '../../../core/models/category_model.dart';
import '../pages/category_view.dart';
import '../pages/source_view.dart';

class HomeProvider extends ChangeNotifier {
  CategoryModel? selectedCategory;
  int categorySelectedIndex = 0;
  late List<Widget> screens = [
    CategoryView(onCategorySelected: changeSelectedCategory),
    const SourceView(),
  ];

  void changeSelectedCategory(CategoryModel category) {
    categorySelectedIndex = 1;
    selectedCategory = category;
    screens[1] = SourceView(categoryModel: category);
    notifyListeners();
  }

  void reset() {
    categorySelectedIndex = 0;
    selectedCategory = null;
    notifyListeners();
  }

  // List<Source> sources = [];
  // bool isLoading = false;
  // int sourceSelectedIndex = 0;
  // void changeSourceSelectedIndex(int index) {
  //   sourceSelectedIndex = index;
  //   getArticles(sources[index]);
  //   notifyListeners();
  // }
  //
  // Future<void> getSources(CategoryModel category) async {
  //   isLoading = true;
  //   notifyListeners();
  //   try {
  //     var data = await ApiService.getSource(category);
  //     sources = data.sources ?? [];
  //     getArticles(sources.first);
  //     notifyListeners();
  //   } catch (e) {
  //     print(e);
  //   }
  //   isLoading = false;
  //   notifyListeners();
  // }
  //
  // List<Article> articles = [];
  // Future<void> getArticles(Source source) async {
  //   isLoading = true;
  //   notifyListeners();
  //   try {
  //     var data = await ApiService.getNews(source);
  //     articles = data.articles ?? [];
  //     notifyListeners();
  //   } catch (e) {
  //     print(e);
  //   }
  //   isLoading = false;
  //   notifyListeners();
  // }

  String formatDate(String? dateStr) {
    if (dateStr == null || dateStr.isEmpty) return "";
    try {
      final date = DateTime.parse(dateStr);
      return "${date.day}/${date.month}/${date.year}";
    } catch (_) {
      return dateStr;
    }
  }
}
