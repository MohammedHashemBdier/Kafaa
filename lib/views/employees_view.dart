import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafaa_app/blocks/employees/employees/employees_bloc.dart';
import 'package:kafaa_app/utils/dependency_injection.dart';
import 'package:kafaa_app/widgets/employees_page/employees_page.dart';

class EmployeesView extends StatelessWidget {
  const EmployeesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EmployeesBloc>(
      create: (context) =>
          locator<EmployeesBloc>()..add(GetAllEmployeesEvent()),
      child: BlocListener<EmployeesBloc, EmployeesState>(
        listener: (context, state) {},
        child: const EmployeesPage(),
      ),
    );
  }
}
