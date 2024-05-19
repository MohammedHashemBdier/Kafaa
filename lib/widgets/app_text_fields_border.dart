import 'package:flutter/material.dart';
import 'package:kfaa_app/utils/app_colors.dart';

class AppTextFieldsBorder {
  static OutlineInputBorder appTextFieldsBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: AppColors.c2,
      ),
    );
  }
}
