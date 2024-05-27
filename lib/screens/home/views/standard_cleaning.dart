import 'package:flutter/material.dart';
import 'package:time_2_clean/global_widgets/categories_widget.dart';
import 'package:time_2_clean/global_widgets/common_appbar.dart';
import 'package:time_2_clean/utils/color_helper.dart';
import 'package:time_2_clean/utils/space_helper.dart';
import 'package:time_2_clean/utils/text_helper.dart';

class StandardCleaning extends StatelessWidget {
  const StandardCleaning({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorHelper.bgColor,
      body: Column(
        children: [
          SpaceHelper.verticalSpace50,
          const CommonAppbar(
            title: 'Standard Cleaning',
          ),
          SpaceHelper.verticalSpace10,
          const CategoriesWidget(
            description: Texthelper.standardTxt,
            include: Texthelper.standardIncludeTxt,
            notInclude: Texthelper.standardNotIncludeTxt,
            extra: Texthelper.standardExtrasTxt,
          )
        ],
      ),
    );
  }
}
