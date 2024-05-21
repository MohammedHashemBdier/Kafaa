import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kfaa_app/widgets/employees_page/custom_employees_table_body.dart';
import 'package:kfaa_app/widgets/employees_page/custom_employees_table_header.dart';

class EmployeesSection extends StatelessWidget {
  const EmployeesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomEmployeesTableHeader(),
        CustomEmployeesTableBody(),
        SizedBox(height: 40),
      ],
    );
  }
}
