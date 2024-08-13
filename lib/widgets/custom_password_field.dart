import 'package:flutter/material.dart';
import 'package:kafaa_app/generated/l10n.dart';
import 'package:kafaa_app/utils/app_colors.dart';
import 'package:kafaa_app/utils/app_styles.dart';
import 'package:kafaa_app/widgets/custom_app_text_fields_border.dart';

class CustomPasswordField extends StatefulWidget {
  const CustomPasswordField({
    super.key,
    this.enabled,
    required this.hint,
     this.label = '',
    this.prefixIcon,
    this.onTap,
    this.controller,
    this.onChanged,
    this.initialValue,
    this.validator,
  });

  final String hint;
  final String label;
  final bool? enabled;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final void Function()? onTap;
  final void Function(String value)? onChanged;
  final String? initialValue;
  final String? Function(String? value)? validator;

  @override
  CustomPasswordFieldState createState() => CustomPasswordFieldState();
}

class CustomPasswordFieldState extends State<CustomPasswordField> {
  bool _isObscured = true;

  void _togglePasswordView() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        elevation: 3,
        child: TextFormField(
          validator: widget.validator,
          initialValue: widget.initialValue,
          enabled: widget.enabled,
          controller: widget.controller,
          onChanged: widget.onChanged,
          obscureText: _isObscured,
          decoration: InputDecoration(
            label: Text(widget.label),
            labelStyle: AppStyles.styleRegular16(context),
            hintText: widget.hint,
            hintStyle: AppStyles.styleRegular16(context).copyWith(
              color: AppColors.c5,
            ),
            fillColor: AppColors.c3,
            filled: true,
            border: CustomAppTextFieldsBorder.appTextFieldsBorder(),
            enabledBorder: CustomAppTextFieldsBorder.appTextFieldsBorder(),
            prefixIcon: widget.prefixIcon,
            suffixIcon: IconButton(
              icon: Tooltip(
                showDuration: const Duration(milliseconds: 700),
                waitDuration: const Duration(milliseconds: 700),
                message: _isObscured
                    ? S.of(context).Show_password
                    : S.of(context).hide_password,
                child: Icon(
                  _isObscured ? Icons.visibility : Icons.visibility_off,
                ),
              ),
              onPressed: _togglePasswordView,
            ),
          ),
        ),
      ),
    );
  }
}
