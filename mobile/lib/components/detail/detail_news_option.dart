import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailNewsOption extends StatelessWidget {
  const DetailNewsOption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoSlidingSegmentedControl(
      children: {
        0: Text('호재 우선'),
        1: Text('날짜 우선'),
      },
      onValueChanged: (v) {
        print(v);
      },
    );
  }
}
