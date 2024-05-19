import 'package:flutter/material.dart';

Future<DateTime?> selectDate(BuildContext context) async {
  DateTime selectedDate = DateTime.now();

  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: selectedDate,
    firstDate: DateTime(1900),
    lastDate: DateTime(2101),
  );

  return picked;
}
