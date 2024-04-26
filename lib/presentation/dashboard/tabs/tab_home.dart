import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pexbank/presentation/core/constants/assets.dart';
import 'package:pexbank/presentation/core/constants/styles.dart';
import 'package:pexbank/presentation/core/styles/app_colors.dart';
import 'package:pexbank/presentation/dashboard/components/announcement_section.dart';
import 'package:pexbank/presentation/dashboard/components/card_balance.dart';
import 'package:pexbank/presentation/dashboard/components/trending_section.dart';
import 'package:pexbank/presentation/shared/buttons/button_primary.dart';
import 'package:pexbank/presentation/shared/pages/draggable_page.dart';

class TabHome extends StatefulWidget {
  const TabHome({super.key});

  @override
  State<TabHome> createState() => _TabHomeState();
}

class _TabHomeState extends State<TabHome> {
  @override
  Widget build(BuildContext context) {
    return DraggablePage(
        appBarColor: AppColors.backgroundDark,
        backgroundColor: AppColors.primary,
        alwaysShowLeadingAndAction: false,
        headerExpandedHeight: 0.4,
        centerTitle: true,
        curvedBodyRadius: 32.r,
        title: renderHeader(),
        headerWidget: Container(
          color: AppColors.backgroundDark,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                SizedBox(height: 44.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    renderHeader(),
                    Row(
                      children: [
                        SvgPicture.asset(AppIcons.icAnnouncement),
                        SizedBox(width: 8.w),
                        SvgPicture.asset(AppIcons.icUserCircle),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 28.h),
                const CardBalance()
              ],
            ),
          ),
        ),
        body: [
          const TrendingSection(),
          SizedBox(height: 16.h),
          const AnnouncementSection()
        ]);
  }

  renderHeader() {
    return Row(
      children: [
        Image.asset(AppIcons.icPexBank, width: 20.w, height: 20.w),
        SizedBox(width: 8.w),
        Text('PEXBANK',
            style: TextStyles.headlineSmall
                .copyWith(fontSize: 20.sp, color: AppColors.white)),
      ],
    );
  }
}
