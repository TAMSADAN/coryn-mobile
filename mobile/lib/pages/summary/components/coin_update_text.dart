import 'package:flutter/material.dart';
import 'package:mobile/styles/custom_text_styles.dart';

class CoinUpdateText extends StatelessWidget {
  const CoinUpdateText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      "업데이트 24시간 전",
      style: CustomTextStyles.small,
    );
  }
}
