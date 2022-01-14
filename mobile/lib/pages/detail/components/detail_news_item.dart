import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/models/dto/news.dart';
import 'package:url_launcher/url_launcher.dart';

/*
  [component] DetailNewsItem

  info
  코인 뉴스 정보를 담은 컴포넌트 입니다.
  사용자는 해당 컴포넌트에서 뉴스 정보를 확인합니다.
  
  contents
  - 뉴스 제목
  - 생성일 - 타겟일(null 허용)
  - 출처

  events
  - 클릭시 해당 뉴스 URL로 이동

  etc
  - 
*/

class DetailNewsItem extends StatelessWidget {
  final News news;

  const DetailNewsItem({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color _itemColor;

    if (news.newsType == "good") {
      _itemColor = Colors.blue.shade50;
    } else {
      _itemColor = Colors.grey.shade50;
    }
    return GestureDetector(
      onTap: () => _launchURL(news.url),
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: _itemColor,
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
                              news.title,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            "생성일 : ${news.postedDate != null ? news.getStringFromDatetime(news.postedDate!) : ""} ${news.targetingDate != null ? "타겟일 :" + news.getStringFromDatetime(news.targetingDate!) : ""}",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                            ),
                          ),
                          Text(
                            "출처 : ${news.source}",
                            style: TextStyle(
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
                Padding(
                  padding: const EdgeInsets.only(right: 0),
                  child: Icon(CupertinoIcons.forward),
                ),
              ],
            )),
      ),
    );
  }

  void _launchURL(_url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }
}