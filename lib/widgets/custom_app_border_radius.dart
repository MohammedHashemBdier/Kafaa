import 'package:flutter/material.dart';

BorderRadius customAppBorderRadius(bool isArabic) {
  return BorderRadius.only(
    bottomRight:
        isArabic ? const Radius.circular(0) : const Radius.circular(30),
    topRight: isArabic ? const Radius.circular(0) : const Radius.circular(30),
    bottomLeft: isArabic ? const Radius.circular(30) : const Radius.circular(0),
    topLeft: isArabic ? const Radius.circular(30) : const Radius.circular(0),
  );
}
