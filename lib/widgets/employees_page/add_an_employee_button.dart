import 'package:flutter/material.dart';
import 'package:kafaa_app/generated/l10n.dart';
import 'package:kafaa_app/utils/app_colors.dart';
import 'package:kafaa_app/utils/app_styles.dart';
import 'package:kafaa_app/widgets/custom_confirmation_dialog.dart';

class AddAnEmployeeButton extends StatelessWidget {
  const AddAnEmployeeButton({
    super.key,
    required this.onPressed,
  });
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        await showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomConfirmationDialog(
              content: S.of(context).do_you_want_to_add_an_employee,
              onConfirm: () {
                onPressed();
              },
            );
          },
        );
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.person_add_alt_1,
              color: AppColors.c5,
            ),
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
    );
  }
}
