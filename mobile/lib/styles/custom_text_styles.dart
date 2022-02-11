import 'package:flutter/material.dart';
import 'custom_colors.dart';

class CustomTextStyles {
  static const TextStyle xLargeBold = TextStyle(
    color: CustomColors.boldColor,
    fontSize: 25,
    fontFamily: 'NotoSansKR',
    fontWeight: FontWeight.bold,
  );

  static const TextStyle xLarge = TextStyle(
    color: CustomColors.boldColor,
    fontSize: 25,
    fontFamily: 'NotoSansKR',
    fontWeight: FontWeight.normal,
  );

  static const TextStyle largeBold = TextStyle(
    color: CustomColors.boldColor,
    fontSize: 18,
    fontFamily: 'NotoSansKR',
    fontWeight: FontWeight.bold,
  );

  static const TextStyle large = TextStyle(
    color: CustomColors.defaultColor,
    fontSize: 18,
    fontFamily: 'NotoSansKR',
    fontWeight: FontWeight.normal,
  );

  static const TextStyle middleBold = TextStyle(
    color: CustomColors.boldColor,
    fontSize: 15,
    fontFamily: 'NotoSansKR',
    fontWeight: FontWeight.bold,
  );

  static const TextStyle middle = TextStyle(
    color: CustomColors.defaultColor,
    fontSize: 15,
    fontFamily: 'NotoSansKR',
    fontWeight: FontWeight.normal,
  );

  static const TextStyle smallBold = TextStyle(
    color: CustomColors.boldColor,
    fontSize: 14,
    fontFamily: 'NotoSansKR',
    fontWeight: FontWeight.bold,
  );

  static const TextStyle small = TextStyle(
    color: CustomColors.defaultColor,
    fontSize: 14,
    fontFamily: 'NotoSansKR',
    fontWeight: FontWeight.normal,
  );

  static const TextStyle rateUp = TextStyle(
    color: Colors.redAccent,
    fontSize: 14,
    fontFamily: 'NotoSansKR',
    fontWeight: FontWeight.bold,
  );
  static const TextStyle rateDown = TextStyle(
    color: Colors.blueAccent,
    fontSize: 14,
    fontFamily: 'NotoSansKR',
    fontWeight: FontWeight.bold,
  );
}
