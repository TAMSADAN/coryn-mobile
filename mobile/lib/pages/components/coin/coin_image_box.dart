import 'package:flutter/material.dart';

class CoinImageBox extends StatelessWidget {
  final String coinImageUri;

  const CoinImageBox(this.coinImageUri);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: Colors.grey[50],
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          image: DecorationImage(
            image: NetworkImage(coinImageUri),
          ),
        ),
      ),
    );
  }
}
