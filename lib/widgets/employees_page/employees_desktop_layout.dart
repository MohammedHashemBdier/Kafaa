import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafaa_app/blocks/employees/employees/employees_bloc.dart';
import 'package:kafaa_app/utils/router.dart';
import 'package:kafaa_app/widgets/drawer/app_drawer.dart';
import 'package:kafaa_app/widgets/employees_page/add_an_employee_section.dart';
import 'package:kafaa_app/widgets/employees_page/employees_section.dart';

class EmployeesDesktopLayout extends StatelessWidget {
  const EmployeesDesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: AppDrawer(route: AppRouter.employees)),
        const SizedBox(width: 30),
        Expanded(
          flex: 4,
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 40, bottom: 40, right: 20, left: 20),
                  child: Row(
                    children: [
                      const Expanded(
                        flex: 2,
                        child: EmployeesSection(),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: AddAnEmployeeSection(
                          onAdd: (employee) => context
                              .read<EmployeesBloc>()
                              .add(AddEmployeeEvent(employee: employee)),
                        ),
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
