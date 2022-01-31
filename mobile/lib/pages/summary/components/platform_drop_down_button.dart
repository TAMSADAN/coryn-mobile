import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class PlaformDropDownButton extends StatefulWidget {
  const PlaformDropDownButton({Key? key}) : super(key: key);

  @override
  _PlaformDropDownButtonState createState() => _PlaformDropDownButtonState();
}

class _PlaformDropDownButtonState extends State<PlaformDropDownButton> {
  final List<String> _valueList = ['전체', '업비트', '빗썸'];
  String _selectedValue = '전체';

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
      buttonWidth: 80,
    );
  }
}
