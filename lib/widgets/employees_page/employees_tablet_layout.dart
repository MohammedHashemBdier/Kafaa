import 'package:flutter/material.dart';
import 'package:kafaa_app/utils/router.dart';
import 'package:kafaa_app/widgets/drawer/app_drawer.dart';
import 'package:kafaa_app/widgets/employees_page/employees_mobile_layout.dart';

class EmployeesTabletLayout extends StatelessWidget {
  const EmployeesTabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: AppDrawer(route: AppRouter.employees)),
        SizedBox(width: 30),
        Expanded(
          flex: 3,
          child: EmployeesMobileLayout(),
        ),
      ],
    );
  }
}
