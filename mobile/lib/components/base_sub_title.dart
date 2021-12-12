import 'package:flutter/material.dart';

class BaseSubTitle extends StatelessWidget {
  final String subTitle;

  const BaseSubTitle(this.subTitle);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            subTitle,
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            child: Divider(color: Colors.black, thickness: 0.1),
          ),
        ],
      ),
    );
  }
}
