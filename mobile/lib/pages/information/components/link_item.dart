import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class LinkItem extends StatelessWidget {
  final String title;
  final String contentUri;

  const LinkItem({Key? key, required this.title, required this.contentUri})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 0),
            child: Icon(
              CupertinoIcons.forward,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
