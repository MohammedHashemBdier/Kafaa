import 'package:flutter/material.dart';

abstract class AppColors {
  static Color c1 = const Color(0xFF9E0D0D);
  static Color c2 = const Color(0xFFF3E2E2);
  static Color c3 = const Color.fromARGB(255, 234, 214, 214);
  static Color c4 = const Color.fromARGB(255, 241, 231, 231);
}

const MaterialColor customMaterialColors =
    MaterialColor(primaryValue, <int, Color>{
  50: Color(0xFFF3E2E2),
  100: Color(0xFFE2B6B6),
  200: Color(0xFFCF8686),
  300: Color(0xFFBB5656),
  400: Color(0xFFAD3131),
  500: Color(primaryValue),
  600: Color(0xFF960B0B),
  700: Color(0xFF8C0909),
  800: Color(0xFF820707),
  900: Color(0xFF700303),
});
const int primaryValue = 0xFF9E0D0D;

const MaterialColor customMaterialColorAccent =
    MaterialColor(customMaterialColorAccentValue, <int, Color>{
  100: Color(0xFFFF9F9F),
  200: Color(customMaterialColorAccentValue),
  400: Color(0xFFFF3939),
  700: Color(0xFFFF1F1F),
});
const int customMaterialColorAccentValue = 0xFFFF6C6C;
