import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:mobile/pages/summary/controllers/coin_list_controller.dart';
import 'package:mobile/styles/custom_sizes.dart';
import 'package:mobile/styles/custom_text_styles.dart';

class MarketDropDownButton extends StatelessWidget {
  const MarketDropDownButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CoinListController>(
      builder: (_) => DropdownButton2(
        value: _.selectedMarket,
        items: _.marketList.map((_value) {
          return DropdownMenuItem(
              value: _value,
              child: Text(
                _value,
                style: CustomTextStyles.small,
              ));
        }).toList(),
        onChanged: (value) {
          _.updateSelectedMarket(value.toString());
        },
        buttonWidth: CustomScreenSize.dropDownButtonWidth.w,
        dropdownMaxHeight: CustomScreenSize.dropDownButtonMaxHeight.h,
      ),
    );
  }
}
