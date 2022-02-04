import 'package:flutter/material.dart';
import 'coryn_colors.dart';

class CorynTextStyle {
  static const TextStyle xLargeBoldTextStyle = TextStyle(
    color: CorynColors.boldColor,
    fontWeight: FontWeight.bold,
    fontSize: 25,
  );

  static const TextStyle largeBoldTextStyle = TextStyle(
    color: CorynColors.boldColor,
    fontWeight: FontWeight.bold,
    fontSize: 18,
  );
  static const TextStyle largeTextStyle = TextStyle(
    color: CorynColors.defaultColor,
    fontSize: 18,
  );

  static const TextStyle middleBoldTextStyle = TextStyle(
    color: CorynColors.boldColor,
    fontWeight: FontWeight.bold,
    fontSize: 15,
  );
  static const TextStyle middleTextStyle = TextStyle(
    color: CorynColors.defaultColor,
    fontSize: 15,
  );

  static const TextStyle smallBoldTextStyle = TextStyle(
    color: CorynColors.boldColor,
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );

  static const TextStyle smallTextStyle = TextStyle(
    color: CorynColors.defaultColor,
    fontSize: 14,
  );

  static const TextStyle rateUpTextStyle = TextStyle(
    color: Colors.redAccent,
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );
  static const TextStyle rateDownTextStyle = TextStyle(
    color: Colors.blueAccent,
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );
}
