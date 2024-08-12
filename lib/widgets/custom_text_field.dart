import 'package:flutter/material.dart';
import 'package:kafaa_app/utils/app_colors.dart';
import 'package:kafaa_app/utils/app_styles.dart';
import 'package:kafaa_app/widgets/custom_app_text_fields_border.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    this.label = '',
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    this.onTap,
    this.onChanged,
    this.enabled,
    this.maxLength,
    this.initialValue,
    this.readOnly = false,
  });

  final String hint;
  final String label;
  final Widget? prefixIcon, suffixIcon;
  final TextEditingController? controller;
  final void Function()? onTap;
  final void Function(String value)? onChanged;
  final int? maxLength;
  final bool? enabled;
  final String? initialValue;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        elevation: 3,
        child: TextFormField(
          initialValue: initialValue,
          enabled: enabled,
          readOnly: readOnly,
          controller: controller,
          onChanged: onChanged,
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            label: Text(label),
            labelStyle: AppStyles.styleRegular16(context),
            hintText: hint,
            hintStyle: AppStyles.styleRegular16(context).copyWith(
              color: AppColors.c5,
            ),
            fillColor: AppColors.c3,
            filled: true,
            border: CustomAppTextFieldsBorder.appTextFieldsBorder(),
            enabledBorder: CustomAppTextFieldsBorder.appTextFieldsBorder(),
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
