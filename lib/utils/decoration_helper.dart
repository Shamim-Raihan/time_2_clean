import 'package:flutter/material.dart';
import 'package:time_2_clean/utils/color_helper.dart';

class  DecorationHelper {
  BoxDecoration itemSelectCardDecoraion () {
    return BoxDecoration(
      border: Border
      .all(width: 1, color: ColorHelper.containerBorderColor,), borderRadius: BorderRadius.circular(6)
    );
  }

    BoxDecoration quantityDecoration () {
    return BoxDecoration(
      border: Border
      .all(width: 1, color: ColorHelper.greyColor,), borderRadius: BorderRadius.circular(6)
    );
  }
}