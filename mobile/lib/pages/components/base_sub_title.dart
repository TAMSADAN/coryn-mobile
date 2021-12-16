import 'package:flutter/material.dart';

class BaseSubTitle extends StatelessWidget {
  final String subTitle;

  const BaseSubTitle(this.subTitle);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 15, bottom: 5),
      child: Text(
        subTitle,
        style: TextStyle(
          fontSize: 13,
          color: Colors.black54,
        ),
      ),
    );
  }
}
