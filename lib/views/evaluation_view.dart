import 'package:flutter/material.dart';
import 'package:kafaa_app/utils/app_colors.dart';
import 'package:kafaa_app/utils/size_config.dart';
import 'package:kafaa_app/utils/adaptiv_layout.dart';
import 'package:kafaa_app/widgets/custom_app_bar.dart';
import 'package:kafaa_app/widgets/drawer/app_drawer.dart';
import 'package:kafaa_app/widgets/evaluation_page/add_evaluation_floating_action_button.dart';
import 'package:kafaa_app/widgets/evaluation_page/evaluations_desktop_layout.dart';
import 'package:kafaa_app/widgets/evaluation_page/evaluations_mobile_layout.dart';
import 'package:kafaa_app/widgets/evaluation_page/evaluations_tablet_layout.dart';

class EvaluationView extends StatefulWidget {
  const EvaluationView({super.key});

  @override
  State<EvaluationView> createState() => _HomViewState();
}

class _HomViewState extends State<EvaluationView> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: AppColors.c3,
      key: scaffoldKey,
      drawer: SizeConfig.width < SizeConfig.tablet ? const AppDrawer() : null,
      appBar: SizeConfig.width < SizeConfig.tablet
          ? CustomAppBar(scaffoldKey: scaffoldKey)
          : null,
      floatingActionButton: SizeConfig.width < SizeConfig.desktop
          ? const AddEvaluatonFloatingActionButton()
          : null,
      body: AdaptiveLayout(
        mobileLayout: (context) => const EvaluationsMobileLayout(),
        tabletLayout: (context) => const EvaluationsTabletLayout(),
        desktopLayout: (context) => const EvaluationsDesktopLayout(),
      ),
    );
  }
}
