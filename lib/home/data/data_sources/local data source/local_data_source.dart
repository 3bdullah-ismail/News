abstract class LocalDataSource {
  Future<void> saveNews(String article);
  Future<String?> getNews();
  Future<void> saveSources(String article);
  Future<String?> getSources();
}
