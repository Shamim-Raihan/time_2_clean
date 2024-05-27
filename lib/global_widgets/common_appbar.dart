import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:time_2_clean/utils/color_helper.dart';
import 'package:time_2_clean/utils/style_helper.dart';

class CommonAppbar extends StatelessWidget {
  final String title;
  final String? img;
  const CommonAppbar({super.key, required this.title, this.img});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 35.h, bottom: 10.h),
      child: SizedBox(
        height: 45.h,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                height: 50.h,
                width: 65.w,
                decoration: BoxDecoration(
                    color: ColorHelper.primaryColor,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(70.r),
                        topRight: Radius.circular(70.r))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 30.w,
                      height: 25.h,
                      decoration: BoxDecoration(
                        color: ColorHelper.blueColor,
                        border: Border.all(color: const Color(0xff7D7D7D)),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: Colors.white,
                          size: 15.sp,
                        ),
                      ),
                    ),
                    RotatedBox(
                      quarterTurns: 3,
                      child: Text(
                        'Back',
                        style: StyleHelper.interSemiBold11,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // if (img != null) SizedBox(width: 5.w),
                  if (img != null) Image.asset(img!, height: 35.h, width: 35.w),
                  if (img != null) SizedBox(width: 5.w),
                  Text(
                    title,
                    style: StyleHelper.interSemiBold20Black,
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 18.w),
              child: SizedBox(
                height: 35.h,
                width: 35.w,
                child: Image.asset('assets/images/filterIcon.png'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
