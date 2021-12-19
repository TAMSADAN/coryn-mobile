import 'package:mobile/models/summary.dart';
import 'package:mobile/models/news.dart';

class Detail {
  final Summary summary;
  final List<double> openList;
  final List<News> newsList;

  Detail({
    required this.summary,
    required this.openList,
    required this.newsList,
  });
}

Detail bitcoinDetail = Detail(
  summary: summaryList[0],
  openList: [0, 0, 0, 0, 0],
  newsList: bitcoinNewsList,
);
