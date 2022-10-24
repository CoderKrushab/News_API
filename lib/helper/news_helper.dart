import 'dart:convert';
import 'package:http/http.dart' as http;

import '../modal/news_modals.dart';

//      All Headlines News Data---------------------------------
class NewsHelper {
  NewsHelper._();
  static final NewsHelper newsHelper = NewsHelper._();
  final String URL =
      "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=eebffcef829e4dcdb6ea891fb15b6122";
  Future<News?> fetchAllNewsData() async {
    http.Response res = await http.get(Uri.parse(URL));
    if (res.statusCode == 200) {
      Map decodeData = jsonDecode(res.body);
      News? news = News.fromJson(json: decodeData);
      return news;
    }
    return null;
  }

//      All Sports News Data---------------------------------
  final String SPORTURL =
      "https://newsapi.org/v2/top-headlines?country=in&category=sports&apiKey=eebffcef829e4dcdb6ea891fb15b6122";
  Future<News?> fetchAllSportsNewsData() async {
    http.Response res = await http.get(Uri.parse(SPORTURL));
    if (res.statusCode == 200) {
      Map decodeData = jsonDecode(res.body);
      News? news = News.fromJson(json: decodeData);
      return news;
    }
    return null;
  }

  //      All Sports News Data---------------------------------
  final String BUSINESSURL =
      "https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=eebffcef829e4dcdb6ea891fb15b6122";
  Future<News?> fetchAllBusinessNewsData() async {
    http.Response res = await http.get(Uri.parse(BUSINESSURL));
    if (res.statusCode == 200) {
      Map decodeData = jsonDecode(res.body);
      News? news = News.fromJson(json: decodeData);
      return news;
    }
    return null;
  }

  //      All Entertainment News Data---------------------------------
  final String ENTERTAINMENTURL =
      "https://newsapi.org/v2/top-headlines?country=in&category=entertainment&apiKey=eebffcef829e4dcdb6ea891fb15b6122";
  Future<News?> fetchAllEntertainNewsData() async {
    http.Response res = await http.get(Uri.parse(ENTERTAINMENTURL));
    if (res.statusCode == 200) {
      Map decodeData = jsonDecode(res.body);
      News? news = News.fromJson(json: decodeData);
      return news;
    }
    return null;
  }

  //      All Science News Data---------------------------------
  final String SCIENCEURL =
      "https://newsapi.org/v2/top-headlines?country=in&category=science&apiKey=eebffcef829e4dcdb6ea891fb15b6122";
  Future<News?> fetchAllScienceNewsData() async {
    http.Response res = await http.get(Uri.parse(SCIENCEURL));
    if (res.statusCode == 200) {
      Map decodeData = jsonDecode(res.body);
      News? news = News.fromJson(json: decodeData);
      return news;
    }
    return null;
  }

  //      All Health News Data---------------------------------
  final String HEALTHURL =
      "https://newsapi.org/v2/top-headlines?country=in&category=health&apiKey=eebffcef829e4dcdb6ea891fb15b6122";
  Future<News?> fetchAllHealthNewsData() async {
    http.Response res = await http.get(Uri.parse(HEALTHURL));
    if (res.statusCode == 200) {
      Map decodeData = jsonDecode(res.body);
      News? news = News.fromJson(json: decodeData);
      return news;
    }
    return null;
  }

  //      All Technology News Data---------------------------------
  final String TECHNOLOGYURL =
      "https://newsapi.org/v2/top-headlines?country=in&category=technology&apiKey=eebffcef829e4dcdb6ea891fb15b6122";
  Future<News?> fetchAllTechnologyNewsData() async {
    http.Response res = await http.get(Uri.parse(TECHNOLOGYURL));
    if (res.statusCode == 200) {
      Map decodeData = jsonDecode(res.body);
      News? news = News.fromJson(json: decodeData);
      return news;
    }
    return null;
  }
}
