import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailNewsOption extends StatefulWidget {
  final Function newsOptionController;
  final int defaultOption;

  const DetailNewsOption(
      {Key? key,
      required this.newsOptionController,
      required this.defaultOption})
      : super(key: key);

  @override
  _DetailNewsOptionState createState() => _DetailNewsOptionState();
}

class _DetailNewsOptionState extends State<DetailNewsOption> {
  late int _sliding;

  @override
  Widget build(BuildContext context) {
    return CupertinoSlidingSegmentedControl(
      children: {
        0: Text('날짜 우선'),
        1: Text('호재 우선'),
      },
      groupValue: _sliding,
      onValueChanged: (value) {
        _sliding = int.tryParse(value.toString())!;
        widget.newsOptionController(value);
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _sliding = widget.defaultOption;
  }
}
