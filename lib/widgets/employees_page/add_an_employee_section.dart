import 'package:flutter/material.dart';
import 'package:kafaa_app/widgets/employees_page/add_an_employee_body.dart';
import 'package:kafaa_app/widgets/employees_page/add_an_employee_header.dart';

class AddAnEmployeeSection extends StatelessWidget {
  const AddAnEmployeeSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        AddAnEmployeeHeader(),
        AddAnEmployeeBody(),
        SizedBox(height: 40),
      ],
    );
  }
}
