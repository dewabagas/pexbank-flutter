import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pexbank/domain/crypto/models/crypto.dart';
import 'package:pexbank/presentation/core/constants/assets.dart';
import 'package:pexbank/presentation/core/constants/styles.dart';
import 'package:pexbank/presentation/core/styles/app_colors.dart';

class TrendingSection extends StatefulWidget {
  const TrendingSection({super.key});

  @override
  State<TrendingSection> createState() => _TrendingSectionState();
}

class _TrendingSectionState extends State<TrendingSection> {
  int _currentIndex = 0;
  final CarouselController _controller = CarouselController();

  final List<Crypto> listCryptos = [
    Crypto(
      image: CryptoSymbols.icBtc,
      cryptoName: 'BTC',
      cryptoShortName: 'BTC/USDT',
      currentPrice: 55789.20,
      priceChangePercentage24h: 3.50,
      tradingVolume24h: 60589120,
      marketCap: 1040000000000,
    ),
    Crypto(
      image: CryptoSymbols.icEth,
      cryptoName: 'ETH',
      cryptoShortName: 'ETH/USDT',
      currentPrice: 3847.50,
      priceChangePercentage24h: -1.20,
      tradingVolume24h: 40289215,
      marketCap: 450670000000,
    ),
    Crypto(
      image: CryptoSymbols.icTrx,
      cryptoName: 'TRX',
      cryptoShortName: 'TRX/USDT',
      currentPrice: 0.080,
      priceChangePercentage24h: 1.75,
      tradingVolume24h: 125000000,
      marketCap: 5600000000,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Trending',
                  style: TextStyles.bodyLarge.copyWith(color: AppColors.white)),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: listCryptos.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => _controller.animateToPage(entry.key),
                      child: Container(
                        width: 6.w,
                        height: 6.w,
                        margin: EdgeInsets.symmetric(horizontal: 4.w),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: _currentIndex == entry.key
                              ? const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [AppColors.blue, AppColors.lightBlue],
                                )
                              : null,
                          color:
                              (Theme.of(context).brightness == Brightness.dark
                                  ? AppColors.darkGrey
                                  : AppColors.white),
                        ),
                      ),
                    );
                  }).toList()),
            ],
          ),
          SizedBox(height: 16.h),
          CarouselSlider(
            carouselController: _controller,
            items: listCryptos.map((item) {
              Color textColor = item.priceChangePercentage24h! < 0
                  ? AppColors.red
                  : AppColors.green;

              String lineChartIcon = item.priceChangePercentage24h! < 0
                  ? AppIcons.icLineChartRed
                  : AppIcons.icLineChartGreen;
              return Container(
                width: 212.w,
                height: 136.h,
                padding:
                    EdgeInsets.symmetric(horizontal: 12.w, vertical: 17.5.h),
                decoration: BoxDecoration(
                    color: AppColors.backgroundDark,
                    borderRadius: BorderRadius.circular(16.r)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset('${item.image}'),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${item.cryptoName}',
                                style: TextStyles.headlineSmall.copyWith(
                                    color: AppColors.white, fontSize: 14.sp)),
                            Text('${item.cryptoShortName}',
                                style: TextStyles.bodyVerySmall.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.grey2)),
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('\$${item.currentPrice}',
                                style: TextStyles.headlineSmall.copyWith(
                                    color: AppColors.white, fontSize: 14.sp)),
                            Text('${item.priceChangePercentage24h}%',
                                style: TextStyles.bodySmall
                                    .copyWith(color: textColor)),
                          ],
                        ),
                        SizedBox(height: 4.h),
                        SvgPicture.asset(lineChartIcon)
                      ],
                    )
                  ],
                ),
              );
            }).toList(),
            options: CarouselOptions(
              height: 183.h,
              autoPlay: true,
              enlargeCenterPage: false,
              aspectRatio: 16 / 9,
              reverse: true,
              enableInfiniteScroll: true,
              viewportFraction: 0.7,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  buildCryptoCard(Crypto crypto) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(CryptoSymbols.icBtc),
            ],
          )
        ],
      ),
    );
  }
}
