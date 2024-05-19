import 'package:flutter/material.dart';
import 'package:kfaa_app/generated/l10n.dart';
import 'package:kfaa_app/utils/app_colors.dart';
import 'package:kfaa_app/utils/app_styles.dart';

class AddAnEmployeeButton extends StatelessWidget {
  const AddAnEmployeeButton({
    super.key,
    required this.onPressed,
  });
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.black12,
      elevation: 10,
      shadowColor: AppColors.c1,
      borderRadius: BorderRadius.circular(50),
      child: ElevatedButton(
        onPressed: () async {
          await onPressed();
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(AppColors.c2),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.person_add_alt_1),
              const SizedBox(
                width: 10,
              ),
              Text(
                S.of(context).add_an_employee,
                style: AppStyles.styleSemiBold16(context).copyWith(
                  color: AppColors.c1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
