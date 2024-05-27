import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:time_2_clean/utils/color_helper.dart';

class StyleHelper {
  static TextStyle headline1 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w700,
    fontFamily: 'PlusJakartaSans',
    color: Colors.black,
  );
  static TextStyle title = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    fontFamily: 'PlusJakartaSans',
    color: Colors.black,
  );
  static TextStyle subtitle = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    fontFamily: 'PlusJakartaSans',
    color: Colors.black,
  );
  static TextStyle agreeText = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    fontFamily: 'PlusJakartaSans',
    color: ColorHelper.greyColor,
  );
  static TextStyle agreeTextBold = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w700,
    fontFamily: 'PlusJakartaSans',
    color: ColorHelper.greyColor,
  );

  static TextStyle blueTextBold = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w700,
    fontFamily: 'PlusJakartaSans',
    color: ColorHelper.primaryColor,
  );
  static TextStyle interSemiBold18 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    fontFamily: 'Inter',
    color: const Color(0xff0F1225),
  );
  static TextStyle interSemiBold20 = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    fontFamily: 'Inter',
    color: Colors.white,
  );
  static TextStyle interSemiBold20Black = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    fontFamily: 'Inter',
    color: ColorHelper.blackColor,
  );
  static TextStyle interSemiBold11 = TextStyle(
    fontSize: 11.sp,
    fontWeight: FontWeight.w600,
    fontFamily: 'Inter',
    color: Colors.white,
  );
  static TextStyle interBold10 = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w700,
    fontFamily: 'Inter',
    color: Colors.white,
  );
  static TextStyle interBold10Black = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w700,
    fontFamily: 'Inter',
    color: const Color(0xff0F1225),
  );
  static TextStyle interRegular12 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    fontFamily: 'Inter',
    color: Colors.white,
  );
  static TextStyle interMedium10 = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w400,
    fontFamily: 'Inter',
    color: const Color(0xff0F1225),
  );
  static TextStyle poppinsSemi16 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    fontFamily: 'Poppins',
    color: const Color(0xff0F1225),
  );
  static TextStyle nunitoSemi12 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    fontFamily: 'NunitoSans',
    color: ColorHelper.greyIconColor,
  );
}
