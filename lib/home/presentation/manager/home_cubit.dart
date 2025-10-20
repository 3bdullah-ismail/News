import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/models/article_response/article.dart';
import 'package:news/home/data/repositories/repo_imp.dart';

import '../../../core/models/category_model.dart';
import '../../../core/models/source_response/sources.dart';
import '../../../core/service/api_service.dart';
import '../../data/repositories/repo.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  List<Article> articles = [];
  int sourceSelectedIndex = 0;
  Repo repo = RepoImp();
  void changeSourceSelectedIndex(int index, Source source) {
    sourceSelectedIndex = index;

    getArticles(source);
  }

  Future<void> getSources(CategoryModel category) async {
    emit(GetSourcesLoadingState());
    try {
      var data = await repo.getSources(category);
      print(data);
      emit(GetSourcesSuccessState(sources: data));
    } catch (e, s) {
      print("GetSources Error: $e");
      print(s);
      emit(GetSourcesErrorState());
    }
  }

  Future<void> getArticles(Source source) async {
    emit(GetNewsLoadingState());
    try {
      var data = await repo.getNews(source);
      articles = data;
      emit(GetNewsSuccessState(articles: data));
    } catch (e) {
      emit(GetNewsErrorState());
      print(e);
    }
  }
}
