import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class BackAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;
  final String appBarTitle;

  const BackAppBar(
    this.appBar,
    this.appBarTitle,
  );

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Text(
          appBarTitle,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(CupertinoIcons.back),
              color: Colors.black,
              onPressed: () {
                Scaffold.of(context).openDrawer();
                Navigator.pop(context);
              },
            );
          },
        ));
  }
}
