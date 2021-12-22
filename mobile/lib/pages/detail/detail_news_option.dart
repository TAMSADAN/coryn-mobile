import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailNewsOption extends StatefulWidget {
  final Function newsOptionController;

  const DetailNewsOption({Key? key, required this.newsOptionController})
      : super(key: key);

  @override
  _DetailNewsOptionState createState() => _DetailNewsOptionState();
}

class _DetailNewsOptionState extends State<DetailNewsOption> {
  int _sliding = 0;

  @override
  Widget build(BuildContext context) {
    return CupertinoSlidingSegmentedControl(
      thumbColor: Colors.blue.shade100,
      children: {
        0: Text('호재 우선'),
        1: Text('날짜 우선'),
      },
      groupValue: _sliding,
      onValueChanged: (value) {
        _sliding = int.tryParse(value.toString())!;
        widget.newsOptionController(value);
      },
    );
  }
}
