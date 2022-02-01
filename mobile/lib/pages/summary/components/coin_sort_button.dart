import 'package:flutter/material.dart';
import 'package:mobile/utils/coryn_size.dart';
import 'package:get/get.dart';
import 'package:mobile/pages/summary/controllers/coin_sort_button_controller.dart';

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
    final _controller = Get.put(CoinSortButtonController());

    return GetBuilder<CoinSortButtonController>(
      builder: (_) => Row(
        children: List.generate(_controller.coinSortList.length, (index) {
          return Row(
            children: [
              TextButton(
                onPressed: () => _.onchanged(_controller.coinSortList[index]),
                child: Text(
                  _controller.coinSortList[index],
                  style: _textStyle,
                ),
                style: _buttonStyle,
              ),
              if (index != _controller.coinSortList.length - 1)
                SizedBox(width: CorynSize.contextHorizontal)
            ],
          );
        }),
      ),
    );
  }
}
