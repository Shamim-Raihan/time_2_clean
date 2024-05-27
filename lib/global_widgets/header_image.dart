import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderImage extends StatelessWidget {
  final String headerImage;
  const HeaderImage({super.key, required this.headerImage});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      width: double.infinity,
      child: Image.asset(
        headerImage,
        fit: BoxFit.fill,
      ),
    );
  }
}
