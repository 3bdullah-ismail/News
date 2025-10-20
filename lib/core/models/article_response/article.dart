import '../source_response/sources.dart';

/// source : {"id":null,"name":"Gizmodo.com"}
/// author : "Bruce Gil"
/// title : "Dogecoin Has Made It to Wall Street"
/// description : "The first memecoin ETFs have hit the stock market, legitimizing the once too-online digital currency."
/// url : "https://gizmodo.com/dogecoin-has-made-it-to-wall-street-2000663698"
/// urlToImage : "https://gizmodo.com/app/uploads/2023/06/4b1fc4c2df74bfac346230a21592d2ef.jpg"
/// publishedAt : "2025-09-25T15:40:25Z"
/// content : "Are meme coins a legitimate investment now? Well, Wall Street seems to think so. Last week, REX Financial and Osprey Funds launched the first Dogecoin exchange-traded fund (ETF).\r\nBasically, an ETF i… [+3310 chars]"

class Article {
  Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  Article.fromJson(dynamic json) {
    source = json['source'] != null ? Source.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }

  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (source != null) {
      map['source'] = source?.toJson();
    }
    map['author'] = author;
    map['title'] = title;
    map['description'] = description;
    map['url'] = url;
    map['urlToImage'] = urlToImage;
    map['publishedAt'] = publishedAt;
    map['content'] = content;
    return map;
  }
}
