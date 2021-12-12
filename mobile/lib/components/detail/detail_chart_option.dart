import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailChartOption extends StatelessWidget {
  const DetailChartOption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoSlidingSegmentedControl(
      children: {
        0: Text('분'),
        1: Text('일'),
        2: Text('주'),
        3: Text("월"),
      },
      onValueChanged: (v) {
        print(v);
      },
    );
  }
}
