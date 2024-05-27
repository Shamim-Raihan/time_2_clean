import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:time_2_clean/global_widgets/common_appbar.dart';
import 'package:time_2_clean/global_widgets/header_image.dart';
import 'package:time_2_clean/global_widgets/item_select_card.dart';
import '../../../utils/color_helper.dart';
import '../../../utils/space_helper.dart';
import '../../../utils/style_helper.dart';

class CleaningDetailsScreen extends StatelessWidget {
  const CleaningDetailsScreen({super.key});

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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                SpaceHelper.verticalSpace20,
                _buildHeaderImage(),
                SpaceHelper.verticalSpace10,
                _buildInfoView(),
                SpaceHelper.verticalSpace10,
                _buildSelectionView(),
              ],
            ),
          )
        ],
      ),
    );
  }

  _buildSelectionView() {
    return const SingleChildScrollView(
      physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      child: ItemSelectCard(
          leadingImage: 'assets/images/bed_room_icon.png',
          title: 'Bed Room',
          quantity: '1'),
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
