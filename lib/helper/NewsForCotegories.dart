import '../models/article_model.dart';
import 'package:flutter_news_app/models/article_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class NewsForCategorie {

  List<Article> news = [];

  Future<void> getNewsForCategory(String category) async {
    String apiKey = "a01aa3bc915946f98b8c251123ded47f";

    /*String url = "http://newsapi.org/v2/everything?q=$category&apiKey=${apiKey}";*/
    String url = "http://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=${apiKey}";

    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          Article article = Article(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publshedAt: DateTime.parse(element['publishedAt']),
            content: element["content"],
            articleUrl: element["url"],
          );
          news.add(article);
        }
      });
    }
  }
}