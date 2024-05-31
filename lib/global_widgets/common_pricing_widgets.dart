import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:time_2_clean/utils/color_helper.dart';
import 'package:time_2_clean/utils/space_helper.dart';
import 'package:time_2_clean/utils/style_helper.dart';

class CommonPricingWidgets extends StatefulWidget {
  final String title;
  final String price;
  final String rating;
  final int communication;
  final int performance;
  final int overall;
  final String image;
  final int? cleaningTime;
  final double initialStartValue;
  final double initialEndValue;
  final double minValue;
  final double maxValue;
  final Color color;

  const CommonPricingWidgets(
      {super.key,
      required this.title,
      required this.price,
      required this.rating,
      required this.communication,
      required this.overall,
      required this.performance,
      required this.image,
      this.cleaningTime,
      required this.initialStartValue,
      required this.initialEndValue,
      required this.minValue,
      required this.maxValue,
      required this.color});

  @override
  CommonPricingWidgetsState createState() => CommonPricingWidgetsState();
}

class CommonPricingWidgetsState extends State<CommonPricingWidgets> {
  late RangeValues _currentRangeValues;

  @override
  void initState() {
    super.initState();
    _currentRangeValues =
        RangeValues(widget.initialStartValue, widget.initialEndValue);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 270.h,
          width: MediaQuery.of(context).size.width - 120.w,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(20.r)),
          child: Column(
            children: [
              Container(
                height: 240.h,
                width: MediaQuery.of(context).size.width - 120.w,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(widget.image), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(top: 5.h, right: 10.w),
                        child: Image.asset(
                          'assets/images/pricingBadge.png',
                          height: 26.h,
                          width: 36.w,
                        ),
                      ),
                    ),
                    Text(
                      widget.title,
                      style: StyleHelper.interBold24(widget.color),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 6.h, right: 3.w),
                          child: Image.asset(
                            'assets/images/dollarIcon.png',
                            width: 8.w,
                            height: 13.h,
                            fit: BoxFit.contain,
                            color: widget.color,
                          ),
                        ),
                        Text(widget.price,
                            style: StyleHelper.interBold34(widget.color)),
                        Padding(
                          padding: EdgeInsets.only(top: 10.h),
                          child: Text(
                            'Due',
                            style: StyleHelper.interRegular13Tier(widget.color),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SliderTheme(
                            data: const SliderThemeData(
                              rangeThumbShape: CircleThumbShape(),
                            ),
                            child: RangeSlider(
                              values: _currentRangeValues,
                              min: widget.minValue,
                              max: widget.maxValue,
                              // divisions: 100,
                              activeColor: ColorHelper.primaryColor,
                              inactiveColor: const Color(0xffEAEAEA),
                              onChanged: (RangeValues values) {
                                setState(() {
                                  _currentRangeValues =
                                      RangeValues(widget.minValue, values.end);
                                });
                              },
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${widget.minValue} Sq.ft',
                                style:
                                    StyleHelper.interBold10Tier(widget.color),
                              ),
                              Text(
                                '${_currentRangeValues.end.round()}',
                                style:
                                    StyleHelper.interBold10Tier(widget.color),
                              ),
                              Text(
                                '${widget.maxValue} Sq.ft',
                                style:
                                    StyleHelper.interBold10Tier(widget.color),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SpaceHelper.verticalSpace10,
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          widget.rating,
                                          style: StyleHelper.interBold34(
                                              widget.color),
                                          // style: TextStyle(fontSize: 34.sp),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.only(top: 7.h),
                                          child: Text(
                                            'Out of 5',
                                            style: StyleHelper.interBold10Tier(
                                                widget.color),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Communication',
                                          style: StyleHelper.interSemiBold8Tier(
                                              widget.color),
                                          softWrap: false,
                                        ),
                                      ),
                                      Expanded(
                                          child: StarRating(
                                              rating: widget.communication)),
                                    ],
                                  ),
                                  SpaceHelper.horizontalSpace5,
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Performance',
                                          style: StyleHelper.interSemiBold8Tier(
                                              widget.color),
                                        ),
                                      ),
                                      Expanded(
                                          child: StarRating(
                                              rating: widget.performance)),
                                    ],
                                  ),
                                  SpaceHelper.horizontalSpace5,
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Overall',
                                          style: StyleHelper.interSemiBold8Tier(
                                              widget.color),
                                        ),
                                      ),
                                      Expanded(
                                          child: StarRating(
                                              rating: widget.overall)),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SpaceHelper.verticalSpace3,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.only(left: 6.w),
                      child: const Row(
                        children: [
                          Icon(Icons.timer_outlined),
                          Text(' Cleaning time'),
                        ],
                      ),
                    ),
                  ),
                  const Expanded(child: Text('1hr 22min'))
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

class CircleThumbShape extends RangeSliderThumbShape {
  const CircleThumbShape({this.thumbRadius = 10.0});

  final double thumbRadius;

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required SliderThemeData sliderTheme,
    bool? isDiscrete,
    bool? isEnabled,
    bool? isOnTop,
    TextDirection? textDirection,
    Thumb? thumb,
    bool? isPressed,
  }) {
    final Canvas canvas = context.canvas;

    final Paint fillPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final Paint borderPaint = Paint()
      ..color = ColorHelper.primaryColor
      ..strokeWidth = 6
      ..style = PaintingStyle.stroke;

    canvas
      ..drawCircle(center, thumbRadius, fillPaint)
      ..drawCircle(center, thumbRadius, borderPaint);
  }
}

class StarRating extends StatelessWidget {
  final int rating;
  final int maxRating;
  final IconData filledStar;
  final IconData unfilledStar;
  final Color color;

  const StarRating({
    Key? key,
    required this.rating,
    this.maxRating = 5,
    this.filledStar = Icons.star,
    this.unfilledStar = Icons.star_border,
    this.color = const Color(0xffFF9900),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> stars = [];
    for (int i = 1; i <= maxRating; i++) {
      stars.add(
        Icon(
          i <= rating ? filledStar : unfilledStar,
          color: color,
          size: 10.sp,
        ),
      );
    }
    return Row(children: stars);
  }
}
