class CryptoListing {
  final String? image;
  final String? chartImage;
  final String? cryptoName;
  final String? cryptoShortName;
  final double? currentPrice;
  final String? priceChangePercentage24h;
  final bool? isBullish;
  final bool? isRaising;

  CryptoListing({
    this.image,
    this.chartImage,
    this.cryptoName,
    this.cryptoShortName,
    this.currentPrice,
    this.priceChangePercentage24h,
    this.isBullish,
    this.isRaising,
  });
}
