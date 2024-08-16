import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafaa_app/blocs/employees/add_employee/add_employee_bloc.dart';
import 'package:kafaa_app/models/employee_model.dart';
import 'package:kafaa_app/widgets/employees_page/add_an_employee_body.dart';
import 'package:kafaa_app/widgets/employees_page/add_an_employee_header.dart';

class AddAnEmployeeSection extends StatelessWidget {
  final void Function(EmployeeModel employee) onAdd;

  const AddAnEmployeeSection({super.key, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddEmployeeBloc(),
      child: BlocListener<AddEmployeeBloc, AddEmployeeState>(
        listener: (context, state) {
          if (state is AddState) onAdd.call(state.employee);
        },
        child: const Column(
          children: [
            AddAnEmployeeHeader(),
            AddAnEmployeeBody(),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
