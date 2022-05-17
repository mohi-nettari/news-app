import 'package:http/http.dart' as http;
import 'package:flutter_news_app/models/article_model.dart';
import 'dart:convert';

class News {
  List <Article> news = [];


  Future<void> getNews() async{
    String apiKey  = "a01aa3bc915946f98b8c251123ded47f";
    String url = "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=${apiKey}";

    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){

        if(element['urlToImage'] != null && element['description'] != null){
          Article article = new Article(
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

