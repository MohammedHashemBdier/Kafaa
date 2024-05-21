import 'package:flutter/material.dart';
import 'package:kfaa_app/widgets/drawer/custom_drawer.dart';
import 'package:kfaa_app/widgets/employees_page/employees_mobile_layout.dart';

class EmployeesTabletLayout extends StatelessWidget {
  const EmployeesTabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: CustomDrawer()),
        SizedBox(width: 30),
        Expanded(
          flex: 3,
          child: EmployeesMobileLayout(),
        ),
      ],
    );
  }
}
