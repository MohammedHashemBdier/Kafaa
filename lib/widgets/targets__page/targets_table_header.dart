import 'package:flutter/material.dart';
import 'package:kafaa_app/generated/l10n.dart';
import 'package:kafaa_app/utils/app_colors.dart';
import 'package:kafaa_app/utils/app_styles.dart';

TableRow targetsTableHeader(BuildContext context) {
  return TableRow(
    decoration: BoxDecoration(
      color: AppColors.c1,
      borderRadius: BorderRadius.circular(12),
    ),
    children: [
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              textAlign: TextAlign.center,
              S.of(context).info,
              style:
                  AppStyles.styleBold16(context).copyWith(color: AppColors.c2),
            ),
          ),
        ),
      ),
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              textAlign: TextAlign.center,
              S.of(context).name,
              style:
                  AppStyles.styleBold16(context).copyWith(color: AppColors.c2),
            ),
          ),
        ),
      ),
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              textAlign: TextAlign.center,
              S.of(context).points,
              style:
                  AppStyles.styleBold16(context).copyWith(color: AppColors.c2),
            ),
          ),
        ),
      ),
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              S.of(context).points_value,
              textAlign: TextAlign.center,
              style:
                  AppStyles.styleBold16(context).copyWith(color: AppColors.c2),
            ),
          ),
        ),
      ),
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            S.of(context).last_modified_date,
            textAlign: TextAlign.center,
            style: AppStyles.styleBold16(context).copyWith(color: AppColors.c2),
          ),
        ),
      ),
    ],
  );
}
