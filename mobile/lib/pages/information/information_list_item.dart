import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class InformationListItem extends StatelessWidget {
  final IconData informationIconData;
  final Color informationIconColor;
  final Color informationBoxColor;
  final String informationTitle;

  const InformationListItem(this.informationIconData, this.informationIconColor,
      this.informationBoxColor, this.informationTitle);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Container(
            width: 30,
            height: 30,
            child: Icon(
              informationIconData,
              color: informationIconColor,
              size: 23,
            ),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: informationBoxColor,
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(informationTitle, style: TextStyle(fontSize: 16)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 0),
          child: Icon(
            CupertinoIcons.forward,
            size: 20,
            color: Colors.black54,
          ),
        )
      ],
    );
  }
}
