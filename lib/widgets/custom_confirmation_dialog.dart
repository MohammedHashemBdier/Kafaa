import 'package:flutter/material.dart';
import 'package:kafaa_app/generated/l10n.dart';
import 'package:kafaa_app/utils/app_colors.dart';
import 'package:kafaa_app/utils/app_styles.dart';

class CustomConfirmationDialog extends StatelessWidget {
  final String content;
  final Function onConfirm;

  const CustomConfirmationDialog({
    super.key,
    required this.content,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: Icon(
        Icons.error_outline_outlined,
        color: AppColors.c5,
        size: 100,
      ),
      title: Text(
        S.of(context).confirm,
        style: AppStyles.styleBold24(context).copyWith(color: AppColors.c5),
      ),
      content: Text(
        content,
        style: AppStyles.styleRegular24(context),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            S.of(context).cancel,
            style:
                AppStyles.styleRegular16(context).copyWith(color: AppColors.c5),
          ),
        ),
        TextButton(
          onPressed: onConfirm as void Function()?,
          child: Text(
            S.of(context).confirm,
            style: AppStyles.styleRegular16(context),
          ),
        ),
      ],
    );
  }
}
