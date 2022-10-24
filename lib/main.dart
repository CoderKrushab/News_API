import 'package:flutter/material.dart';
import 'package:news_app/category%20of%20news/business_news.dart';
import 'package:news_app/category%20of%20news/health_news.dart';
import 'package:news_app/screens/detail.dart';

import 'category of news/entertainment_news.dart';
import 'category of news/science_news.dart';
import 'category of news/sport_news.dart';
import 'category of news/technology_news.dart';
import 'components/splash_screen.dart';
import 'screens/homepage.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        'homepage': (context) => const HomePage(),
        'detail': (context) => const DetailPage(),
        'sport': (context) => const SportNews(),
        'business': (context) => const BusinessNews(),
        'entertainment': (context) => const EntertainmentNews(),
        'health': (context) => const HealthNews(),
        'science': (context) => const ScienceNews(),
        'technology': (context) => const TechnologyNews(),
      },
    ),
  );
}
