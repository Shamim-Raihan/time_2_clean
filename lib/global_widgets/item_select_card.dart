import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:time_2_clean/utils/color_helper.dart';
import 'package:time_2_clean/utils/decoration_helper.dart';
import 'package:time_2_clean/utils/space_helper.dart';
import 'package:time_2_clean/utils/style_helper.dart';

class ItemSelectCard extends StatelessWidget {
  final String leadingImage;
  final String title;
  final String quantity;
  final VoidCallback onPressAdd;
  final VoidCallback onPressRemove;
  const ItemSelectCard({
    super.key,
    required this.leadingImage,
    required this.title,
    required this.quantity,
    required this.onPressAdd,
    required this.onPressRemove,
  });

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
            Expanded(
                child: Text(
              title,
              style: StyleHelper.interMedium13,
            )),
            Container(
              height: 25.h,
              decoration: DecorationHelper().quantityDecoration(),
              child: Row(
                children: [
                  InkWell(
                    onTap: onPressRemove,
                    child: Container(
                      height: 25.h,
                      width: 30.w,
                      decoration: actionDecoration(forRemove: true),
                      child: Icon(
                        Icons.remove,
                        color: ColorHelper.primaryColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 25.w,
                    child: Center(
                        child: Text(
                      '1',
                      style: StyleHelper.interRegularBold13,
                    )),
                  ),
                  InkWell(
                    onTap: onPressAdd,
                    child: Container(
                      height: 28.h,
                      width: 30.w,
                      decoration: actionDecoration(forRemove: false),
                      child: Icon(
                        Icons.add,
                        color: ColorHelper.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  BoxDecoration actionDecoration({required forRemove}) {
    return BoxDecoration(
      border: forRemove
          ? Border(
              right: BorderSide(
                width: 1,
                color: ColorHelper.lightGreyColor,
              ),
            )
          : Border(
              left: BorderSide(
                width: 1,
                color: ColorHelper.lightGreyColor,
              ),
            ),
      borderRadius: forRemove
          ? const BorderRadius.only(
              topRight: Radius.circular(5),
              bottomRight: Radius.circular(5),
            )
          : const BorderRadius.only(
              topLeft: Radius.circular(5),
              bottomLeft: Radius.circular(5),
            ),
    );
  }
}
