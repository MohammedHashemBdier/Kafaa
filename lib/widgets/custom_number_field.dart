import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kafaa_app/utils/app_colors.dart';
import 'package:kafaa_app/utils/app_styles.dart';
import 'package:kafaa_app/widgets/custom_app_text_fields_border.dart';

class CustomNumberField extends StatelessWidget {
  const CustomNumberField({
    super.key,
    this.hint,
    this.label = '',
    this.prefixIcon,
    this.suffixIcon,
    this.maxLength,
    this.controller,
    this.onTap,
    this.onChanged,
    this.enabled,
    this.initialValue,
    this.validator,
  });

  final String? hint;
  final String label;
  final Widget? prefixIcon, suffixIcon;
  final TextEditingController? controller;
  final Function()? onTap;
  final void Function(String value)? onChanged;
  final int? maxLength;
  final bool? enabled;
  final String? initialValue;
  final String? Function(String? value)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        elevation: 3,
        child: TextFormField(
          validator: validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: controller,
          onChanged: onChanged,
          initialValue: initialValue,
          enabled: enabled,
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp(r'[0-9+\-]')),
          ],
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
          maxLength: maxLength,
          onTap: onTap,
        ),
      ),
    );
  }
}
