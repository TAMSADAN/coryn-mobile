import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/pages/components/base_sub_title.dart';
import 'package:mobile/pages/information/components/info_list_item.dart';
import 'package:mobile/pages/components/list_cover.dart';
import 'package:mobile/pages/information/info_app_page.dart';
import 'package:mobile/pages/ad_banner.dart';

class InformationPage extends StatefulWidget {
  const InformationPage({Key? key}) : super(key: key);

  @override
  _InformationPageState createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
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
                largeTitle: Text("정보"),
                heroTag: "information",
              ),
            ];
          },
          body: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  children: [
                    BaseSubTitle("앱 관련"),
                    ListCover(
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const InformationAppPage()),
                              );
                            },
                            child: InformationListItem(
                                CupertinoIcons.info_circle,
                                Colors.white,
                                Colors.blueAccent,
                                "앱 정보"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              AdBanner()
            ],
          ),
        ));
  }
}
