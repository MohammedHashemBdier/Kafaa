import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kfaa_app/widgets/custom_app_container.dart';
import 'package:kfaa_app/widgets/drawer/custom_drawer.dart';
import 'package:kfaa_app/widgets/employees_page/add_an_employee_body.dart';
import 'package:kfaa_app/widgets/employees_page/add_an_employee_button.dart';
import 'package:kfaa_app/widgets/employees_page/add_an_employee_header.dart';

class EmployeesDesktopLayout extends StatelessWidget {
  const EmployeesDesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: CustomDrawer()),
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
                      const Expanded(flex: 2, child: SizedBox()),
                      Expanded(
                        child: CustomAppContainer(
                          child: Column(
                            children: [
                              const AddAnEmployeeHeader(),
                              const AddAnEmployeeBody(),
                              const SizedBox(height: 40),
                              AddAnEmployeeButton(onPressed: () {}),
                              const SizedBox(height: 40),
                            ],
                          ),
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
