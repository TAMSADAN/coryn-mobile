class Coin {
  final String baseSymbol;
  final String quoteSymbol;
  final String koreanName;
  final double upbitPrice;
  final double binancePrice;
  final double changeRate;
  final double changePrice;
  final double kimpRate;
  final double kimpPrice;

  Coin({
    required this.baseSymbol,
    required this.quoteSymbol,
    required this.koreanName,
    required this.upbitPrice,
    required this.binancePrice,
    required this.changeRate,
    required this.changePrice,
    required this.kimpRate,
    required this.kimpPrice,
  });
}
