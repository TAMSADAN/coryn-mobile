class BinanceCoin {
  final BinanceCoinMarket marketData;
  final BinanceCoinPrice priceData;

  BinanceCoin({
    required this.marketData,
    required this.priceData,
  });
}

class BinanceCoinMarket {
  final String symbol;
  final String baseAsset;
  final String quoteAsset;

  BinanceCoinMarket({
    required this.symbol,
    required this.baseAsset,
    required this.quoteAsset,
  });

  factory BinanceCoinMarket.fromJson(Map<String, dynamic> json) {
    return BinanceCoinMarket(
      symbol: json['symbols'][0]['symbol'],
      baseAsset: json['symbols'][0]['baseAsset'],
      quoteAsset: json['symbols'][0]['quoteAsset'],
    );
  }
}

class BinanceCoinPrice {
  final String symbol;
  final double price;

  BinanceCoinPrice({
    required this.symbol,
    required this.price,
  });

  factory BinanceCoinPrice.fromJson(Map<String, dynamic> json) {
    return BinanceCoinPrice(
      symbol: json['symbol'].toString(),
      price: double.parse(json['price'].toString()),
    );
  }
}
