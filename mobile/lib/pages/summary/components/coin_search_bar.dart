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

    return GetBuilder<CoinListController>(
      builder: (_) => CupertinoSearchTextField(
        controller: _controller,
        onChanged: (value) {
          _.updateSearch(value);
        },
      ),
    );
  }
}
