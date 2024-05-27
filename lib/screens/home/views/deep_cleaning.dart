import 'package:flutter/material.dart';
import 'package:time_2_clean/global_widgets/categories_widget.dart';
import 'package:time_2_clean/global_widgets/common_appbar.dart';
import 'package:time_2_clean/utils/color_helper.dart';
import 'package:time_2_clean/utils/space_helper.dart';
import 'package:time_2_clean/utils/text_helper.dart';

class DeepCleaning extends StatelessWidget {
  const DeepCleaning({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorHelper.bgColor,
      body: Column(
        children: [
          SpaceHelper.verticalSpace50,
          const CommonAppbar(
            title: 'Deep Cleaning',
          ),
          SpaceHelper.verticalSpace10,
          const CategoriesWidget(
            description: Texthelper.deepTxt,
            include: Texthelper.deepIncludeTxt,
            notInclude: Texthelper.deepNotIncludeTxt,
            extra: Texthelper.deepExtrasTxt,
          )
        ],
      ),
    );
  }
}
