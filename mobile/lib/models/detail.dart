import 'package:mobile/models/summary.dart';
import 'package:mobile/models/config/news.dart';
import 'package:mobile/models/config/price.dart';

class Detail {
  final Summary summary;
  final List<Price> priceList;
  final List<News> newsList;

  Detail({
    required this.summary,
    required this.priceList,
    required this.newsList,
  });
}

Detail dummyDetail = Detail(
  summary: summaryList[0],
  priceList: dummyPriceList,
  newsList: dummyNewsList,
);
