import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kfaa_app/utils/app_colors.dart';
import 'package:kfaa_app/utils/app_styles.dart';
import 'package:kfaa_app/widgets/app_text_fields_border.dart';

class CustomNumberField extends StatelessWidget {
  const CustomNumberField(
      {super.key,
      required this.hint,
      required this.label,
      this.prefixIcon,
      this.suffixIcon,
      this.maxLength});

  final String hint;
  final String label;
  final Widget? prefixIcon, suffixIcon;
  final int? maxLength;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly,
        ],
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          label: Text(label),
          labelStyle: AppStyles.styleRegular16(context),
          hintText: hint,
          hintStyle: AppStyles.styleRegular16(context).copyWith(
            color: Colors.black,
          ),
          fillColor: AppColors.c3,
          filled: true,
          border: AppTextFieldsBorder.appTextFieldsBorder(),
          enabledBorder: AppTextFieldsBorder.appTextFieldsBorder(),
        ),
        maxLength: maxLength,
      ),
    );
  }
}
