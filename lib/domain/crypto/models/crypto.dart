class Crypto {
  final String? image;
  final String? cryptoName;
  final String? cryptoShortName;
  final double? currentPrice;
  final double? priceChangePercentage24h;
  final double? tradingVolume24h;
  final double? marketCap;

  Crypto({
    this.image,
    this.cryptoName,
    this.cryptoShortName,
    this.currentPrice,
    this.priceChangePercentage24h,
    this.tradingVolume24h,
    this.marketCap,
  });
}
