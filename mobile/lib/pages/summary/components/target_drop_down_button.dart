import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:mobile/pages/summary/controllers/coin_list_controller.dart';
import 'package:mobile/styles/custom_screen_sizes.dart';
import 'package:mobile/styles/custom_text_styles.dart';

class TargetDropDownButton extends StatelessWidget {
  const TargetDropDownButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CoinListController>(
      builder: (_) => DropdownButton2(
        value: _.selectedTarget,
        items: _.targetList.map((_value) {
          return DropdownMenuItem(
              value: _value,
              child: Text(
                _value,
                style: CustomTextStyles.small,
              ));
        }).toList(),
        onChanged: (value) {
          _.updateselectedTarget(value.toString());
        },
        buttonWidth: CustomScreenSizes.dropDownButtonWidth.w,
        dropdownMaxHeight: CustomScreenSizes.dropDownButtonMaxHeight.h,
      ),
    );
  }
}
