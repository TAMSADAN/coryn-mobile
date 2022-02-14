class Coin {
  final String market;
  final String koreanName;
  final String symbol;
  final double firstPrice;
  final double secondPrice;
  final double changeRate;
  final double changePrice;
  final double kimpRate;
  final double kimpPrice;

  Coin({
    required this.market,
    required this.koreanName,
    required this.symbol,
    required this.firstPrice,
    required this.secondPrice,
    required this.changeRate,
    required this.changePrice,
    required this.kimpRate,
    required this.kimpPrice,
  });
}
