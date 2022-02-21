import 'package:flutter/material.dart';

class CustomColors {
  static const Color grey = Color(0xff757575);
  static const Color black = Color(0xff212121);
  static const Color red = Colors.redAccent;
  static const Color blue = Colors.blueAccent;
  static const Color rateUp = Colors.redAccent;
  static const Color rateDown = Colors.blueAccent;
  static const Color leading = Colors.blueAccent;
  static const Color white = Colors.white;
  static Color getRandomColor() {
    List<Color> randomColors = [
      Color(0xff7C83FD),
      // Color(0xffF25287),
      // Color(0xffECA3F5),
      // Color(0xff81B214),
      // Color(0xffFFAB73),
    ];
    return (randomColors..shuffle()).first;
  }
}
