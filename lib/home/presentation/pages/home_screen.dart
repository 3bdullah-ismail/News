import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/home/presentation/manager/home_cubit.dart';
import 'package:news/home/presentation/manager/home_provider.dart';
import 'package:provider/provider.dart';

import '../../../core/widgets/custom_drawer.dart';
import '../../../core/widgets/custom_search_delegate.dart';
import '../manager/home_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: Consumer<HomeProvider>(
        builder: (context, provider, child) {
          return Scaffold(
            drawer: const CustomDrawer(),
            appBar: AppBar(
              actions: [
                BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    final cubit = context.read<HomeCubit>();
                    final articles = cubit.articles;

                    return IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        if (articles.isNotEmpty) {
                          showSearch(
                            context: context,
                            delegate: CustomSearchDelegate(
                              searchList: articles,
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Please wait, loading articles..."),
                            ),
                          );
                        }
                      },
                    );
                  },
                ),
              ],
              title: Text(provider.selectedCategory?.title ?? "Home"),
            ),
            body: provider.screens[provider.categorySelectedIndex],
          );
        },
      ),
    );
  }
}
