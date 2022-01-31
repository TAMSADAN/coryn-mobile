import 'package:flutter/material.dart';
import 'coryn_colors.dart';

class CorynTextStyle {
  static const TextStyle contextDefaultTextStyle = TextStyle(
    color: CorynColors.contextDefaultColor,
    fontSize: 14,
  );
  static const TextStyle contextBoldTextStyle = TextStyle(
    color: CorynColors.contextBoldColor,
    fontWeight: FontWeight.bold,
    fontSize: 18,
  );
  static const TextStyle rateUpTextStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 12,
  );
  static const TextStyle rateDownTextStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 12,
  );
}
