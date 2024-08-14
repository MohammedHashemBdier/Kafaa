import 'package:flutter/material.dart';
import 'package:kafaa_app/models/employee_model.dart';
import 'package:kafaa_app/utils/app_colors.dart';
import 'package:kafaa_app/utils/size_config.dart';
import 'package:kafaa_app/widgets/custom_close_icon.dart';
import 'package:kafaa_app/widgets/employees_page/add_an_employee_section.dart';

class AddAnEmployeeDialog extends StatelessWidget {
  const AddAnEmployeeDialog({super.key, required this.onAdd});

  final void Function(EmployeeModel employee) onAdd;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 10,
      backgroundColor: AppColors.c2,
      child: SizedBox(
        width: SizeConfig.width < SizeConfig.desktop
            ? MediaQuery.sizeOf(context).width * 0.8
            : MediaQuery.sizeOf(context).width * 0.5,
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    const CustomCloseIcon(),
                    Expanded(
                      child: AddAnEmployeeSection(onAdd: onAdd),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
