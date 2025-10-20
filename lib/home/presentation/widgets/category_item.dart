import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/main.dart';

import '../../../core/models/category_model.dart';
import '../../../core/theme/app_colors.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    bool isEven = category.id % 2 == 0;
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.r),
          child: Image.asset(category.imageDarkPath),
        ),
        Positioned(
          bottom: 10.h,
          left: isEven ? 16.w : null,
          right: isEven ? null : 16.w,
          child: Container(
            width: 170.w,
            height: 60.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(84.r),
              color: AppColors.black.withValues(alpha: 0.5),
            ),
            child: Row(
              children: [
                isEven
                    ? Container(
                        padding: REdgeInsets.all(8),
                        width: 54.w,
                        height: 54.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(84.r),
                          color: AppColors.black,
                        ),
                        child: const Icon(Icons.arrow_back_ios),
                      )
                    : const SizedBox(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("View All", style: context.textTheme.bodyLarge),
                ),
                const Spacer(),
                !isEven
                    ? Container(
                        padding: REdgeInsets.all(8),
                        width: 54.w,
                        height: 54.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(84.r),
                          color: AppColors.black,
                        ),
                        child: const Icon(Icons.arrow_forward_ios),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
