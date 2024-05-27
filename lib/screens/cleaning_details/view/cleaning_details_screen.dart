import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:time_2_clean/global_widgets/header_image.dart';
import 'package:time_2_clean/global_widgets/item_select_card.dart';
import 'package:time_2_clean/screens/cleaning_details/controller/cleaning_details_controller.dart';
import 'package:time_2_clean/utils/decoration_helper.dart';
import '../../../global_widgets/common_appbar.dart';
import '../../../utils/color_helper.dart';
import '../../../utils/space_helper.dart';
import '../../../utils/style_helper.dart';

class CleaningDetailsScreen extends StatelessWidget {
  CleaningDetailsScreen({super.key});

  final CleaningDetailsController cleaningDetailsController =
      Get.put(CleaningDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorHelper.bgColor,
      body: Column(
        children: [
          SpaceHelper.verticalSpace50,
          const CommonAppbar(
            title: 'Cleaning',
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  children: [
                    SpaceHelper.verticalSpace20,
                    _buildHeaderImage(),
                    SpaceHelper.verticalSpace10,
                    _buildInfoView(),
                    SpaceHelper.verticalSpace30,
                    _buildRoomSelectionView(),
                    SpaceHelper.verticalSpace20,
                    _buildBookCleanerView(),
                    SpaceHelper.verticalSpace20,
                    _buildDateTimeView(),
                    SpaceHelper.verticalSpace20,
                    _buildRecurringOptionView(),
                    SpaceHelper.verticalSpace20,
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  BoxDecoration _bookDecoration() => BoxDecoration(
      color: ColorHelper.primaryColor, borderRadius: BorderRadius.circular(30));

  Widget _buildRecurringOptionView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Chosse Recurring Option',
          style: StyleHelper.interSemiBold18,
        ),
        SpaceHelper.verticalSpace5,
        SizedBox(
          width: double.infinity,
          child: buildRecurringOptionView(),
        ),
      ],
    );
  }

  Widget buildRecurringOptionView() => Obx(
        () => Wrap(
          runSpacing: cleaningDetailsController.spacing.value,
          spacing: cleaningDetailsController.spacing.value,
          children: cleaningDetailsController.recurringOptions
              .map((element) => ActionChip(
                  backgroundColor: element ==
                          cleaningDetailsController
                              .selectedRecurringOption.value
                      ? ColorHelper.primaryColor
                      : ColorHelper.whiteColor,
                  label: Text(element.label),
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: element ==
                            cleaningDetailsController
                                .selectedRecurringOption.value
                        ? ColorHelper.whiteColor
                        : ColorHelper.primaryColor,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                      color: ColorHelper.primaryColor,
                      width: 1,
                    ),
                  ),
                  onPressed: () {
                    cleaningDetailsController.selectedRecurringOption.value =
                        element;
                    log(cleaningDetailsController
                        .selectedRecurringOption.value!.label
                        .toString());
                  }))
              .toList(),
        ),
      );

  Widget _buildDateTimeView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select Date  and Time',
          style: StyleHelper.interSemiBold16,
        ),
        SpaceHelper.verticalSpace5,
        Container(
          height: 50.h,
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          decoration: DecorationHelper().itemSelectCardDecoraion(),
          child: Row(
            children: [
              const Icon(Icons.calendar_month_outlined),
              SpaceHelper.horizontalSpace10,
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Select a day',
                      style: StyleHelper.interRegular12.copyWith(
                        color: ColorHelper.primaryColor,
                      )),
                  Text(
                    DateFormat('dd.MM.yyyy').format(DateTime.now()),
                    style: StyleHelper.interRegular13.copyWith(
                        color: ColorHelper.blackColor,
                        fontWeight: FontWeight.bold),
                  )
                ],
              )),
              SpaceHelper.horizontalSpace10,
              const Icon(Icons.keyboard_arrow_down_outlined)
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBookCleanerView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Book clear by ID',
          style: StyleHelper.interSemiBold18,
        ),
        SpaceHelper.verticalSpace5,
        Container(
          height: 50.h,
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          decoration: DecorationHelper().itemSelectCardDecoraion(),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller:
                      cleaningDetailsController.cleanerIdController.value,
                  decoration: const InputDecoration(
                    hintText: 'Enter ID',
                    border: InputBorder.none,
                  ),
                ),
              ),
              SpaceHelper.horizontalSpace10,
              Container(
                height: 30.h,
                width: 90.w,
                decoration: _bookDecoration(),
                child: Center(
                  child: Text(
                    'BOOK',
                    style: StyleHelper.interSemiBold11,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRoomSelectionView() {
    return Column(
      children: [
        ItemSelectCard(
          leadingImage: 'assets/images/bed_room_icon.png',
          title: 'Bed Room',
          quantity: '1',
          onPressAdd: () {
            log('on press add');
          },
          onPressRemove: () {
            log('on press remove');
          },
        ),
        SpaceHelper.verticalSpace15,
        ItemSelectCard(
          leadingImage: 'assets/images/bathroom_icon.png',
          title: 'Bathroom',
          quantity: '1',
          onPressAdd: () {},
          onPressRemove: () {},
        ),
        SpaceHelper.verticalSpace15,
        ItemSelectCard(
          leadingImage: 'assets/images/half_bath_icon.png',
          title: 'Half Bath',
          quantity: '1',
          onPressAdd: () {},
          onPressRemove: () {},
        ),
      ],
    );
  }

  Widget _buildInfoView() {
    return Column(
      children: [
        Text(
          'Information',
          style: StyleHelper.interSemiBold18,
        ),
        Text(
          'Please input your innformation for further booking!',
          style: StyleHelper.interMedium10,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildHeaderImage() {
    return const HeaderImage(headerImage: 'assets/images/cleaning_header.png');
  }
}
