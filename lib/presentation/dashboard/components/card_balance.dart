import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pexbank/presentation/core/constants/styles.dart';
import 'package:pexbank/presentation/core/styles/app_colors.dart';
import 'package:pexbank/presentation/shared/buttons/button_primary.dart';

class CardBalance extends StatelessWidget {
  const CardBalance({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.blue, AppColors.lightBlue],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Balance Portfolio',
              style: TextStyles.bodyMedium.copyWith(
                  color: AppColors.brokenWhite, fontWeight: FontWeight.w400)),
          SizedBox(height: 16.h),
          Text('\$xxx.xx',
              style: TextStyles.headlineLarge.copyWith(color: AppColors.white)),
          SizedBox(height: 16.h),
          ButtonPrimary(title: 'Log In', onPressed: () {})
        ],
      ),
    );
  }
}
