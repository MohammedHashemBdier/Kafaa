import 'package:flutter/material.dart';
import 'package:kafaa_app/widgets/employees_page/add_an_employee_dialog.dart';
import 'package:kafaa_app/widgets/employees_page/add_an_employee_header.dart';
import 'package:kafaa_app/widgets/employees_page/employees_section.dart';

class EmployeesMobileLayout extends StatelessWidget {
  const EmployeesMobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding:
                const EdgeInsets.only(top: 40, bottom: 40, right: 20, left: 20),
            child: Column(
              children: [
                const EmployeesSection(),
                InkWell(
                  child: const AddAnEmployeeHeader(),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const AddAnEmployeeDialog();
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
