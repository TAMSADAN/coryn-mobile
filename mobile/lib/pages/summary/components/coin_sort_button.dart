import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/pages/summary/controllers/coin_sort_button_controller.dart';
import 'package:mobile/pages/summary/controllers/coin_list_controller.dart';
import 'package:mobile/utils/coryn_size.dart';
import 'package:mobile/styles/custom_text_styles.dart';

class CoinSortButton extends StatelessWidget {
  const CoinSortButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle _buttonStyle = TextButton.styleFrom(
        backgroundColor: Colors.grey[200],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)));
    final _coinListController = Get.find<CoinListController>();

    return GetBuilder<CoinSortButtonController>(
      builder: (_) => Row(
        children: List.generate(_.coinSortList.length, (index) {
          return Row(
            children: [
              TextButton(
                onPressed: () {
                  _.onchanged(_.coinSortList[index]);
                  _coinListController.sort();
                },
                child: Text(
                  _.coinSortList[index],
                  style: CustomTextStyles.middle,
                ),
                style: _buttonStyle,
              ),
              if (index != _.coinSortList.length - 1)
                const SizedBox(width: CorynSize.contextHorizontal)
            ],
          );
        }),
      ),
    );
  }
}
