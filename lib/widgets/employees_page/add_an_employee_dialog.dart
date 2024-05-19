import 'package:flutter/material.dart';
import 'package:kfaa_app/utils/app_colors.dart';
import 'package:kfaa_app/widgets/close_icon.dart';
import 'package:kfaa_app/widgets/employees_page/add_an_employee_body.dart';
import 'package:kfaa_app/widgets/employees_page/add_an_employee_button.dart';
import 'package:kfaa_app/widgets/employees_page/add_an_employee_header.dart';

class AddAnEmployeeDialog extends StatelessWidget {
  const AddAnEmployeeDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: AppColors.c4,
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Stack(
              children: [
                const Align(
                  alignment: Alignment.topRight,
                  child: CloseIcon(),
                ),
                Column(
                  children: [
                    const SizedBox(height: 20),
                    const AddAnEmployeeHeader(),
                    const AddAnEmployeeBody(),
                    const SizedBox(height: 40),
                    AddAnEmployeeButton(onPressed: () {
                      Navigator.of(context).pop();
                    }),
                    const SizedBox(height: 40),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
