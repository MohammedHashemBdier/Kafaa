import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kafaa_app/widgets/employees_page/employees_table_body.dart';
import 'package:kafaa_app/widgets/employees_page/employees_table_header.dart';

class EmployeesSection extends StatelessWidget {
  const EmployeesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        EmployeesTableHeader(),
        EmployeesTableBody(),
        SizedBox(height: 40),
      ],
    );
  }
}
