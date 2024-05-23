import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kafaa_app/generated/l10n.dart';
import 'package:kafaa_app/utils/app_colors.dart';
import 'package:kafaa_app/utils/app_images.dart';
import 'package:kafaa_app/utils/app_styles.dart';
import 'package:kafaa_app/widgets/employees_page/employee_info_dialog.dart';

class EmployeesTable {
  static Table customEmployeesTable(BuildContext context) {
    return Table(
      border: TableBorder(
        horizontalInside: BorderSide(color: AppColors.c4, width: 10),
      ),
      columnWidths: const {
        0: FixedColumnWidth(80.0),
        2: FixedColumnWidth(80.0),
        3: FixedColumnWidth(100.0),
      },
      children: [
        tableHeader(context),
        ...List.generate(
          10,
          (index) => tableBody(context),
        ),
      ],
    );
  }

  static TableRow tableHeader(BuildContext context) {
    return TableRow(
      decoration: BoxDecoration(
          color: AppColors.c1, borderRadius: BorderRadius.circular(12)),
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
                style: AppStyles.styleBold16(context)
                    .copyWith(color: AppColors.c2),
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
                style: AppStyles.styleBold16(context)
                    .copyWith(color: AppColors.c2),
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
                S.of(context).department,
                style: AppStyles.styleBold16(context)
                    .copyWith(color: AppColors.c2),
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
                S.of(context).work_state,
                textAlign: TextAlign.center,
                style: AppStyles.styleBold16(context)
                    .copyWith(color: AppColors.c2),
              ),
            ),
          ),
        ),
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              S.of(context).date_of_joining_the_department,
              textAlign: TextAlign.center,
              style:
                  AppStyles.styleBold16(context).copyWith(color: AppColors.c2),
            ),
          ),
        ),
      ],
    );
  }

  static TableRow tableBody(BuildContext context) {
    return TableRow(
      children: [
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Tooltip(
            showDuration: const Duration(milliseconds: 700),
            waitDuration: const Duration(milliseconds: 700),
            message: S.of(context).employee_info,
            child: InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const EmployeeInfoDialog();
                  },
                );
              },
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: SvgPicture.asset(
                    Assets.imagesEmployeeAvatar,
                    width: 30,
                    height: 30,
                  ),
                ),
              ),
            ),
          ),
        ),
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              "Mohammed Hashem Bdier",
              textAlign: TextAlign.center,
              style: AppStyles.styleRegular16(context),
            ),
          ),
        ),
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              "Tech",
              textAlign: TextAlign.center,
              style: AppStyles.styleRegular16(context),
            ),
          ),
        ),
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              S.of(context).work,
              textAlign: TextAlign.center,
              style: AppStyles.styleRegular16(context),
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
                "11/9/2022",
                textAlign: TextAlign.center,
                style: AppStyles.styleRegular16(context),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
