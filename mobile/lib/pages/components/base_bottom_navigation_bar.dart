import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobile/pages/summary/summary_page.dart';
import 'package:mobile/pages/calendar/calendar_page.dart';
import 'package:mobile/pages/information/information_page.dart';

class BaseBottomNavigationBar extends StatelessWidget {
  final String title;

  const BaseBottomNavigationBar(
    this.title,
  );

  static const List<Widget> _wigetPages = <Widget>[
    SummaryPage(),
    CalendarPage(),
    InformationPage()
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
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
    );
  }
}
