import '../../../core/models/article_response/article.dart';
import '../../../core/models/source_response/sources.dart';

sealed class HomeState {}

class HomeInitial extends HomeState {}

class GetNewsLoadingState extends HomeState {}

class GetNewsSuccessState extends HomeState {
  List<Article> articles;
  GetNewsSuccessState({required this.articles});
}

class GetNewsErrorState extends HomeState {}

class GetSourcesLoadingState extends HomeState {}

class GetSourcesSuccessState extends HomeState {
  final List<Source> sources;
  GetSourcesSuccessState({required this.sources});
}

class GetSourcesErrorState extends HomeState {}
