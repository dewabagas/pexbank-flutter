import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pexbank/presentation/core/styles/app_colors.dart';

double screenWidth =
    MediaQueryData.fromView(WidgetsBinding.instance.window).size.width;
double screenHeight =
    MediaQueryData.fromView(WidgetsBinding.instance.window).size.height;

class TextStyles {
  static const TextStyle primaryFont =
      TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.w500);

  static TextStyle get displayLarge => primaryFont.copyWith(
      color: AppColors.primary, fontSize: 57.sp, fontWeight: FontWeight.w700);
  static TextStyle get displayMedium => primaryFont.copyWith(
      color: AppColors.primary, fontSize: 45.sp, fontWeight: FontWeight.w700);
  static TextStyle get displaySmall => primaryFont.copyWith(
      color: AppColors.primary, fontSize: 44.sp, fontWeight: FontWeight.w700);

  static TextStyle get headlineLarge => primaryFont.copyWith(
      color: AppColors.primary, fontSize: 32.sp, fontWeight: FontWeight.w700);
  static TextStyle get headlineMedium => primaryFont.copyWith(
      color: AppColors.primary, fontSize: 28.sp, fontWeight: FontWeight.w700);
  static TextStyle get headlineSmall => primaryFont.copyWith(
      color: AppColors.primary, fontSize: 24.sp, fontWeight: FontWeight.w700);

  static TextStyle get titleLarge => primaryFont.copyWith(
      color: AppColors.primary, fontSize: 22.sp, fontWeight: FontWeight.w600);
  static TextStyle get titleMedium => primaryFont.copyWith(
        color: AppColors.primary,
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
      );
  static TextStyle get titleSmall => primaryFont.copyWith(
        color: AppColors.primary,
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get labelLarge => primaryFont.copyWith(
        color: AppColors.charcoal,
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
      );
  static TextStyle get labelMedium => primaryFont.copyWith(
        color: AppColors.charcoal,
        fontSize: 12.sp,
        fontWeight: FontWeight.w600,
      );
  static TextStyle get labelSmall => primaryFont.copyWith(
        color: AppColors.charcoal,
        fontSize: 10.sp,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get bodyLarge => primaryFont.copyWith(
      color: AppColors.charcoal, fontSize: 16.sp, fontWeight: FontWeight.w500);
  static TextStyle get bodyMedium => primaryFont.copyWith(
      color: AppColors.charcoal, fontSize: 14.sp, fontWeight: FontWeight.w500);
  static TextStyle get bodySmall => primaryFont.copyWith(
      color: AppColors.charcoal, fontSize: 12.sp, fontWeight: FontWeight.w500);

  static TextStyle get bodyVerySmall => primaryFont.copyWith(
      color: AppColors.charcoal, fontSize: 10.sp, fontWeight: FontWeight.w500);
}
