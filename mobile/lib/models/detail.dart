import 'package:mobile/models/summary.dart';
import 'package:mobile/models/news.dart';
import 'package:mobile/models/price.dart';

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

Detail bitcoinDetail = Detail(
  summary: summaryList[0],
  priceList: bitcoinPriceList,
  newsList: bitcoinNewsList,
);
