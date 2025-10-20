import 'package:http/http.dart';
import 'package:news/core/models/article_response/article.dart';

import '../../../core/models/category_model.dart';
import '../../../core/models/source_response/sources.dart';

abstract class Repo {
  Future<void> saveNews(String response);
  Future<List<Article>> getNews(Source source);
  Future<void> saveSources(String response);
  Future<List<Source>> getSources(CategoryModel categoryModel);
}
