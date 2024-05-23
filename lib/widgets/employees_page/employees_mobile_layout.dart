import 'package:flutter/material.dart';
import 'package:kafaa_app/widgets/employees_page/employees_section.dart';

class EmployeesMobileLayout extends StatelessWidget {
  const EmployeesMobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: EdgeInsets.only(top: 40, bottom: 40, right: 20, left: 20),
            child: EmployeesSection(),
          ),
        )
      ],
    );
  }
}
