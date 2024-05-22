import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kafaa_app/utils/app_colors.dart';
import 'package:kafaa_app/utils/app_styles.dart';
import 'package:kafaa_app/widgets/custom_app_text_fields_border.dart';

class CustomNumberField extends StatelessWidget {
  const CustomNumberField(
      {super.key,
      required this.hint,
      required this.label,
      this.prefixIcon,
      this.suffixIcon,
      this.maxLength,
      this.onTap,
      this.enabled});

  final String hint;
  final String label;
  final Widget? prefixIcon, suffixIcon;
  final Function()? onTap;
  final int? maxLength;
  final bool? enabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        elevation: 3,
        child: TextFormField(
          enabled: enabled,
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
              color: AppColors.c5,
            ),
            fillColor: AppColors.c3,
            filled: true,
            border: CustomAppTextFieldsBorder.appTextFieldsBorder(),
            enabledBorder: CustomAppTextFieldsBorder.appTextFieldsBorder(),
          ),
          maxLength: maxLength,
        ),
      ),
    );
  }
}
