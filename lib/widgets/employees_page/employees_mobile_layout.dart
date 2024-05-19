import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kfaa_app/widgets/custom_app_container.dart';
import 'package:kfaa_app/widgets/employees_page/add_an_employee_button.dart';
import 'package:kfaa_app/widgets/employees_page/add_an_employee_dialog.dart';

class EmployeesMobileLayout extends StatelessWidget {
  const EmployeesMobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 30),
        Expanded(
          flex: 3,
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 40, bottom: 40, right: 20, left: 20),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: CustomAppContainer(
                          child: AddAnEmployeeButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return const AddAnEmployeeDialog();
                                },
                              );
                            },
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
