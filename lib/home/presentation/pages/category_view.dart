import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/main.dart';

import '../../../core/models/category_model.dart';
import '../widgets/category_item.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.onCategorySelected});

  final Function(CategoryModel) onCategorySelected;

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories = CategoryModel.categories;
    return Padding(
      padding: REdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            "Good Morning Here is Some News For You",
            style: context.textTheme.bodyLarge,
          ),
          SizedBox(height: 16.h),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    onCategorySelected(CategoryModel.categories[index]);
                  },
                  child: CategoryItem(category: categories[index]),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 24.h);
              },
              itemCount: categories.length,
            ),
          ),
        ],
      ),
    );
  }
}
