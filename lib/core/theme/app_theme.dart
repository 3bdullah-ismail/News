import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/core/theme/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(brightness: Brightness.light);
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    iconTheme: const IconThemeData(color: AppColors.white),
    scaffoldBackgroundColor: AppColors.black,
    drawerTheme: DrawerThemeData(
      backgroundColor: AppColors.black,
      width: 270.w,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.black,
      centerTitle: true,

      titleTextStyle: GoogleFonts.inter(
        color: AppColors.white,
        fontSize: 20.sp,
        fontWeight: FontWeight.w500,
      ),
    ),
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.inter(
        color: AppColors.white,
        fontSize: 24.sp,
        fontWeight: FontWeight.w700,
      ),
      bodyMedium: GoogleFonts.inter(
        color: AppColors.white,
        fontSize: 16.sp,
        fontWeight: FontWeight.w700,
      ),
      bodySmall: GoogleFonts.inter(
        color: AppColors.white,
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
      ),
    ),
    tabBarTheme: TabBarThemeData(
      tabAlignment: TabAlignment.start,

      indicatorColor: AppColors.white,
      labelStyle: GoogleFonts.inter(
        fontWeight: FontWeight.w700,
        fontSize: 16.sp,
      ),
      labelColor: AppColors.white,
      unselectedLabelStyle: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      unselectedLabelColor: AppColors.white,
      dividerColor: Colors.transparent,
    ),
  );
}
