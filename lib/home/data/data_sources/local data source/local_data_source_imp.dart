import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'local_data_source.dart';

class LocalDataSourceImp implements LocalDataSource {
  Future<BoxCollection> _initHive() async {
    var path = await getApplicationCacheDirectory();
    final collection = await BoxCollection.open('News', {
      "news",
      "source",
    }, path: path.path);
    return collection;
  }

  @override
  Future<String?> getNews() async {
    var collection = await _initHive();
    var box = await collection.openBox<String>("news");
    var data = await box.get("news_list");
    collection.close();
    return data;
  }

  @override
  Future<void> saveNews(String article) async {
    var collection = await _initHive();
    var box = await collection.openBox<String>("news");
    await box.put("news_list", article);
    collection.close();
  }

  @override
  Future<String?> getSources() async {
    var collection = await _initHive();
    var box = await collection.openBox<String>("source");
    var data = await box.get("sources_list");
    collection.close();
    return data;
  }

  @override
  Future<void> saveSources(String source) async {
    var collection = await _initHive();
    var box = await collection.openBox<String>("source");
    await box.put("sources_list", source);
    collection.close();
  }
}
