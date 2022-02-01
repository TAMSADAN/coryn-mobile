import 'package:get/get.dart';

class PlatformDropDownButtonController extends GetxController {
  final List<String> platformList = ["전체", "업비트", "빗썸"];
  String platform = "전체";

  void onchanged(value) {
    platform = value;
    update();
  }
}
