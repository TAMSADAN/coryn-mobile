import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mobile/pages/summary/controllers/coin_list_controller.dart';
import 'package:mobile/pages/summary/controllers/coin_search_bar_controller.dart';

class CoinSearchBar extends StatelessWidget {
  const CoinSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();
    final _coinListController = Get.find<CoinListController>();

    return GetBuilder<CoinSearchBarController>(
      builder: (_) => CupertinoSearchTextField(
        controller: _controller,
        onChanged: (value) {
          _.onChanged(value);
          _coinListController.sort();
        },
      ),
    );
  }
}

// class CoinSearchBar extends StatefulWidget {
//   const CoinSearchBar({Key? key}) : super(key: key);

//   @override
//   _CoinSearchBarState createState() => _CoinSearchBarState();
// }

// class _CoinSearchBarState extends State<CoinSearchBar> {
//   final TextEditingController _controller = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return CupertinoSearchTextField(
//       controller: _controller,
//       onChanged: (value) => _onChangedController(value),
//     );
//   }

//   void _onChangedController(String value) {
//     print(value);
//   }
// }
