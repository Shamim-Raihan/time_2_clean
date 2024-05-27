import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:time_2_clean/global_widgets/bottom_nav_bar.dart';
import 'package:time_2_clean/global_widgets/common_appbar.dart';
import 'package:time_2_clean/utils/color_helper.dart';
import 'package:time_2_clean/utils/space_helper.dart';

class CleaningCategories extends StatelessWidget {
  const CleaningCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorHelper.bgColor,
      body: Column(
        children: [
          SpaceHelper.verticalSpace50,
          const CommonAppbar(
            title: 'What Do You Need?',
          ),
          // SpaceHelper.verticalSpace20,
          SizedBox(
            // color: Colors.red,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: EdgeInsets.only(left: 12.w, right: 12.w),
              child: Row(
                children: [
                  leftSelection(),
                  SpaceHelper.horizontalSpace10,
                  rightSelection(),
                ],
              ),
            ),
          ),
          bottomSection(context)
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }

  Widget bottomSection(BuildContext context) {
    return Expanded(
        child: Image.asset(
      'assets/images/categoriesBottomImg.png',
      fit: BoxFit.cover,
      width: MediaQuery.of(context).size.width,
    ));
  }

  Widget rightSelection() {
    return Expanded(
      flex: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/deepCleaning.png',
            height: 135.h,
          ),
          Image.asset(
            'assets/images/moveInOutCleaning.png',
            height: 260.h,
          ),
        ],
      ),
    );
  }

  Widget leftSelection() {
    return Expanded(
      flex: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/standardCleaning.png',
            height: 210.h,
          ),
          Image.asset(
            'assets/images/rentalCleaning.png',
            height: 162.h,
          ),
        ],
      ),
    );
  }
}
