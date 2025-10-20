import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/main.dart';
import 'package:provider/provider.dart';

import 'core/manager/app_provider.dart';
import 'core/routes/app_routes.dart';
import 'core/routes/app_routes_names.dart';
import 'core/theme/app_theme.dart';

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    var appProvider = Provider.of<AppProvider>(context);
    return ScreenUtilInit(
      designSize: Size(context.width, context.height),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: appProvider.themeMode,
        initialRoute: AppRoutesNames.homeRoute,
        routes: AppRoutes.routes,
      ),
    );
  }
}
