import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CoinNewsListItem extends StatelessWidget {
  final String coinNewsTitle;
  final String coinNewsPublishDate;
  final String coinNewsTargetDate;
  final String coinNewsSource;

  const CoinNewsListItem(this.coinNewsTitle, this.coinNewsPublishDate,
      this.coinNewsTargetDate, this.coinNewsSource);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: Colors.grey[50],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 290,
                          child: Text(
                            coinNewsTitle,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          "생성일 : $coinNewsPublishDate 타겟일 : $coinNewsTargetDate",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                        Text(
                          "출처 : $coinNewsSource",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 0),
                child: Icon(CupertinoIcons.forward),
              ),
            ],
          )),
    );
  }
}
