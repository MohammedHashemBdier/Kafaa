import 'package:flutter/material.dart';
import 'package:kfaa_app/utils/app_colors.dart';

class CustomAppContainer extends StatelessWidget {
  const CustomAppContainer({
    super.key,
    required this.child,
    this.padding,
  });
  final Widget child;
  final double? padding;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding ?? 20),
      decoration: ShapeDecoration(
        color: AppColors.c4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: child,
    );
  }
}
