import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafaa_app/blocs/auth/auth_bloc.dart';
import 'package:kafaa_app/blocs/employees/employees/employees_bloc.dart';
import 'package:kafaa_app/helpers/extensions/navigator_on_context.dart';
import 'package:kafaa_app/utils/dependency_injection.dart';
import 'package:kafaa_app/utils/router.dart';
import 'package:kafaa_app/widgets/employees_page/employees_page.dart';

class EmployeesView extends StatelessWidget {
  const EmployeesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EmployeesBloc>(
      create: (context) =>
          locator<EmployeesBloc>()..add(GetAllEmployeesEvent()),
      child: MultiBlocListener(
        listeners: [
          BlocListener<EmployeesBloc, EmployeesState>(
            listener: (context, state) {},
          ),
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is UnauthenticatedState) {
                context.popUntil((route) => route.isFirst);
                context.pushReplacementNamed(AppRouter.login);
              }
            },
          ),
        ],
        child: const EmployeesPage(),
      ),
    );
  }
}
