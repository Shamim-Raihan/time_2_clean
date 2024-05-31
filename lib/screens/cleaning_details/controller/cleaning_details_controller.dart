import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:time_2_clean/global_widgets/common_pricing_widgets.dart';

import '../../../models/recurring_option_model.dart';

class CleaningDetailsController extends GetxController {
  var cleanerIdController = TextEditingController().obs;
  var spacing = 8.0.obs;
  var selectedCleanerGender = ''.obs;
  var selectedCleanerPerson = ''.obs;


  var recurringOptions = <RecurringOptionModel>[
    RecurringOptionModel(
      label: 'Weekly',
    ),
    RecurringOptionModel(
      label: 'Bi-Weekly',
    ),
    RecurringOptionModel(
      label: 'Monthly',
    ),
    RecurringOptionModel(
      label: 'None',
    ),
  ];
  var selectedRecurringOption = Rxn<RecurringOptionModel>();
  final List<CommonPricingWidgets> widgetsList = [
    const CommonPricingWidgets(
        image: 'assets/images/pricingImgBlue.png',
        title: 'TIER 2',
        price: '250',
        initialStartValue: 0,
        initialEndValue: 80,
        minValue: 0,
        maxValue: 100,
        rating: '4.5',
        communication: 3,
        overall: 3,
        performance: 4,
        color: Colors.white),
    const CommonPricingWidgets(
      image: 'assets/images/pricingImgGolden.png',
      title: 'TIER 1',
      price: '300',
      initialStartValue: 0,
      initialEndValue: 100,
      minValue: 0,
      maxValue: 100,
      rating: '4.8',
      communication: 4,
      overall: 2,
      performance: 3,
      color: Color(0xff0A1E38),
    ),
    const CommonPricingWidgets(
      image: 'assets/images/pricingImgBlue.png',
      title: 'TIER 3',
      price: '200',
      initialStartValue: 0,
      initialEndValue: 60,
      minValue: 0,
      maxValue: 100,
      rating: '4.2',
      communication: 2,
      overall: 4,
      performance: 2,
      color: Colors.white,
    ),
  ].obs;
}
