import 'package:flutter/material.dart';
import 'package:kfaa_app/generated/l10n.dart';
import 'package:kfaa_app/utils/app_colors.dart';
import 'package:kfaa_app/utils/app_styles.dart';

class AddAnEmployeeHeader extends StatelessWidget {
  const AddAnEmployeeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.person_add_alt_1,
            color: AppColors.c5,
            size: 30,
          ),
          const SizedBox(width: 10),
          Text(
            S.of(context).add_an_employee,
            style: AppStyles.styleBold24(context),
          ),
        ],
      ),
    );
  }
}
