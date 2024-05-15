import 'package:flutter/material.dart';

BorderRadius appBorderRadius(bool isArabic) {
  return BorderRadius.only(
    bottomRight:
        isArabic ? const Radius.circular(0) : const Radius.circular(50),
    topRight: isArabic ? const Radius.circular(0) : const Radius.circular(50),
    bottomLeft: isArabic ? const Radius.circular(50) : const Radius.circular(0),
    topLeft: isArabic ? const Radius.circular(50) : const Radius.circular(0),
  );
}
