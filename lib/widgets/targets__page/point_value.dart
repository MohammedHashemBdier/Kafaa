import 'package:flutter/material.dart';
import 'package:kafaa_app/generated/l10n.dart';
import 'package:kafaa_app/utils/app_styles.dart';
import 'package:kafaa_app/widgets/custom_app_container.dart';
import 'package:kafaa_app/widgets/custom_number_field.dart';

class PointValue extends StatelessWidget {
  const PointValue({
    super.key,
    required this.label,
    required this.onChanged,
  });
  final void Function(String)? onChanged;
  final String label;

  @override
  Widget build(BuildContext context) {
    return CustomAppContainer(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    S.of(context).point_value,
                    style: AppStyles.styleBold24(context),
                  ),
                ),
              ),
            ],
          ),
          CustomNumberField(
            label: label,
            onChanged: onChanged,
          )
        ],
      ),
    );
  }
}
