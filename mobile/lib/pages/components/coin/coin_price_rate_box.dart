import 'package:flutter/material.dart';

class CoinPriceRateBox extends StatelessWidget {
  final double dayRange;

  const CoinPriceRateBox(this.dayRange);

  @override
  Widget build(BuildContext context) {
    if (dayRange > 0)
      return _redRangeBox(dayRange);
    else
      return _blueRangeBox(dayRange);
  }

  Widget _redRangeBox(_dayRange) {
    return Container(
      padding: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.all(Radius.circular(15)),
        shape: BoxShape.rectangle,
      ),
      child: Center(
        child: Text(
          "+$_dayRange%",
          style: TextStyle(
              color: Colors.redAccent,
              fontWeight: FontWeight.bold,
              fontSize: 12),
        ),
      ),
    );
  }

  Widget _blueRangeBox(_dayRange) {
    return Container(
      padding: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.all(Radius.circular(15)),
        shape: BoxShape.rectangle,
      ),
      child: Center(
        child: Text(
          "$_dayRange%",
          style: TextStyle(
              color: Colors.blueAccent,
              fontWeight: FontWeight.bold,
              fontSize: 12),
        ),
      ),
    );
  }
}
