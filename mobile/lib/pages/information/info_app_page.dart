import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobile/pages/list_cover.dart';
import 'package:mobile/pages/components/base_sub_title.dart';
import 'package:mobile/pages/information/components/content_item.dart';
import 'package:mobile/pages/information/components/link_item.dart';
import 'package:mobile/pages/information/components/item_line.dart';

class InformationAppPage extends StatelessWidget {
  const InformationAppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xfff2f2f6),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerboxIsScrolled) {
            return <Widget>[
              CupertinoSliverNavigationBar(
                backgroundColor: const Color(0xfff2f2f6),
                border: Border(),
                largeTitle: Text("앱 정보"),
                previousPageTitle: "정보",
              ),
            ];
          },
          body: ListView(
            children: [
              BaseSubTitle("앱 관련"),
              Column(
                children: [
                  Container(
                    height: 0.2,
                    width: double.infinity,
                    color: Colors.black,
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(color: Colors.white),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ContentItem(title: "앱 버전", content: "1.12"),
                        ItemLine(),
                        LinkItem(
                            title: "오픈소스 라이센스",
                            contentUrl:
                                "https://moyoung.notion.site/Open-source-lisence-ef6efb24b1484a81a832ecae65d78912"),
                      ],
                    ),
                  ),
                ],
              ),
              BaseSubTitle("개발 관련"),
              Column(
                children: [
                  Container(
                    height: 0.2,
                    width: double.infinity,
                    color: Colors.black,
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(color: Colors.white),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LinkItem(
                            title: "TAMSADAN 탐사단",
                            contentUrl:
                                "https://moyoung.notion.site/CORYN-e44fbce06d7a44c98dab7d902a8b2b3d"),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
