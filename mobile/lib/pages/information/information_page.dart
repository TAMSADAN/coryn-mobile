import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/pages/components/base_app_bar.dart';
import 'package:mobile/pages/components/base_sub_title.dart';
import 'package:mobile/pages/information/information_caution.dart';
import 'package:mobile/pages/information/information_list_item.dart';
import 'package:mobile/pages/information/list_cover.dart';

class InformationPage extends StatelessWidget {
  const InformationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff2f2f6),
      appBar: BaseAppBar(AppBar(), "정보"),
      body: ListView(
        children: [
          BaseSubTitle("앱 정보"),
          InformationCaution(),
          ListCover(
            Column(
              children: [
                InformationListItem(CupertinoIcons.info_circle, Colors.white,
                    Colors.blueAccent, "앱 정보"),
                Container(
                    padding: const EdgeInsets.only(left: 40),
                    child: Divider(color: Colors.black, thickness: 0.1)),
                InformationListItem(CupertinoIcons.info_circle, Colors.white,
                    Colors.blueAccent, "개발자 정보"),
                Container(
                    padding: const EdgeInsets.only(left: 40),
                    child: Divider(color: Colors.black, thickness: 0.1)),
                InformationListItem(CupertinoIcons.info_circle, Colors.white,
                    Colors.blueAccent, "앱 정보"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
