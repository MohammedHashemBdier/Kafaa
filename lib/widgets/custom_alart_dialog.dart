import 'package:flutter/material.dart';
import 'package:kafaa_app/generated/l10n.dart';
import 'package:kafaa_app/utils/app_colors.dart';
import 'package:kafaa_app/utils/app_styles.dart';

class CustomAlartDialog extends StatelessWidget {
  final String content;

  const CustomAlartDialog({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: Icon(
        Icons.notifications,
        color: AppColors.c5,
        size: 100,
      ),
      title: Text(
        S.of(context).alart,
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
            S.of(context).ok,
            style: AppStyles.styleRegular16(context),
          ),
        ),
      ],
    );
  }
}
