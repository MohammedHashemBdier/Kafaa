import 'package:flutter/material.dart';

extension StringExtensions on String {
  int toInt() => int.parse(this);
  int? toIntOrNull() => int.tryParse(this);
  double toDouble() => double.parse(this);
  double? toDoubleOrNull() => double.tryParse(this);
  DateTime toDate() => DateTime.parse(this);
  DateTime? toDateOrNull() => DateTime.tryParse(this);
  bool isArabic() {
    String arabic = 'ابتثجحخدذرزسشصضطظعغفقكلمنهوي ةأإآءؤئى';
    for (String char in characters) if (!arabic.contains(char)) return false;
    return true;
  }
}
