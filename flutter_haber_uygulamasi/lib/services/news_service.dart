import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_haber_uygulamasi/models/articles.dart';
import 'package:flutter_haber_uygulamasi/models/news.dart';
import 'package:http/http.dart' as http;

String kProdUrl = "https://newsapi.org/v2/top-headlines";
String kTestUrl = "https://newsapi.org/v2/top-headlines";

String kBaseUrl = kDebugMode ? kTestUrl : kProdUrl;
class NewsService {
  Future<List<Articles>> fetchNews(String category) async {
    String url =
        '$kBaseUrl?country=us&category=$category&apiKey=6dc71cc1fcb9403eaf51703119a57222';
    Uri uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      News news = News.fromJson(result);
      return news.articles ?? [];
    }
    throw Exception('Bad Request');
  }
}