import 'package:flutter/material.dart';
import 'package:mobile/utils/coryn_size.dart';
import 'package:mobile/utils/coryn_text_style.dart';

class NewsCards extends StatelessWidget {
  const NewsCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.zero,
      children: [
        NewsCard(),
        NewsCard(),
        NewsCard(),
      ],
    );
  }

  Widget NewsCard() {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: CorynSize.contextVertical),
      child: Center(
        child: Container(
          width: 140,
          height: 110,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(15)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: CorynSize.componentVertical,
              ),
              Text(
                "22년 02월 04일",
                style: CorynTextStyle.smallBoldTextStyle,
              ),
              SizedBox(height: CorynSize.componentVertical),
              Text(
                "에어드랍",
                maxLines: 2,
                textAlign: TextAlign.center,
                style: CorynTextStyle.smallBoldTextStyle,
              ),
              SizedBox(height: CorynSize.componentVertical),
              Text("D-16", style: CorynTextStyle.xLargeBoldTextStyle),
            ],
          ),
        ),
      ),
    );
  }
}
