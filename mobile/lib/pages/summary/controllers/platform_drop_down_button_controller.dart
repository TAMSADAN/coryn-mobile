import 'package:get/get.dart';

class PlatformDropDownButtonController extends GetxController {
  final List<String> platformList = ["전체", "업비트"];
  final List<String> platformImagePathList = [
    "assets/images/coryn_icon.png",
    "assets/images/upbit_logo.png"
  ];
  String platform = "업비트";

  void onchanged(value) {
    platform = value;
    update();
  }
}
