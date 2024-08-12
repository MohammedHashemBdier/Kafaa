import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kafaa_app/blocks/employees/employees/employees_bloc.dart';
import 'package:kafaa_app/extensions/date_extensions.dart';
import 'package:kafaa_app/generated/l10n.dart';
import 'package:kafaa_app/models/employee_model.dart';
import 'package:kafaa_app/utils/app_colors.dart';
import 'package:kafaa_app/utils/app_images.dart';
import 'package:kafaa_app/utils/app_styles.dart';
import 'package:kafaa_app/widgets/custom_app_container.dart';
import 'package:kafaa_app/widgets/employees_page/employee_info_dialog.dart';
import 'package:kafaa_app/widgets/employees_page/employees_table_header.dart';

class EmployeesTable extends StatefulWidget {
  const EmployeesTable({super.key});

  @override
  EmployeesTableState createState() => EmployeesTableState();
}

class EmployeesTableState extends State<EmployeesTable>
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
      child: BlocBuilder<EmployeesBloc, EmployeesState>(
        builder: (context, state) {
          if (state is GetEmployeesLoadingState)
            return const Center(child: CircularProgressIndicator());
          else if (state is GetEmployeesFailureState)
            return const Text('error');
          else if (state is GetEmployeesLoadedState)
            return Card(
              elevation: 3,
              color: AppColors.c2,
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Table(
                    border: TableBorder(
                      horizontalInside:
                          BorderSide(color: AppColors.c4, width: 10),
                    ),
                    columnWidths: const {
                      0: FixedColumnWidth(80.0),
                      2: FixedColumnWidth(80.0),
                      3: FixedColumnWidth(100.0),
                    },
                    children: [
                      employeesTableHeader(context),
                      ...state.employees.mapIndexed((index, element) =>
                          tableBody(context, index, element))
                    ],
                  );
                },
              ),
            );
          return const SizedBox();
        },
      ),
    );
  }

  TableRow tableBody(BuildContext context, int index, EmployeeModel employee) {
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
            message: S.of(context).employee_info,
            child: InkWell(
              onTap: () => showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return EmployeeInfoDialog(
                    employee: employee,
                    onDelete: () {
                      print('delete');
                    },
                    onEdit: (newEmployee) {
                      print('edit');
                      print(newEmployee);
                    },
                  );
                },
              ),
              // onTap: () => context
              //     .read<EmployeesBloc>()
              //     .add(ShowEmployeeInfoEvent(employee: employee)),
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
                        Assets.imagesEmployeeAvatar,
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
                  employee.name ?? '---',
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
                  employee.department ?? '---',
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
                  employee.isWork == null
                      ? '---'
                      : employee.isWork!
                          ? S.of(context).work
                          : S.of(context).not_work,
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
                    employee.dateOfJoining == null
                        ? '---'
                        : employee.dateOfJoining!.commonDateFormat(),
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
