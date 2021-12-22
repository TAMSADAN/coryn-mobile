import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailChartOption extends StatefulWidget {
  final Function chartOptionController;
  const DetailChartOption({Key? key, required this.chartOptionController})
      : super(key: key);

  @override
  _DetailChartOptionState createState() => _DetailChartOptionState();
}

class _DetailChartOptionState extends State<DetailChartOption> {
  int _sliding = 0;
  @override
  Widget build(BuildContext context) {
    return CupertinoSlidingSegmentedControl(
      children: {
        0: Text('분'),
        1: Text('일'),
        2: Text('주'),
        3: Text("월"),
      },
      groupValue: _sliding,
      onValueChanged: (value) {
        setState(() {
          _sliding = int.tryParse(value.toString())!;
        });
        widget.chartOptionController(value);
      },
    );
  }
}

// class DetailChartOption extends StatelessWidget {
//   final Function chartOptionController;

//   const DetailChartOption({Key? key, required this.chartOptionController})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return CupertinoSlidingSegmentedControl(
//       children: {
//         0: Text('분'),
//         1: Text('일'),
//         2: Text('주'),
//         3: Text("월"),
//       },
//       onValueChanged: (v) => chartOptionController(v),
//     );
//   }
// }
