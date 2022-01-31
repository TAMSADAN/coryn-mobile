import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CoinSearchBar extends StatefulWidget {
  const CoinSearchBar({Key? key}) : super(key: key);

  @override
  _CoinSearchBarState createState() => _CoinSearchBarState();
}

class _CoinSearchBarState extends State<CoinSearchBar> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CupertinoSearchTextField(
      controller: _controller,
      onChanged: (value) => _onChangedController(value),
    );
  }

  void _onChangedController(String value) {
    print(value);
  }
}
