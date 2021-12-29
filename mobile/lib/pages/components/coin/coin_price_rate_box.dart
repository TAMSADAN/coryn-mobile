import 'package:flutter/material.dart';

class CoinPriceRateBox extends StatelessWidget {
  final double changeRate;

  const CoinPriceRateBox({Key? key, required this.changeRate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _changeRate = changeRate.toStringAsFixed(2) + "%";
    if (changeRate > 0)
      return _redRangeBox(_changeRate);
    else
      return _blueRangeBox(_changeRate);
  }

  Widget _redRangeBox(String _changeRate) {
    return Container(
      padding: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.all(Radius.circular(15)),
        shape: BoxShape.rectangle,
      ),
      child: Center(
        child: Text(
          _changeRate,
          style: TextStyle(
              color: Colors.redAccent,
              fontWeight: FontWeight.bold,
              fontSize: 12),
        ),
      ),
    );
  }

  Widget _blueRangeBox(String _changeRate) {
    return Container(
      padding: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.all(Radius.circular(15)),
        shape: BoxShape.rectangle,
      ),
      child: Center(
        child: Text(
          _changeRate,
          style: TextStyle(
              color: Colors.blueAccent,
              fontWeight: FontWeight.bold,
              fontSize: 12),
        ),
      ),
    );
  }
}
