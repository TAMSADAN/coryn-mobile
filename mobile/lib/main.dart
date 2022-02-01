import 'package:flutter/material.dart';
import 'package:mobile/pages/calendar/calendar_page.dart';
import 'package:mobile/pages/information/info_page.dart';
import 'package:mobile/pages/main_page.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:get/get.dart';
import 'package:mobile/pages/summary/summary_binding.dart';
import 'package:mobile/pages/summary/summary_page.dart';
// import 'package:flutter/foundation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
          name: '/',
          page: () => SummaryPage(),
          binding: SummaryBinding(),
        ),
        GetPage(
          name: '/calendar',
          page: () => CalendarPage(),
        ),
        GetPage(
          name: '/information',
          page: () => InformationPage(),
        ),
      ],
    );
  }
}
