import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:time_2_clean/global_widgets/categories_widget.dart';
import 'package:time_2_clean/global_widgets/common_appbar.dart';
import 'package:time_2_clean/global_widgets/header_image.dart';
import 'package:time_2_clean/utils/color_helper.dart';
import 'package:time_2_clean/utils/space_helper.dart';
import 'package:time_2_clean/utils/style_helper.dart';
import 'package:time_2_clean/utils/text_helper.dart';

class MoveInOutCleaning extends StatelessWidget {
  const MoveInOutCleaning({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorHelper.bgColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CommonAppbar(
              title: 'Move in/Out',
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: const HeaderImage(
                headerImage: 'assets/images/categoriesTopImg.png',
              ),
            ),
            SpaceHelper.verticalSpace10,
            const CategoriesWidget(
              description: Texthelper.moveInOutTxt,
              include: Texthelper.moveInOutIncludeTxt,
              extra: Texthelper.moveInOutExtrasTxt,
            ),
            _buildSelectButtonView()
          ],
        ),
      ),
    );
  }

  Widget _buildSelectButtonView() {
    return Center(
      child: Container(
        height: 37.h,
        width: 158.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.r),
          color: ColorHelper.primaryColor,
        ),
        child: Center(
          child: Text(
            'Select',
            style: StyleHelper.interBold16,
          ),
        ),
      ),
    );
  }
}
