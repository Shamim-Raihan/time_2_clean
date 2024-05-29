import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:time_2_clean/global_widgets/common_appbar.dart';

import 'package:time_2_clean/screens/cleaning_details/controller/cleaning_details_controller.dart';
import 'package:time_2_clean/utils/color_helper.dart';
import 'package:time_2_clean/utils/space_helper.dart';
import 'package:time_2_clean/utils/style_helper.dart';

class LocationRange extends StatelessWidget {
  LocationRange({super.key});
  final CleaningDetailsController cleaningDetailsController =
      Get.put(CleaningDetailsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorHelper.bgColor,
      body: Stack(
        children: [
          Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 2 - 150.h,
                    width: MediaQuery.of(context).size.width,
                  ),
                  Image.asset(
                    'assets/images/bgMap.png',
                    fit: BoxFit.cover,
                    height: 140.h,
                    width: double.infinity,
                  ),
                  Container(
                    width: double.infinity,
                    height: 140.h,
                    color: ColorHelper.primaryColor.withOpacity(0.6),
                  ),
                  Positioned(
                      child: CommonAppbar(
                    title: 'Select Location',
                    color: Colors.white,
                    bgcolor: ColorHelper.blueColor,
                    iconcolor: ColorHelper.bgColor,
                  )),
                  _buildLocationDetails(context)
                ],
              ),
              _buildSearchCleanerButtonView(),
              SpaceHelper.verticalSpace25,
              Obx(() {
                return Center(
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: 400.h,
                      autoPlay: false,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: false,
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      viewportFraction: 0.7,
                      aspectRatio: 2.0,
                      enlargeCenterPage: true,
                      initialPage: 1,
                    ),
                    items: cleaningDetailsController.widgetsList.map((widget) {
                      return Builder(
                        builder: (BuildContext context) {
                          return SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: widget,
                          );
                        },
                      );
                    }).toList(),
                  ),
                );
              }),
            ],
          ),
          Positioned(
              bottom: 0,
              child: Image.asset(
                'assets/images/pricingBottomImg.png',
                height: 190.h,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ))
        ],
      ),
    );
  }

  Widget _buildSearchCleanerButtonView() {
    return Container(
      height: 37.h,
      width: 215.w,
      decoration: BoxDecoration(
          color: ColorHelper.primaryColor,
          borderRadius: BorderRadius.circular(7.r)),
      child: Center(
        child: Text(
          'Search Cleaners',
          style: StyleHelper.interBold16,
        ),
      ),
    );
  }

  Widget _buildLocationDetails(BuildContext context) {
    return Positioned(
        top: 100.h,
        left: 24.w,
        right: 24.w,
        child: Container(
          height: 75.h,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 0,
                    blurRadius: 1,
                    offset: const Offset(0, 1)),
              ],
              color: Colors.white),
          child: Padding(
            padding: EdgeInsets.all(15.r),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [_buildLocationNameView(), _buildChangeButtonView()],
            ),
          ),
        ));
  }

  Widget _buildChangeButtonView() {
    return Expanded(
      child: Container(
          height: 37.h,
          decoration: BoxDecoration(
            color: ColorHelper.primaryColor,
            borderRadius: BorderRadius.circular(100.r),
          ),
          child: Center(
            child: Text(
              'Change',
              style: StyleHelper.interBold16,
            ),
          )),
    );
  }

  Widget _buildLocationNameView() {
    return Expanded(
      flex: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: ColorHelper.primaryColor,
                ),
                SpaceHelper.horizontalSpace3,
                Expanded(
                  child: Text(
                    'Location (within 10 miles)',
                    style: StyleHelper.interRegular12Black,
                  ),
                )
              ],
            ),
          ),
          SpaceHelper.verticalSpace5,
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 7.w),
              child: Text(
                'Los Angeles ',
                style: StyleHelper.interSemiBold18,
              ),
            ),
          )
        ],
      ),
    );
  }
}
