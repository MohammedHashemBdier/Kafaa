import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafaa_app/blocks/employees/employees/employees_bloc.dart';
import 'package:kafaa_app/utils/adaptiv_layout.dart';
import 'package:kafaa_app/utils/app_colors.dart';
import 'package:kafaa_app/utils/router.dart';
import 'package:kafaa_app/utils/size_config.dart';
import 'package:kafaa_app/widgets/custom_app_bar.dart';
import 'package:kafaa_app/widgets/drawer/app_drawer.dart';
import 'package:kafaa_app/widgets/employees_page/add_an_employee_floating_action_button.dart';
import 'package:kafaa_app/widgets/employees_page/employees_desktop_layout.dart';
import 'package:kafaa_app/widgets/employees_page/employees_mobile_layout.dart';
import 'package:kafaa_app/widgets/employees_page/employees_tablet_layout.dart';

class EmployeesPage extends StatelessWidget {
  const EmployeesPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Scaffold(
      backgroundColor: AppColors.c3,
      drawer: SizeConfig.width < SizeConfig.tablet ? const AppDrawer(route: AppRouter.employees) : null,
      appBar:
          SizeConfig.width < SizeConfig.tablet ? const CustomAppBar() : null,
      floatingActionButton: SizeConfig.width < SizeConfig.desktop
          ? AddAnEmployeeFloatingActionButton(
              onAdd: (employee) => context
                  .read<EmployeesBloc>()
                  .add(AddEmployeeEvent(employee: employee)),
            )
          : null,
      body: AdaptiveLayout(
        mobileLayout: (context) => const EmployeesMobileLayout(),
        tabletLayout: (context) => const EmployeesTabletLayout(),
        desktopLayout: (context) => const EmployeesDesktopLayout(),
      ),
    );
  }
}
