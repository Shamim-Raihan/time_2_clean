import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:time_2_clean/global_widgets/bottom_nav_bar.dart';
import 'package:time_2_clean/global_widgets/common_appbar.dart';
import 'package:time_2_clean/screens/home/views/deep_cleaning.dart';
import 'package:time_2_clean/screens/home/views/move_in_out_cleaning.dart';
import 'package:time_2_clean/screens/home/views/rental_cleaning.dart';
import 'package:time_2_clean/screens/home/views/standard_cleaning.dart';
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
          const CommonAppbar(
            title: 'What Do You Need?',
          ),
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
        flex: 1,
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
          InkWell(
            onTap: () {
              Get.to(() => const DeepCleaning(),
                  transition: Transition.rightToLeft);
            },
            child: Image.asset(
              'assets/images/deepCleaning.png',
              height: 135.h,
            ),
          ),
          InkWell(
            onTap: () {
              Get.to(() => const MoveInOutCleaning(),
                  transition: Transition.rightToLeft);
            },
            child: Image.asset(
              'assets/images/moveInOutCleaning.png',
              height: 260.h,
            ),
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
          InkWell(
            onTap: () {
              Get.to(() => const StandardCleaning(),
                  transition: Transition.rightToLeft);
            },
            child: Image.asset(
              'assets/images/standardCleaning.png',
              height: 210.h,
            ),
          ),
          InkWell(
            onTap: () {
              Get.to(() => const RentalCleaning(),
                  transition: Transition.rightToLeft);
            },
            child: Image.asset(
              'assets/images/rentalCleaning.png',
              height: 162.h,
            ),
          ),
        ],
      ),
    );
  }
}
