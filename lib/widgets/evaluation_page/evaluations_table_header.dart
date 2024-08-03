import 'package:flutter/material.dart';
import 'package:kafaa_app/generated/l10n.dart';
import 'package:kafaa_app/utils/app_colors.dart';
import 'package:kafaa_app/utils/app_styles.dart';

TableRow evaluationTableHeader(BuildContext context) {
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
              S.of(context).evaluation_name,
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
              S.of(context).evaluation_type,
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
              S.of(context).from_value,
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
            S.of(context).to_value,
            textAlign: TextAlign.center,
            style: AppStyles.styleBold16(context).copyWith(color: AppColors.c2),
          ),
        ),
      ),
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            S.of(context).target_value,
            textAlign: TextAlign.center,
            style: AppStyles.styleBold16(context).copyWith(color: AppColors.c2),
          ),
        ),
      ),
    ],
  );
}
