import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/pages/components/base_app_bar.dart';
import 'package:mobile/pages/components/base_sub_title.dart';
import 'package:mobile/pages/information/information_caution.dart';
import 'package:mobile/pages/information/information_list_item.dart';
import 'package:mobile/pages/list_cover.dart';

class InformationPage extends StatelessWidget {
  const InformationPage({Key? key}) : super(key: key);

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
              ),
            ];
          },
          body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              BaseSubTitle("앱 관련"),
              ListCover(
                Column(
                  children: [
                    InformationListItem(CupertinoIcons.info_circle,
                        Colors.white, Colors.blueAccent, "앱 정보"),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
