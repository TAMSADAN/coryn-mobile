import 'package:flutter/material.dart';
import 'package:mobile/utils/coryn_size.dart';

class CoinSortButton extends StatefulWidget {
  const CoinSortButton({Key? key}) : super(key: key);

  @override
  _CoinSortButtonState createState() => _CoinSortButtonState();
}

class _CoinSortButtonState extends State<CoinSortButton> {
  final ButtonStyle _buttonStyle = TextButton.styleFrom(
      backgroundColor: Colors.grey[200],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)));
  final TextStyle _textStyle = TextStyle(color: Colors.grey[600]);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: null,
          child: Text("거래량", style: _textStyle),
          style: _buttonStyle,
        ),
        SizedBox(width: CorynSize.contextHorizontal),
        TextButton(
          onPressed: null,
          child: Text("등락률", style: _textStyle),
          style: _buttonStyle,
        ),
      ],
    );
  }
}
