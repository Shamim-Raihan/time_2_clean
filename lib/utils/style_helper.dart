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
}
