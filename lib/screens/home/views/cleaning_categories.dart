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
            // img: 'assets/images/crossIcon.png',
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Row(
                children: [
                  leftSelection(),
                  SpaceHelper.horizontalSpace10,
                  rightSelection(),
                ],
              ),
            ),
          ),
          bottomSection(context),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }

  Widget bottomSection(BuildContext context) {
    return Image.asset(
      'assets/images/categoriesBottomImg.png',
      fit: BoxFit.cover,
      width: MediaQuery.of(context).size.width,
    );
  }

  Widget rightSelection() {
    return Expanded(
      flex: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 2,
            fit: FlexFit.loose,
            child: InkWell(
              onTap: () {
                Get.to(() => const DeepCleaning(),
                    transition: Transition.rightToLeft);
              },
              child: Image.asset(
                'assets/images/deepCleaning.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
          SpaceHelper.verticalSpace10,
          Flexible(
            flex: 3,
            fit: FlexFit.loose,
            child: InkWell(
              onTap: () {
                Get.to(() => const MoveInOutCleaning(),
                    transition: Transition.rightToLeft);
              },
              child: Image.asset(
                'assets/images/moveInOutCleaning.png',
                fit: BoxFit.fill,
              ),
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
          Flexible(
            flex: 3,
            child: InkWell(
              onTap: () {
                Get.to(() => const StandardCleaning(),
                    transition: Transition.rightToLeft);
              },
              child: Image.asset(
                'assets/images/standardCleaning.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SpaceHelper.verticalSpace10,
          Flexible(
            flex: 2,
            child: InkWell(
              onTap: () {
                Get.to(() => const RentalCleaning(),
                    transition: Transition.rightToLeft);
              },
              child: Image.asset(
                'assets/images/rentalCleaning.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
