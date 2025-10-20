import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/home/presentation/manager/home_cubit.dart';
import '../../../core/models/category_model.dart';
import '../manager/home_state.dart';
import '../widgets/news_card.dart';

class SourceView extends StatelessWidget {
  const SourceView({super.key, this.categoryModel});
  final CategoryModel? categoryModel;
  @override
  Widget build(BuildContext context) {
    var viewModel = context.read<HomeCubit>();
    viewModel.getSources(categoryModel!);
    return Column(
      children: [
        BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            var viewModel = BlocProvider.of<HomeCubit>(context);
            if (state is GetSourcesSuccessState) {
              viewModel.getArticles(state.sources.first);
            }
          },
          builder: (context, state) {
            print(state);
            var viewModel = context.watch<HomeCubit>();
            if (state is GetSourcesSuccessState) {
              return DefaultTabController(
                length: state.sources.length,
                initialIndex: viewModel.sourceSelectedIndex,
                child: TabBar(
                  onTap: (value) {
                    viewModel.changeSourceSelectedIndex(
                      value,
                      state.sources[value],
                    );
                  },
                  tabs: state.sources.map((e) => Tab(text: e.name)).toList(),
                  isScrollable: true,
                ),
              );
            } else if (state is GetSourcesErrorState) {
              return const Center(child: Text("Error"));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
          buildWhen: (previous, current) {
            return current is GetSourcesSuccessState ||
                current is GetSourcesErrorState ||
                current is GetSourcesLoadingState;
          },
          listenWhen: (previous, current) {
            return current is GetSourcesSuccessState ||
                current is GetSourcesErrorState ||
                current is GetSourcesLoadingState;
          },
        ),
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is GetNewsSuccessState) {
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return NewsCard(article: state.articles[index]);
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 20.h);
                    },
                    itemCount: state.articles.length,
                  ),
                ),
              );
            } else if (state is GetNewsErrorState) {
              return const Center(child: Text("Error"));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
          buildWhen: (previous, current) {
            return current is GetNewsSuccessState ||
                current is GetNewsErrorState ||
                current is GetNewsLoadingState;
          },
        ),
      ],
    );
  }
}
