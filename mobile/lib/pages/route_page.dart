import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobile/pages/summary_page.dart';
import 'package:mobile/pages/calendar_page.dart';
import 'package:mobile/pages/information_page.dart';

class RoutePage extends StatefulWidget {
  const RoutePage({Key? key}) : super(key: key);

  @override
  _RoutePageState createState() => _RoutePageState();
}

class _RoutePageState extends State<RoutePage> {
  int _currentIndex = 0;
  // @override
  // Widget build(BuildContext context) {
  //   return CupertinoTabScaffold(
  //     tabBar: CupertinoTabBar(
  //       backgroundColor: Colors.white,
  //       items: const <BottomNavigationBarItem>[
  //         BottomNavigationBarItem(
  //           icon: Icon(CupertinoIcons.home),
  //         ),
  //         BottomNavigationBarItem(
  //           icon: Icon(CupertinoIcons.calendar),
  //         ),
  //         BottomNavigationBarItem(
  //           icon: Icon(CupertinoIcons.info),
  //         ),
  //       ],
  //     ),
  //     tabBuilder: (context, index) {
  //       currentIndex = index;
  //       switch (index) {
  //         case 0:
  //           return CupertinoTabView(builder: (context) {
  //             return CupertinoPageScaffold(child: SummaryPage());
  //           });
  //           break;
  //         case 1:
  //           return CupertinoTabView(builder: (context) {
  //             return CupertinoPageScaffold(child: CalendarPage());
  //           });
  //           break;
  //         case 2:
  //           return CupertinoTabView(
  //             builder: (context) {
  //               return CupertinoPageScaffold(child: InformationPage());
  //             },
  //           );
  //           break;
  //         default:
  //           return const CupertinoTabView();
  //       }
  //     },
  //   );

  static const List<Widget> _widgetPages = <Widget>[
    SummaryPage(),
    CalendarPage(),
    InformationPage()
  ];

  void _onBottomBarTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _widgetPages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _currentIndex,
        onTap: _onBottomBarTap,
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
    );
  }
}
