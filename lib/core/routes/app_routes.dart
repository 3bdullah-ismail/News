import 'package:flutter/material.dart';
import 'package:news/core/routes/app_routes_names.dart';

import '../../home/presentation/pages/home_screen.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext context)> routes = {
    AppRoutesNames.homeRoute: (context) => const HomeScreen(),
  };
}
