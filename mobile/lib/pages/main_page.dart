import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:mobile/pages/summary/summary_page.dart';
import 'package:mobile/pages/calendar/calendar_page.dart';
import 'package:mobile/utils/ad_manager.dart';

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
              icon: Icon(CupertinoIcons.calendar),
              label: '캘린더',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.bitcoin_circle),
              label: '리스트',
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(CupertinoIcons.info),
            //   label: '정보',
            // ),
          ],
        ),
      ),
    );
  }
}

class MainPageController extends SuperController {
  late AppOpenAdManager appOpenAdManager;
  final List<Widget> widgetList = [
    CalendarPage(),
    SummaryPage(),
    // InformationPage(),
  ];
  int currentIndex = 1;

  @override
  void onInit() {
    super.onInit();
    appOpenAdManager = AppOpenAdManager()..loadAd();
    WidgetsBinding.instance!
        .addObserver(AppLifecycleReactor(appOpenAdManager: appOpenAdManager));
  }

  void onChanged(value) {
    currentIndex = value;
    update();
  }

  @override
  void onDetached() {
    print("onDetached");
  }

  @override
  void onInactive() {
    print("onInactive");
  }

  @override
  void onPaused() {
    print("opPaused");
  }

  @override
  void onResumed() {
    print("onResumed");
    appOpenAdManager.showAdIfAvailable();
  }
}
