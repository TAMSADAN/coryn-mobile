import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class MarketDropDownButton extends StatefulWidget {
  const MarketDropDownButton({Key? key}) : super(key: key);

  @override
  _MarketDropDownButtonState createState() => _MarketDropDownButtonState();
}

class _MarketDropDownButtonState extends State<MarketDropDownButton> {
  final List<String> _valueList = ['전체', 'KRW', 'BTC'];
  String _selectedValue = 'KRW';

  @override
  Widget build(BuildContext context) {
    return DropdownButton2(
      value: _selectedValue,
      items: _valueList.map((_value) {
        return DropdownMenuItem(
            value: _value,
            child: Text(
              _value,
              style: const TextStyle(fontSize: 14),
            ));
      }).toList(),
      onChanged: (_value) {
        setState(() {
          _selectedValue = _value as String;
        });
      },
      buttonWidth: 70,
    );
  }
}
