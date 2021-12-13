import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SummarySearch extends StatefulWidget {
  const SummarySearch({Key? key}) : super(key: key);

  @override
  _SummarySearchState createState() => _SummarySearchState();
}

class _SummarySearchState extends State<SummarySearch> {
  TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CupertinoSearchTextField(
      controller: _controller,
    );
  }
}
