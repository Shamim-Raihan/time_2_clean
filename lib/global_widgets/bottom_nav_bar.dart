import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:time_2_clean/common/app_contoller.dart';
import 'package:time_2_clean/screens/chat/view/chat_list_screen.dart';
import 'package:time_2_clean/screens/home/views/home_screen.dart';
import 'package:time_2_clean/screens/settings/view/settings_screen.dart';
import 'package:time_2_clean/utils/color_helper.dart';

class CustomBottomNavBar extends StatelessWidget {
  CustomBottomNavBar({super.key});
  final AppContoller appContoller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            color: ColorHelper.whiteColor,
            border: Border.all(width: 1, color: Colors.grey.shade200)),
        height: 60.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildNavItem(index: 0, icon: Icons.home),
            buildNavItem(index: 1, icon: Icons.chat),
            buildNavItem(index: 2, icon: Icons.person),
          ],
        ),
      ),
    );
  }

  InkWell buildNavItem({required int index, required IconData icon}) {
    return InkWell(
      onTap: () {
        appContoller.selectedBottomItem.value = index;
        if (index == 0) {
          Get.offAll(() => const HomeScreen(),
              transition: Transition.noTransition);
        }
        if (index == 1) {
          Get.offAll(() => const ChatListScreen(),
              transition: Transition.noTransition);
        }
        if (index == 2) {
          Get.offAll(() => const SettingsScreen(),
              transition: Transition.noTransition);
        }
      },
      child: Container(
          width: 40.h,
          height: 30.h,
          decoration: BoxDecoration(
              color: appContoller.selectedBottomItem.value == index
                  ? ColorHelper.primaryColor
                  : ColorHelper.primaryColorwithOpacity,
              borderRadius: BorderRadius.circular(10)),
          child: Icon(
            icon,
            color: appContoller.selectedBottomItem.value == index
                ? ColorHelper.whiteColor
                : ColorHelper.primaryColor,
          )),
    );
  }
}
