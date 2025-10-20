import 'package:http/http.dart';
import '../../../../core/models/category_model.dart';
import '../../../../core/models/source_response/sources.dart';

abstract class RemoteDataSource {
  Future<Response> getSource(CategoryModel categoryModel);
  Future<Response> getNews(Source source);
}
