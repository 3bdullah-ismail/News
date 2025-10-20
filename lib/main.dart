import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/news_app.dart';
import 'package:news/home/presentation/manager/home_provider.dart';
import 'package:provider/provider.dart';

import 'core/manager/app_provider.dart';
import 'home/presentation/manager/home_cubit.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppProvider()),
        ChangeNotifierProvider(create: (context) => HomeProvider()),
        BlocProvider(create: (_) => HomeCubit()),
      ],
      child: const NewsApp(),
    ),
  );
}

extension BuildContextExt on BuildContext {
  double get height => MediaQuery.of(this).size.height;

  double get width => MediaQuery.of(this).size.width;

  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => Theme.of(this).textTheme;
}
