import 'package:flutter/material.dart';

class ItemLine extends StatelessWidget {
  const ItemLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child:
          Container(height: 0.1, width: double.infinity, color: Colors.black),
    );
  }
}
