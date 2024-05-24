import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:time_2_clean/utils/space_helper.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          topImg(context),
          subBottomImg(context),
          footer(context),
        ],
      ),
    );
  }

  Widget topImg(BuildContext context) {
    return Positioned(
        top: 0,
        child: Image.asset(
          'assets/images/topImg.png',
          width: MediaQuery.of(context).size.width - 30.w,
          height: 200.h,
          fit: BoxFit.fill,
        ));
  }

  Widget subtop(BuildContext context) {
    return Positioned(
        top: 104,
        child: Image.asset(
          'assets/images/time 2 cleann 2.png',
          width: MediaQuery.of(context).size.width,
          height: 30.h,
        ));
  }

  Widget footer(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Stack(
        children: [
          Image.asset(
            'assets/images/bottomImg.png',
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
            height: 200.h,
          ),
          Positioned(
            bottom: 100.h,
            left: 30.w,
            right: 30.w,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 1.h,
                      width: 96.w,
                      color: Colors.white,
                    ),
                    SpaceHelper.horizontalSpace10,
                    Text(
                      'Or Continue with',
                      style: TextStyle(
                          color: const Color(0xffABB3BB),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400),
                    ),
                    SpaceHelper.horizontalSpace10,
                    Container(
                      height: 1.h,
                      width: 96.w,
                      color: Colors.white,
                    )
                  ],
                ),
                SpaceHelper.horizontalSpace10,
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget subBottomImg(BuildContext context) {
    return Positioned(
      bottom: 153.h,
      child: Image.asset(
        'assets/images/bottomGroupImg.png',
        width: MediaQuery.of(context).size.width - 30.w,
        height: 50.h,
      ),
    );
  }
}
