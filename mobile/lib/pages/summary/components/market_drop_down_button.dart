import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:mobile/pages/summary/controllers/coin_list_controller.dart';
import 'package:mobile/pages/summary/controllers/market_drop_down_button_controller.dart';
import 'package:get/get.dart';

class MarketDropDownButton extends StatelessWidget {
  const MarketDropDownButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _coinListController = Get.find<CoinListController>();

    return GetBuilder<MarketDropDownButtonController>(
      builder: (_) => DropdownButton2(
        value: _.market,
        items: _.marketList.map((_value) {
          return DropdownMenuItem(
              value: _value,
              child: Text(
                _value,
                style: const TextStyle(fontSize: 14),
              ));
        }).toList(),
        onChanged: (value) {
          _.onchanged(value);
          _coinListController.remainMarket(value.toString());
        },
        buttonWidth: 70,
      ),
    );
  }
}
