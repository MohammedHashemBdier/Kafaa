import 'package:flutter/material.dart';
import 'package:kfaa_app/utils/app_colors.dart';
import 'package:kfaa_app/utils/size_config.dart';
import 'package:kfaa_app/widgets/adaptiv_layout.dart';
import 'package:kfaa_app/widgets/custom_app_bar.dart';
import 'package:kfaa_app/widgets/drawer/custom_drawer.dart';
import 'package:kfaa_app/widgets/employees_page/employees_desktop_layout.dart';
import 'package:kfaa_app/widgets/employees_page/employees_mobile_layout.dart';
import 'package:kfaa_app/widgets/employees_page/employees_tablet_layout.dart';

class EmployeesView extends StatefulWidget {
  const EmployeesView({super.key});

  @override
  State<EmployeesView> createState() => _HomViewState();
}

class _HomViewState extends State<EmployeesView> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: AppColors.c3,
      key: scaffoldKey,
      drawer:
          SizeConfig.width < SizeConfig.tablet ? const CustomDrawer() : null,
      appBar: SizeConfig.width < SizeConfig.tablet
          ? CustomAppBar(scaffoldKey: scaffoldKey)
          : null,
      body: AdaptiveLayout(
        mobileLayout: (context) => const EmployeesMobileLayout(),
        tabletLayout: (context) => const EmployeesTabletLayout(),
        desktopLayout: (context) => const EmployeesDesktopLayout(),
      ),
    );
  }
}