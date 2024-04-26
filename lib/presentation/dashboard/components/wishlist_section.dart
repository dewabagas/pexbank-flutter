import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pexbank/domain/crypto/models/crypto.dart';
import 'package:pexbank/domain/crypto/models/crypto_listing.dart';
import 'package:pexbank/presentation/core/constants/assets.dart';
import 'package:pexbank/presentation/core/constants/styles.dart';
import 'package:pexbank/presentation/core/styles/app_colors.dart';

class WishlistSection extends StatefulWidget {
  const WishlistSection({super.key});

  @override
  State<WishlistSection> createState() => _WishlistSectionState();
}

class _WishlistSectionState extends State<WishlistSection> {
  final List<CryptoListing> listCryptos = [
    CryptoListing(
        image: CryptoSymbols.icUsdt,
        chartImage: AppIcons.icBullishOne,
        cryptoName: 'USDT',
        cryptoShortName: 'USDT/BNB',
        currentPrice: 576.81,
        priceChangePercentage24h: '+ 0.32%',
        isBullish: true,
        isRaising: false),
    CryptoListing(
        image: CryptoSymbols.icTrx,
        chartImage: AppIcons.icBullishTwo,
        cryptoName: 'TRX',
        cryptoShortName: 'TRX/USDT',
        currentPrice: 343.01,
        priceChangePercentage24h: '+ 1.07%',
        isBullish: true,
        isRaising: false),
    CryptoListing(
        image: CryptoSymbols.icBtc,
        chartImage: AppIcons.icBullishOne,
        cryptoName: 'BTC',
        cryptoShortName: 'BTC/TRX',
        currentPrice: 1442.01,
        priceChangePercentage24h: '12.06%',
        isBullish: true,
        isRaising: true),
    CryptoListing(
        image: CryptoSymbols.icBtc,
        chartImage: AppIcons.icBullishOne,
        cryptoName: 'Bitcoin',
        cryptoShortName: 'BTC/TRX',
        currentPrice: 1442.01,
        priceChangePercentage24h: '12.06%',
        isBullish: true,
        isRaising: true),
    CryptoListing(
        image: CryptoSymbols.icEth,
        chartImage: AppIcons.icBullishOne,
        cryptoName: 'Ethereum',
        cryptoShortName: 'ETH/USDT',
        currentPrice: 1442.01,
        priceChangePercentage24h: '12.06%',
        isBullish: true,
        isRaising: true),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Wishlist',
                  style: TextStyles.headlineSmall
                      .copyWith(fontSize: 18.sp, color: AppColors.white)),
              Text('See more',
                  style: TextStyles.bodySmall.copyWith(color: AppColors.grey3))
            ],
          ),
          SizedBox(height: 16.h),
          ListView.builder(
            shrinkWrap: true,
            itemCount: listCryptos.length,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final crypto = listCryptos[index];
              return Container(
                margin:
                    EdgeInsets.only(bottom: 16.h), // Spasi antara setiap item
                padding: EdgeInsets.symmetric(vertical: 7.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset('${crypto.image}'),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${crypto.cryptoName}',
                                style: TextStyles.headlineSmall.copyWith(
                                    color: AppColors.white, fontSize: 14.sp)),
                            Text('${crypto.cryptoShortName}',
                                style: TextStyles.bodySmall.copyWith(
                                    color: AppColors.grey3,
                                    fontWeight: FontWeight.w400)),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.w),
                      child: SvgPicture.asset('${crypto.chartImage}'),
                    ),
                    Row(
                      children: [
                        SizedBox(width: 24.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('\$${crypto.currentPrice}',
                                style: TextStyles.headlineSmall.copyWith(
                                    color: AppColors.white, fontSize: 14.sp)),
                            Row(
                              children: [
                                Text('${crypto.priceChangePercentage24h}',
                                    style: TextStyles.bodySmall.copyWith(
                                        color: crypto.isBullish!
                                            ? AppColors.green
                                            : AppColors.red)),
                                crypto.isRaising!
                                    ? Padding(
                                        padding: EdgeInsets.only(left: 4.w),
                                        child: SvgPicture.asset(
                                            AppIcons.icArrowUp),
                                      )
                                    : const SizedBox.shrink()
                              ],
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
