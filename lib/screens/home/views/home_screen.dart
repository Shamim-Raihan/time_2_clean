import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:time_2_clean/global_widgets/bottom_nav_bar.dart';
import 'package:time_2_clean/screens/home/views/cleaning_categories.dart';
import 'package:time_2_clean/utils/color_helper.dart';
import 'package:time_2_clean/utils/space_helper.dart';
import 'package:time_2_clean/utils/style_helper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorHelper.whiteColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SpaceHelper.verticalSpace25,
            searchSection(context),
            bludotImage(),
            SpaceHelper.verticalSpace10,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: suggestions(),
            ),
            SpaceHelper.verticalSpace10,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: offerSections(context),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: services(context),
            )
          ],
        ),
        bottomNavigationBar: CustomBottomNavBar(),
      ),
    );
  }

  Widget services(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SpaceHelper.verticalSpace20,
          Text(
            'Services',
            style: StyleHelper.interSemiBold18,
          ),
          SpaceHelper.verticalSpace10,
          InkWell(
            onTap: () {
              Get.to((const CleaningCategories()),
                  transition: Transition.rightToLeft);
            },
            child: servicsSection(
              bgColor: ColorHelper.services1stColor,
              context: context,
              title: 'House Cleaning',
              subtitle:
                  "Step into a clean and welcoming house after we're done.",
              img: 'assets/images/services1stImg.png',
            ),
          ),
          SpaceHelper.verticalSpace10,
          InkWell(
            onTap: () {
              Get.to((const CleaningCategories()),
                  transition: Transition.rightToLeft);
            },
            child: servicsSection(
              bgColor: ColorHelper.services2ndColor,
              context: context,
              title: 'Apartment Cleaning',
              subtitle: 'Clean, fresh, and ready for your apartment living.',
              img: 'assets/images/services2ndImg.png',
            ),
          ),
          SpaceHelper.verticalSpace10,
        ],
      ),
    );
  }

  Widget offerSections(BuildContext context) {
    return offerContainer(
        img: 'assets/images/salesOffer.png',
        title: '10% OFF',
        subtitle: 'once a month recurring service',
        context: context);
  }

  Widget suggestions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Suggestions',
          style: StyleHelper.interSemiBold18,
        ),
        SpaceHelper.verticalSpace10,
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics()),
          child: Row(
            children: [
              suggestionsContainer(
                  image: 'assets/images/steamCleaner.png',
                  height: 77.h,
                  width: 77.w,
                  txt: 'Steam Cleaner'),
              SpaceHelper.horizontalSpace10,
              suggestionsContainer(
                  image: 'assets/images/trashCan.png',
                  height: 71.h,
                  width: 71.w,
                  txt: 'Trash Can'),
              SpaceHelper.horizontalSpace10,
              suggestionsContainer(
                  image: 'assets/images/glutterCleaning.png',
                  height: 53.h,
                  width: 39.w,
                  txt: 'Gutter Cleaning'),
              SpaceHelper.horizontalSpace10,
              suggestionsContainer(
                  image: 'assets/images/windowCleaning.png',
                  height: 40.h,
                  width: 40.w,
                  txt: 'Window Cleaning'),
              SpaceHelper.horizontalSpace10,
              suggestionsContainer(
                  image: 'assets/images/pressureWashing.png',
                  height: 56.h,
                  width: 44.w,
                  txt: 'Pressure Washing'),
              SpaceHelper.horizontalSpace10,
              suggestionsContainer(
                  image: 'assets/images/bathroomCleaning.png',
                  height: 62.h,
                  width: 61.w,
                  txt: 'Bathroom Cleaning'),
            ],
          ),
        ),
      ],
    );
  }

  Widget bludotImage() => Image.asset(
        'assets/images/buleDot.png',
        width: double.infinity,
        height: 30.h,
        fit: BoxFit.fill,
      );

  Widget searchSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Row(
        children: [
          // SpaceHelper.horizontalSpace24,
          Container(
            height: 37.h,
            width: MediaQuery.of(context).size.width / 1.6,
            decoration: BoxDecoration(
                border: Border.all(
                  color: ColorHelper.greyIconColor,
                ),
                borderRadius: BorderRadius.circular(10.r)),
            child: Row(
              children: [
                SpaceHelper.horizontalSpace10,
                Image.asset(
                  'assets/images/search.png',
                  height: 10.h,
                  width: 10.w,
                ),
                SpaceHelper.horizontalSpace5,
                Text(
                  'Where would you like to clean?',
                  style: StyleHelper.nunitoSemi12,
                )
              ],
            ),
          ),
          SpaceHelper.horizontalSpace5,
          Row(
            children: [
              Container(
                height: 37.h,
                width: 39.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: ColorHelper.blueColor),
                child: Center(
                  child: Image.asset(
                    'assets/images/searchIcon.png',
                    height: 15.h,
                    width: 15.w,
                  ),
                ),
              ),
              SpaceHelper.horizontalSpace15,
              Icon(
                Icons.notifications,
                size: 25.sp,
                color: ColorHelper.greyIconColor,
              )
            ],
          )
        ],
      ),
    );
  }

  Widget suggestionsContainer({
    required String image,
    required double height,
    required double width,
    required String txt,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 85.h,
          width: 98.w,
          clipBehavior: Clip.antiAlias,
          // constraints: BoxConstraints,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 0,
                    blurRadius: 1,
                    offset: const Offset(0, 1)),
              ],
              border: Border.all(color: ColorHelper.greyIconColor),
              borderRadius: BorderRadius.circular(7.r)),
          child: Center(
            child: Image.asset(
              image,
              width: width,
              height: height,
            ),
          ),
        ),
        SpaceHelper.verticalSpace5,
        Padding(
          padding: EdgeInsets.only(left: 4.w),
          child: Text(
            txt,
            style: StyleHelper.interBold10Black,
          ),
        )
      ],
    );
  }

  Widget offerContainer({
    required BuildContext context,
    required title,
    required subtitle,
    required img,
  }) {
    return Container(
      height: 110.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17.r),
          color: const Color(0xff1A83CB)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.only(left: 15.w, top: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: StyleHelper.interSemiBold20,
                  ),
                  SpaceHelper.verticalSpace3,
                  Text(
                    subtitle,
                    style: StyleHelper.interBold10,
                  ),
                  SpaceHelper.verticalSpace15,
                  Container(
                    width: 120.w,
                    height: 25.h,
                    decoration: BoxDecoration(
                        color: const Color(0xff1374B7),
                        borderRadius: BorderRadius.circular(19.r)),
                    child: Center(
                      child: Text(
                        'BOOK NOW',
                        style: StyleHelper.interRegular12,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Image.asset(
            img,
            fit: BoxFit.cover,
          )
        ],
      ),
    );
  }

  Widget servicsSection({
    required BuildContext context,
    required bgColor,
    required title,
    required subtitle,
    required img,
  }) {
    return Container(
      height: 90.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17.r), color: bgColor),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 15.w),
            child: SizedBox(
              width: 120.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: StyleHelper.poppinsSemi16,
                  ),
                  SpaceHelper.verticalSpace3,
                  Text(
                    subtitle,
                    style: StyleHelper.interMedium10,
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          SizedBox(
            // color: Colors.red,
            // height: 128.h,
            width: MediaQuery.of(context).size.width / 2 - 3.3.w,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(17.r),
              child: Image.asset(
                img,
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }
}
