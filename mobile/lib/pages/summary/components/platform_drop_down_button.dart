import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:mobile/pages/summary/controllers/platform_drop_down_button_controller.dart';
import 'package:get/get.dart';

class PlatformDropDownButton extends StatelessWidget {
  const PlatformDropDownButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlatformDropDownButtonController>(
      builder: (_) => DropdownButton2(
        value: _.platform,
        items: _.platformList.map((_value) {
          return DropdownMenuItem(
              value: _value,
              child: Text(
                _value,
                style: const TextStyle(fontSize: 14),
              ));
        }).toList(),
        onChanged: (value) => _.onchanged(value),
        buttonWidth: 80,
      ),
    );
  }
}
