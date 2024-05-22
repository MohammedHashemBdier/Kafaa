import 'package:flutter/material.dart';
import 'package:kafaa_app/utils/app_colors.dart';

class CustomAppTextFieldsBorder {
  static OutlineInputBorder appTextFieldsBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: AppColors.c2,
      ),
    );
  }
}
