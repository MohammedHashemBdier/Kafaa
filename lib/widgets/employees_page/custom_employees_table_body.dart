import 'package:flutter/material.dart';
import 'package:kfaa_app/utils/app_colors.dart';
import 'package:kfaa_app/widgets/custom_app_container.dart';
import 'package:kfaa_app/widgets/employees_page/custom_employees_table.dart';

class CustomEmployeesTableBody extends StatelessWidget {
  const CustomEmployeesTableBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAppContainer(
      child: Card(
        elevation: 3,
        color: AppColors.c2,
        child: CustomEmployeesTable.customEmployeesTable(context),
      ),
    );
  }
}
