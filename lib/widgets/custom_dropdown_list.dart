import 'package:flutter/material.dart';
import 'package:kafaa_app/utils/app_colors.dart';
import 'package:kafaa_app/utils/app_styles.dart';
import 'package:kafaa_app/widgets/custom_app_text_fields_border.dart';

class CustomDropdownList extends StatelessWidget {
  const CustomDropdownList({
    super.key,
    required this.enabled,
    this.label = '',
    required this.menuItems,
    required this.onChose,
    required this.icon,
    required this.hintText,
    this.selectedValue,
  });

  final bool enabled;
  final String label;
  final List<String> menuItems;
  final void Function(String? value)? onChose;
  final Widget icon;
  final String hintText;
  final String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        elevation: 3,
        child: DropdownButtonFormField(
          decoration: InputDecoration(
            prefixIcon: icon,
            labelText: label,
            labelStyle: AppStyles.styleRegular16(context),
            hintText: hintText,
            hintStyle: AppStyles.styleRegular16(context).copyWith(
              color: AppColors.c5,
            ),
            fillColor: AppColors.c3,
            filled: true,
            border: CustomAppTextFieldsBorder.appTextFieldsBorder(),
            enabledBorder: CustomAppTextFieldsBorder.appTextFieldsBorder(),
          ),
          dropdownColor: AppColors.c3,
          value: selectedValue,
          items: menuItems.map(
            (e) {
              return DropdownMenuItem(
                // onTap: () => onChose?.call(e),
                value: e,
                child: Text(e),
              );
            },
          ).toList(),
          onChanged: enabled ? onChose : null,
        ),
      ),
    );
  }
}
