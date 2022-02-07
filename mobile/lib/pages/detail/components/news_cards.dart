import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mobile/models/dto/news.dart';
import 'package:mobile/pages/detail/controllers/detail_controller.dart';
import 'package:mobile/utils/coryn_size.dart';
import 'package:mobile/utils/coryn_text_style.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsCards extends StatelessWidget {
  const NewsCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailController>(
      builder: (_) => _.goodNewsList.length == 0
          ? Center(
              child:
                  Text("등록된 일정이 없습니다.", style: CorynTextStyle.largeTextStyle))
          : ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.zero,
              children: _.goodNewsList.map((goodNews) {
                return NewsCard(goodNews);
              }).toList(),
            ),
    );
  }

  Widget NewsCard(News news) {
    return GestureDetector(
      onTap: () => _launchURL(news.url),
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: CorynSize.contextVertical),
        child: Center(
          child: Container(
            width: 140,
            height: 110,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(15)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: CorynSize.componentVertical,
                ),
                Text(
                  news.targetingDate!.year.toString().replaceRange(0, 2, "") +
                      "년" +
                      news.targetingDate!.month.toString().padLeft(2, '0') +
                      "월" +
                      news.targetingDate!.day.toString().padLeft(2, '0') +
                      "일",
                  style: CorynTextStyle.smallBoldTextStyle,
                ),
                SizedBox(height: CorynSize.componentVertical),
                Text(
                  truncate(news.title),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: CorynTextStyle.smallBoldTextStyle,
                ),
                SizedBox(height: CorynSize.componentVertical),
                Text(dday(news.targetingDate!),
                    style: CorynTextStyle.xLargeBoldTextStyle),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String dday(DateTime date) {
    int day = DateTime.now().difference(date).inDays;
    String np = "";

    if (day > 0) {
      np = "+";
    } else if (day == 0) {
      np = "-";
    }

    return "D" + np + day.toString();
  }

  String truncate(String text, {length: 12, omission: '...'}) {
    if (length >= text.length) {
      return text;
    }
    return text.replaceRange(length, text.length, omission);
  }

  void _launchURL(_url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }
}
