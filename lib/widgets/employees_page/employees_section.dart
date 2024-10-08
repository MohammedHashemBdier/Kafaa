import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kafaa_app/widgets/employees_page/employees_table.dart';
import 'package:kafaa_app/widgets/employees_page/employees_header.dart';

class EmployeesSection extends StatelessWidget {
  const EmployeesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        EmployeesHeader(),
        EmployeesTable(),
        SizedBox(height: 40),
      ],
    );
  }
}
