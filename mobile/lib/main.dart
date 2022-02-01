import 'package:flutter/material.dart';
import 'package:mobile/pages/main_page.dart';
import 'package:get/get.dart';
// import 'package:flutter/foundation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _mainPageController = Get.put(MainPageController());

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
