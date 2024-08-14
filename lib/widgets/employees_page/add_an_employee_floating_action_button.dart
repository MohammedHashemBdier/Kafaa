import 'package:flutter/material.dart';
import 'package:kafaa_app/generated/l10n.dart';
import 'package:kafaa_app/models/employee_model.dart';
import 'package:kafaa_app/utils/app_colors.dart';
import 'package:kafaa_app/widgets/employees_page/add_an_employee_dialog.dart';

class AddAnEmployeeFloatingActionButton extends StatelessWidget {
  const AddAnEmployeeFloatingActionButton({super.key, required this.onAdd});

  final void Function(EmployeeModel employee) onAdd;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: S.of(context).add_an_employee,
      showDuration: const Duration(milliseconds: 700),
      waitDuration: const Duration(milliseconds: 700),
      child: FloatingActionButton(
        elevation: 3,
        child: Icon(
          Icons.person_add_alt_1,
          color: AppColors.c5,
          size: 30,
        ),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AddAnEmployeeDialog(onAdd: onAdd);
            },
          );
        },
      ),
    );
  }
}
