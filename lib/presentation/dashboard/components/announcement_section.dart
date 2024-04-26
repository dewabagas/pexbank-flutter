import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pexbank/domain/announcement/models/announcement.dart';
import 'package:pexbank/domain/crypto/models/crypto.dart';
import 'package:pexbank/presentation/core/constants/assets.dart';
import 'package:pexbank/presentation/core/constants/styles.dart';
import 'package:pexbank/presentation/core/styles/app_colors.dart';

class AnnouncementSection extends StatefulWidget {
  const AnnouncementSection({super.key});

  @override
  State<AnnouncementSection> createState() => _AnnouncementSectionState();
}

class _AnnouncementSectionState extends State<AnnouncementSection> {
  int _currentIndex = 0;
  final CarouselController _controller = CarouselController();

  final List<Announcement> listAnnouncement = [
    Announcement(
      image: 'announcement_image_1_url',
      title: 'New Crypto Exchange Launched!',
      description:
          'We are excited to announce the launch of our new cryptocurrency exchange platform.',
    ),
    Announcement(
      image: 'announcement_image_2_url',
      title: 'Bitcoin Halving Event Coming Soon',
      description: 'Get ready for the upcoming Bitcoin halving event!',
    ),
    Announcement(
      image: 'announcement_image_3_url',
      title: 'Ethereum 2.0 Update',
      description: 'Stay updated on the latest developments with Ethereum 2.0.',
    ),
    Announcement(
      image: 'announcement_image_4_url',
      title: 'Crypto Regulations Update',
      description:
          'Learn about the latest regulatory developments in the cryptocurrency industry.',
    ),
    Announcement(
      image: 'announcement_image_5_url',
      title: 'Security Tips for Crypto Investors',
      description:
          'Protect your cryptocurrency investments with these security tips.',
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
              Text('Announcement',
                  style: TextStyles.headlineSmall
                      .copyWith(fontSize: 18.sp, color: AppColors.white)),
              Text('Hide',
                  style: TextStyles.bodySmall.copyWith(color: AppColors.grey3))
            ],
          ),
          SizedBox(height: 16.h),
          CarouselSlider(
            carouselController: _controller,
            items: listAnnouncement.map((item) {
              return Container(
                width: 116.w,
                height: 119.h,
                decoration: BoxDecoration(
                    color: AppColors.backgroundDark,
                    borderRadius: BorderRadius.circular(16.r)),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: SvgPicture.asset(
                        AppImages.imgBackground,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(4.r),
                              child: Image.asset(AppImages.imgDoge),
                            ),
                          ),
                          SizedBox(height: 19.h),
                          Text(
                            '${item.title}',
                            style: TextStyles.labelSmall.copyWith(
                                color: AppColors.white, fontSize: 8.sp),
                          ),
                          Text(
                            '${item.description}',
                            style: TextStyles.bodyVerySmall.copyWith(
                                fontWeight: FontWeight.w400,
                                color: AppColors.grey3,
                                fontSize: 6.sp),
                          ),
                        ],
                      ),
                    ),
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
              viewportFraction: 0.4,
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
