import 'package:flutter/material.dart';
import 'package:kfaa_app/widgets/drawer/custom_drawer.dart';
import 'package:kfaa_app/widgets/employees_page/add_an_employee_section.dart';
import 'package:kfaa_app/widgets/employees_page/employees_section.dart';

class EmployeesDesktopLayout extends StatelessWidget {
  const EmployeesDesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: CustomDrawer()),
        SizedBox(width: 30),
        Expanded(
          flex: 4,
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Padding(
                  padding:
                      EdgeInsets.only(top: 40, bottom: 40, right: 20, left: 20),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: EmployeesSection(),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: AddAnEmployeeSection(),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
