import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/components/share/coin_news_list_item.dart';

class DetailNews extends StatelessWidget {
  final String coinNewsTitle;
  final String coinNewsPublishDate;
  final String coinNewsTargetDate;
  final String coinNewsSource;

  const DetailNews(this.coinNewsTitle, this.coinNewsPublishDate,
      this.coinNewsTargetDate, this.coinNewsSource);

  @override
  Widget build(BuildContext context) {
    return CoinNewsListItem(
        coinNewsTitle, coinNewsPublishDate, coinNewsTargetDate, coinNewsSource);
  }
}
