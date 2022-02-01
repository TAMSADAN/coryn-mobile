import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavigationController>(
      builder: (_) => BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _.currentIndex,
        onTap: (value) => _.onchanged(value),
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

class BottomNavigationController extends GetxController {
  List<String> pageNameList = ["/", "/calendar", "/information"];
  int currentIndex = 0;

  void onchanged(value) {
    currentIndex = value;
    Get.toNamed(pageNameList[value]);
    update();
  }
}
