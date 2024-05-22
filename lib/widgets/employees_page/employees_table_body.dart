import 'package:flutter/material.dart';
import 'package:kafaa_app/utils/app_colors.dart';
import 'package:kafaa_app/widgets/custom_app_container.dart';
import 'package:kafaa_app/widgets/employees_page/employees_table.dart';

class EmployeesTableBody extends StatelessWidget {
  const EmployeesTableBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAppContainer(
      child: Card(
        elevation: 3,
        color: AppColors.c2,
        child: EmployeesTable.customEmployeesTable(context),
      ),
    );
  }
}
