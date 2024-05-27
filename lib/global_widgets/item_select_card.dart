import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:time_2_clean/utils/color_helper.dart';
import 'package:time_2_clean/utils/decoration_helper.dart';
import 'package:time_2_clean/utils/space_helper.dart';

class ItemSelectCard extends StatelessWidget {
  final String leadingImage;
  final String title;
  final String quantity;
  const ItemSelectCard(
      {super.key,
      required this.leadingImage,
      required this.title,
      required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      decoration: DecorationHelper().itemSelectCardDecoraion(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
        child: Row(
          children: [
            Image.asset(leadingImage),
            SpaceHelper.horizontalSpace10,
            Expanded(child: Text(title)),
            Container(
              height: 25.h,
              decoration: DecorationHelper().quantityDecoration(),
              child: Row(
                children: [
                  Container(
                    height: 25.h,
                    width: 30.h,
                    decoration: actionDecoration(),
                    child: const Icon(Icons.remove),
                  ),
                  SizedBox(
                    width: 25.w,
                    child: const Center(child: Text('1')),
                  ),
                  Container(
                    height: 25.h,
                    width: 30.h,
                    decoration: actionDecoration(),
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  BoxDecoration actionDecoration() {
    return BoxDecoration(
        border: Border.all(
          width: 1,
          color: ColorHelper.greyColor,
        ),
        borderRadius: BorderRadius.circular(5));
  }
}
