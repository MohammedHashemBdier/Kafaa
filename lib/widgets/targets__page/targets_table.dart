import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kafaa_app/generated/l10n.dart';
import 'package:kafaa_app/utils/app_colors.dart';
import 'package:kafaa_app/utils/app_images.dart';
import 'package:kafaa_app/utils/app_styles.dart';
import 'package:kafaa_app/widgets/custom_app_container.dart';
import 'package:kafaa_app/widgets/targets__page/select_date_dialog.dart';
import 'package:kafaa_app/widgets/targets__page/targets_table_header.dart';

class TargetsTable extends StatefulWidget {
  const TargetsTable({super.key});

  @override
  EmployeesTableState createState() => EmployeesTableState();
}

class EmployeesTableState extends State<TargetsTable>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomAppContainer(
      child: Card(
        elevation: 3,
        color: AppColors.c2,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Table(
              border: TableBorder(
                horizontalInside: BorderSide(color: AppColors.c4, width: 10),
              ),
              children: [
                targetsTableHeader(context),
                ...List.generate(
                  10,
                  (index) => tableBody(context, index),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  TableRow tableBody(BuildContext context, int index) {
    Animation<double> animation = CurvedAnimation(
      parent: _controller,
      curve: Interval(
        (index / 10),
        1.0,
        curve: Curves.easeInOut,
      ),
    );

    return TableRow(
      children: [
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Tooltip(
            showDuration: const Duration(milliseconds: 700),
            waitDuration: const Duration(milliseconds: 700),
            message: S.of(context).employee_point_report,
            child: InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const SelectDateDialog();
                  },
                );
              },
              child: FadeTransition(
                opacity: animation,
                child: SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0, 0.1),
                    end: Offset.zero,
                  ).animate(animation),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: SvgPicture.asset(
                        Assets.imagesTargetTableIcon,
                        width: 30,
                        height: 30,
                      ),
                    ),
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
            child: FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, 0.1),
                  end: Offset.zero,
                ).animate(animation),
                child: Text(
                  "Mohammed Hashem Bdier",
                  textAlign: TextAlign.center,
                  style: AppStyles.styleRegular16(context),
                ),
              ),
            ),
          ),
        ),
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, 0.1),
                  end: Offset.zero,
                ).animate(animation),
                child: Text(
                  "248",
                  textAlign: TextAlign.center,
                  style: AppStyles.styleRegular16(context),
                ),
              ),
            ),
          ),
        ),
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, 0.1),
                  end: Offset.zero,
                ).animate(animation),
                child: Text(
                  "496000",
                  textAlign: TextAlign.center,
                  style: AppStyles.styleRegular16(context),
                ),
              ),
            ),
          ),
        ),
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, 0.1),
                  end: Offset.zero,
                ).animate(animation),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    "13/8/2024",
                    textAlign: TextAlign.center,
                    style: AppStyles.styleRegular16(context),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
