import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mobile/pages/detail/detail_page.dart';
import 'package:mobile/pages/summary/summary_page.dart';
import 'package:mobile/pages/calendar/calendar_page.dart';
import 'package:mobile/pages/information/info_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainPageController>(
      builder: (_) => Scaffold(
        body: IndexedStack(
          index: _.currentIndex,
          children: _.widgetList,
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: _.currentIndex,
          onTap: (value) => _.onChanged(value),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: '홈',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.calendar),
              label: '캘린더',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.info),
              label: '정보',
            ),
          ],
        ),
      ),
    );
  }
}

class MainPageController extends GetxController {
  final List<Widget> widgetList = [
    SummaryPage(),
    CalendarPage(),
    InformationPage(),
  ];
  int currentIndex = 1;

  void onChanged(value) {
    currentIndex = value;
    update();
  }
}
