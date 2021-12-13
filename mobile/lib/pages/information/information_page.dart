import 'package:flutter/material.dart';
import 'package:mobile/pages/components/base_app_bar.dart';
import 'package:mobile/pages/components/base_sub_title.dart';
import 'package:mobile/pages/information/information_caution.dart';

class InformationPage extends StatelessWidget {
  const InformationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: BaseAppBar(AppBar(), "정보"),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              BaseSubTitle("앱 정보"),
              InformationCaution(),
            ],
          ),
        ));
  }
}
