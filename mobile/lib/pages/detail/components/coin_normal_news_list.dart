import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mobile/models/dto/news.dart';
import 'package:mobile/pages/detail/controllers/detail_controller.dart';
import 'package:mobile/utils/coryn_size.dart';
import 'package:mobile/utils/coryn_text_style.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsItems extends StatelessWidget {
  const NewsItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailController>(
      builder: (_) => _.fetchingNews
          ? const Center(child: CupertinoActivityIndicator())
          : _.normalNewsList.isEmpty
              ? const Center(
                  child: Text("등록된 일정이 없습니다.",
                      style: CorynTextStyle.largeTextStyle),
                )
              : Column(
                  children: _.normalNewsList.map(
                    (normalNews) {
                      return NewsItem(normalNews);
                    },
                  ).toList(),
                ),
    );
  }

  Widget NewsItem(News news) {
    return GestureDetector(
      onTap: () => _launchURL(news.url),
      child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: CorynSize.contextVertical),
        child: Center(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 260,
                                child: Text(
                                  truncate(news.title),
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Text(
                                "생성일 : ${news.postedDate != null ? news.getStringFromDatetime(news.postedDate!) : ""} ${news.targetingDate != null ? "타겟일 :" + news.getStringFromDatetime(news.targetingDate!) : ""}",
                                style: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54,
                                ),
                              ),
                              Text(
                                "출처 : ${news.source}",
                                style: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 0),
                      child: Icon(CupertinoIcons.forward),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }

  String truncate(String text, {length: 23, omission: '...'}) {
    if (length >= text.length) {
      return text;
    }
    return text.replaceRange(length, text.length, omission);
  }

  void _launchURL(_url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }
}
