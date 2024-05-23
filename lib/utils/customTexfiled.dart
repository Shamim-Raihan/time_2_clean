import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final bool obscureText;

  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.suffixIcon,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10.w),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1.w, color: const Color(0xFFD0D0D0)),
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
      height: 48.h,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle:
                TextStyle(fontSize: 14.sp, color: const Color(0xffABB3BB)),
            suffixIcon: suffixIcon,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
