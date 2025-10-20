import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/core/theme/app_colors.dart';
import 'package:news/main.dart';
import 'package:news/home/presentation/manager/home_provider.dart';
import 'package:provider/provider.dart';

import '../manager/app_provider.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    var homeProvider = context.read<HomeProvider>();
    return Drawer(
      child: Consumer<AppProvider>(
        builder: (context, provider, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 170.h,
                decoration: const BoxDecoration(color: AppColors.white),
                child: Center(
                  child: Text(
                    "News App",
                    style: context.textTheme.bodyLarge!.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: REdgeInsets.all(16.0),
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.home, color: AppColors.white),
                      title: Text(
                        "Go To Home",
                        style: context.textTheme.bodyLarge,
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        homeProvider.reset();
                      },
                    ),
                    SizedBox(height: 24.h),
                    const Divider(color: AppColors.white, thickness: 1),
                    SizedBox(height: 24.h),
                    Row(
                      children: [
                        const Icon(Icons.language),
                        SizedBox(width: 16.w),
                        Text("Language", style: context.textTheme.bodyLarge),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Container(
                      padding: REdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(color: AppColors.white),
                      ),
                      child: DropdownButton<String>(
                        value: provider.language,
                        isExpanded: true,
                        underline: const SizedBox(),
                        borderRadius: BorderRadius.circular(12.r),
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.white,
                        ),
                        style: GoogleFonts.inter(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.white,
                        ),
                        items: const [
                          DropdownMenuItem(value: "en", child: Text("English")),
                          DropdownMenuItem(value: "ar", child: Text("Arabic")),
                        ],
                        onChanged: (value) {
                          if (value != null) {
                            provider.changeLanguage(value);
                          }
                        },
                      ),
                    ),
                    SizedBox(height: 24.h),
                    const Divider(color: AppColors.white, thickness: 1),
                    SizedBox(height: 24.h),
                    Row(
                      children: [
                        const Icon(Icons.format_paint_rounded),
                        SizedBox(width: 16.w),
                        Text("Theme", style: context.textTheme.bodyLarge),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Container(
                      padding: REdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(color: AppColors.white),
                      ),
                      child: DropdownButton(
                        isExpanded: true,
                        underline: const SizedBox(),
                        borderRadius: BorderRadius.circular(12.r),
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.white,
                        ),
                        style: GoogleFonts.inter(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.white,
                        ),
                        value: provider.themeMode,
                        items: const [
                          DropdownMenuItem(
                            value: ThemeMode.light,
                            child: Text("Light"),
                          ),
                          DropdownMenuItem(
                            value: ThemeMode.dark,
                            child: Text("Dark"),
                          ),
                        ],
                        onChanged: (value) {
                          if (value != null) {
                            provider.changeThemeMode(value);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
