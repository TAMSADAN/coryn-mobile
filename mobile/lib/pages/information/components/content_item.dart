import 'package:flutter/material.dart';

class ContentItem extends StatelessWidget {
  final String title;
  final String content;

  const ContentItem({Key? key, required this.title, required this.content})
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
          Text(
            content,
            style: TextStyle(fontSize: 18),
          )
        ],
      ),
    );
  }
}
