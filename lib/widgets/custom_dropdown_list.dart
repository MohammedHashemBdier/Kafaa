import 'package:flutter/material.dart';
import 'package:kafaa_app/utils/app_colors.dart';
import 'package:kafaa_app/utils/app_styles.dart';
import 'package:kafaa_app/widgets/custom_app_text_fields_border.dart';

class CustomDropdownList extends StatefulWidget {
  const CustomDropdownList({
    super.key,
    required this.enabled,
    required this.label,
    required this.menuItems,
    required this.onChose,
    required this.icon,
    required this.hintText,
  });
  final bool enabled;
  final String label;
  final List<String> menuItems;
  final Function onChose;
  final Widget icon;
  final String hintText;
  @override
  CustomDropdownListtState createState() => CustomDropdownListtState();
}

class CustomDropdownListtState extends State<CustomDropdownList> {
  String? selectedValue;

  @override
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        elevation: 3,
        child: DropdownButtonFormField(
          decoration: InputDecoration(
            prefixIcon: widget.icon,
            labelText: widget.label,
            labelStyle: AppStyles.styleRegular16(context),
            hintText: widget.hintText,
            hintStyle: AppStyles.styleRegular16(context).copyWith(
              color: AppColors.c5,
            ),
            fillColor: AppColors.c3,
            filled: true,
            border: CustomAppTextFieldsBorder.appTextFieldsBorder(),
            enabledBorder: CustomAppTextFieldsBorder.appTextFieldsBorder(),
          ),
          value: widget.enabled ? selectedValue : null,
          items: widget.menuItems.map(
            (e) {
              return DropdownMenuItem(
                onTap: () {
                  widget.onChose;
                },
                value: e,
                child: Text(e),
              );
            },
          ).toList(),
          onChanged: widget.enabled
              ? (val) {
                  setState(
                    () {
                      selectedValue = val as String?;
                    },
                  );
                }
              : null,
        ),
      ),
    );
  }
}
