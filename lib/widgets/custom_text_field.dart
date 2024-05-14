import 'package:flutter/material.dart';
import 'package:kfaa_app/utils/app_colors.dart';
import 'package:kfaa_app/utils/app_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.hint,
      this.label,
      this.prefixIcon,
      this.suffixIcon});

  final String hint;
  final String? label;
  final Widget? prefixIcon, suffixIcon;
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        label: Text("$label"),
        labelStyle: AppStyles.styleRegular16(context),
        hintText: hint,
        hintStyle: AppStyles.styleRegular16(context).copyWith(
          color: Colors.black,
        ),
        fillColor: AppColors.c3,
        filled: true,
        border: buildBorder(),
        enabledBorder: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: AppColors.c2,
      ),
    );
  }
}
