class News {
  final List allNews;
  final List allSportsNews;
  final List allBusinessNews;
  final List allEntertainmentNews;
  final List allHealthNews;
  final List allScienceNews;
  final List allTechnologyNews;

  News({
    required this.allNews,
    required this.allSportsNews,
    required this.allBusinessNews,
    required this.allEntertainmentNews,
    required this.allHealthNews,
    required this.allScienceNews,
    required this.allTechnologyNews,
  });

  factory News.fromJson({required Map json}) {
    return News(
      allNews: json['articles'],
      allSportsNews: json['articles'],
      allBusinessNews: json['articles'],
      allEntertainmentNews: json['articles'],
      allHealthNews: json['articles'],
      allScienceNews: json['articles'],
      allTechnologyNews: json['articles'],
    );
  }
}
