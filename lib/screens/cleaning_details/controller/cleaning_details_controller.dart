import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
}
