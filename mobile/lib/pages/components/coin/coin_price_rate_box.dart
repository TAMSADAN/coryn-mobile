import 'package:flutter/material.dart';

class CoinPriceRateBox extends StatelessWidget {
  final String coinPriceRate;

  const CoinPriceRateBox(this.coinPriceRate);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.all(Radius.circular(15)),
        shape: BoxShape.rectangle,
      ),
      child: Center(
        child: Text(
          "+$coinPriceRate%",
          style: TextStyle(
              color: Colors.redAccent,
              fontWeight: FontWeight.bold,
              fontSize: 12),
        ),
      ),
    );
  }
}
