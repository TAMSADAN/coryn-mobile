import 'package:flutter/material.dart';

class ListCover extends StatelessWidget {
  final Widget innerList;

  const ListCover(this.innerList);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        child: Padding(
            padding:
                const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
            child: innerList),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
      ),
    );
  }
}
