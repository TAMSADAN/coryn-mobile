import 'package:flutter/material.dart';
import 'package:mobile/utils/coryn_text_style.dart';

class CoinUpdateText extends StatelessWidget {
  const CoinUpdateText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "업데이트 16시간 전",
      style: CorynTextStyle.smallTextStyle,
    );
  }
}
