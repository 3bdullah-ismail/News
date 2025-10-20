// import 'dart:convert';
//
// import 'package:http/http.dart' as http;
// import 'package:news/core/models/article_response/article_response.dart';
//
// import '../models/category_model.dart';
// import '../models/source_response/source_response.dart';
// import '../models/source_response/sources.dart';

class ApiService {
  static const String baseUrl = "newsapi.org";
  static const String apiKey = "9cd6d0587c78416ca1e2a245298c3dba";
  static const String getEveryThing = "/v2/everything";
  static const String getSources = "/v2/top-headlines/sources";

  // static Future<SourceResponse> getSource(CategoryModel categoryModel) async {
  //   try {
  //     Uri uri = Uri.https(baseUrl, getSources, {
  //       "apiKey": apiKey,
  //       "category": categoryModel.categoryName,
  //     });
  //     var response = await http.get(uri);
  //     if (response.statusCode == 200) {
  //       var json = jsonDecode(response.body);
  //       SourceResponse sourceResponse = SourceResponse.fromJson(json);
  //       return sourceResponse;
  //     } else {
  //       throw response.body;
  //     }
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  //
  // static Future<ArticlesResponse> getNews(Source source) async {
  //   Uri url = Uri.https(baseUrl, getEveryThing, {
  //     "apiKey": apiKey,
  //     "sources": source.id,
  //   });
  //   var response = await http.get(url);
  //   var json = jsonDecode(response.body);
  //   ArticlesResponse articlesResponse = ArticlesResponse.fromJson(json);
  //   return articlesResponse;
  // }
}
