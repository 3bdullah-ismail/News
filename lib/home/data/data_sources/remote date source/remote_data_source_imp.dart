import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:news/core/models/category_model.dart';
import 'package:news/core/models/source_response/sources.dart';
import 'package:news/home/data/data_sources/remote%20date%20source/remote_data_source.dart';
import '../../../../core/service/api_service.dart';

class RemoteDataSourceImp implements RemoteDataSource {
  @override
  Future<Response> getSource(CategoryModel categoryModel) async {
    Uri uri = Uri.https(ApiService.baseUrl, ApiService.getSources, {
      "apiKey": ApiService.apiKey,
      "category": categoryModel.categoryName,
    });
    var response = await http.get(uri);

    return response;
  }

  @override
  Future<Response> getNews(Source source) async {
    Uri url = Uri.https(ApiService.baseUrl, ApiService.getEveryThing, {
      "apiKey": ApiService.apiKey,
      "sources": source.id,
    });
    var response = await http.get(url);
    return response;
  }
}
