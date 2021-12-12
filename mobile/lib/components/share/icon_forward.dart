import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class IconForward extends StatelessWidget {
  const IconForward({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      CupertinoIcons.forward,
      color: Colors.grey,
    );
  }
}
