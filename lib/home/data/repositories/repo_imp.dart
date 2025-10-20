import 'dart:convert';

import 'package:http/http.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:news/core/models/article_response/article.dart';
import 'package:news/core/models/article_response/article_response.dart';
import 'package:news/core/models/category_model.dart';
import 'package:news/core/models/source_response/source_response.dart';
import 'package:news/home/data/data_sources/local%20data%20source/local_data_source.dart';
import 'package:news/home/data/data_sources/local%20data%20source/local_data_source_imp.dart';
import 'package:news/home/data/data_sources/remote%20date%20source/remote_data_source.dart';
import 'package:news/home/data/repositories/repo.dart';

import '../../../core/models/source_response/sources.dart';
import '../data_sources/remote date source/remote_data_source_imp.dart';

class RepoImp implements Repo {
  late RemoteDataSource remoteDataSource = RemoteDataSourceImp();
  late LocalDataSource localDataSource = LocalDataSourceImp();
  @override
  Future<List<Article>> getNews(Source source) async {
    final bool isConnected =
        await InternetConnectionChecker.instance.hasConnection;
    if (isConnected) {
      var response = await remoteDataSource.getNews(source);
      if (response.statusCode == 200) {
        await saveNews(response.body);
        var json = jsonDecode(response.body);
        ArticlesResponse articlesResponse = ArticlesResponse.fromJson(json);
        return articlesResponse.articles ?? [];
      } else {
        throw response.body;
      }
    } else {
      var response = await localDataSource.getNews();
      if (response != null) {
        var json = jsonDecode(response);
        ArticlesResponse articlesResponse = ArticlesResponse.fromJson(json);
        return articlesResponse.articles ?? [];
      }
      return [];
    }
  }

  @override
  Future<void> saveNews(String response) async {
    await localDataSource.saveNews(response);
  }

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
  @override
  Future<List<Source>> getSources(CategoryModel categoryModel) async {
    final bool isConnected =
        await InternetConnectionChecker.instance.hasConnection;
    if (isConnected) {
      var response = await remoteDataSource.getSource(categoryModel);
      print("🟢 Response received with status ${response.statusCode}");
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        SourceResponse sourceResponse = SourceResponse.fromJson(json);
        return sourceResponse.sources ?? [];
      } else {
        throw response.body;
      }
    } else {
      var response = await localDataSource.getSources();
      if (response != null) {
        var json = jsonDecode(response);
        var sourceResponse = SourceResponse.fromJson(json);
        return sourceResponse.sources ?? [];
      }
      return [];
    }
  }

  @override
  Future<void> saveSources(String response) async {
    await localDataSource.saveSources(response);
  }
}
