import 'package:mobile/models/config/news.dart';
import 'package:mobile/models/config/price.dart';

class Calendar {
  final List<News> newsList;

  Calendar({
    required this.newsList,
  });
}

Calendar dummyCalendar = new Calendar(newsList: dummyNewsList);
