import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:time_2_clean/utils/space_helper.dart';
import 'package:time_2_clean/utils/style_helper.dart';

class CategoriesWidget extends StatelessWidget {
  final String description;
  final String include;
  final String? notInclude;
  final String extra;

  const CategoriesWidget({
    Key? key,
    required this.description,
    required this.include,
    this.notInclude,
    required this.extra,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SpaceHelper.verticalSpace10,
          Text(
            description,
            style: StyleHelper.interRegular13,
            textAlign: TextAlign.center,
          ),
          SpaceHelper.verticalSpace15,
          Text(
            'Included:',
            style: StyleHelper.interSemiBold18,
          ),
          SpaceHelper.verticalSpace10,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/doneIcon.png',
                height: 23.h,
                width: 23.w,
              ),
              SpaceHelper.horizontalSpace10,
              Expanded(
                child: Text(
                  include,
                  style: StyleHelper.interMedium13,
                ),
              ),
            ],
          ),
          if (notInclude != null) ...[
            SpaceHelper.verticalSpace15,
            Text(
              'Not Included:',
              style: StyleHelper.interSemiBold18,
            ),
            SpaceHelper.verticalSpace10,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/crossIcon.png',
                  height: 23.h,
                  width: 23.w,
                ),
                SpaceHelper.horizontalSpace10,
                Expanded(
                  child: Text(
                    notInclude!,
                    style: StyleHelper.interMedium13,
                  ),
                ),
              ],
            ),
          ],
          SpaceHelper.verticalSpace15,
          Text(
            'Extra:',
            style: StyleHelper.interSemiBold18,
          ),
          SpaceHelper.verticalSpace10,
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/plusIcon.png',
                height: 23.h,
                width: 23.w,
              ),
              SpaceHelper.horizontalSpace10,
              Expanded(
                child: Text(
                  extra,
                  style: StyleHelper.interMedium13,
                ),
              ),
            ],
          ),
          SpaceHelper.verticalSpace30,
        ],
      ),
    );
  }
}
