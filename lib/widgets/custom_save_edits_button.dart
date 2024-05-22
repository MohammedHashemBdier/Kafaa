import 'package:flutter/material.dart';
import 'package:kafaa_app/generated/l10n.dart';
import 'package:kafaa_app/utils/app_colors.dart';
import 'package:kafaa_app/utils/app_styles.dart';
import 'package:kafaa_app/widgets/custom_confirmation_dialog.dart';

class CustomSaveEditsButton extends StatelessWidget {
  const CustomSaveEditsButton({
    super.key,
    required this.onPressed,
    required this.enabled,
  });
  final bool enabled;

  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: enabled
          ? () async {
              await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return CustomConfirmationDialog(
                    content: S.of(context).do_you_want_to_delete_the_employee,
                    onConfirm: () {
                      onPressed();
                    },
                  );
                },
              );
            }
          : null,
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
            enabled ? AppColors.c2 : AppColors.c5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.save,
              color: enabled ? AppColors.c5 : AppColors.c2,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              S.of(context).save_edits,
              style: AppStyles.styleSemiBold16(context).copyWith(
                color: enabled ? AppColors.c1 : AppColors.c2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
