import 'package:flutter/material.dart';

class RecurringOptionModel {
  final String label;

  RecurringOptionModel({
    required this.label,
  });

  RecurringOptionModel copy({
    required String label,
    required IconData icon,
    required Color iconColor,
  }) =>
      RecurringOptionModel(
        label: label,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecurringOptionModel &&
          runtimeType == other.runtimeType &&
          label == other.label;

  @override
  int get hashCode => label.hashCode;
}