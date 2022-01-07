import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/models/dto/news.dart';
import 'package:mobile/pages/detail/components/detail_news_item.dart';

class DetailNews extends StatefulWidget {
  final List<News> newsList;
  final int option;

  const DetailNews({
    Key? key,
    required this.newsList,
    required this.option,
  }) : super(key: key);

  @override
  _DetailNewsState createState() => _DetailNewsState();
}

class _DetailNewsState extends State<DetailNews> {
  late List<News> _newsList;
  late int _option;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        width: double.infinity,
        child: CupertinoSlidingSegmentedControl(
          children: {
            0: Text('날짜 우선'),
            1: Text('호재 우선'),
          },
          groupValue: _option,
          onValueChanged: (value) {
            _option = int.tryParse(value.toString())!;
            _newsOptionController(value!);
          },
        ),
      ),
      ...List.generate(
        _newsList.length,
        (index) => DetailNewsItem(news: _newsList[index]),
      )
    ]);
  }

  @override
  void initState() {
    super.initState();
    _newsList = widget.newsList;
    _option = widget.option;
  }

  void _newsOptionController(Object value) {
    setState(() {
      List<News> _goodNewsList = [];
      List<News> _basicNewsList = [];
      _newsList.forEach((news) {
        if (news.newsType == "good") {
          _goodNewsList.add(news);
        } else {
          _basicNewsList.add(news);
        }
      });
      // 0 -> good sort, 1 -> basic sort
      _newsList.clear();
      if (value == 0) {
        _newsList.addAll([..._basicNewsList, ..._goodNewsList]);
      } else {
        _newsList.addAll([..._goodNewsList, ..._basicNewsList]);
      }
    });
  }
}
