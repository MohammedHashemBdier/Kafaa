import 'package:flutter/material.dart';
import 'package:kafaa_app/utils/app_colors.dart';
import 'package:kafaa_app/utils/router.dart';
import 'package:kafaa_app/utils/size_config.dart';
import 'package:kafaa_app/utils/adaptiv_layout.dart';
import 'package:kafaa_app/widgets/custom_app_bar.dart';
import 'package:kafaa_app/widgets/drawer/app_drawer.dart';
import 'package:kafaa_app/widgets/targets__page/targets_desktop_layout.dart';
import 'package:kafaa_app/widgets/targets__page/targets_mobile_layout.dart';
import 'package:kafaa_app/widgets/targets__page/targets_tablet_layout.dart';

class TargetsView extends StatelessWidget {
  const TargetsView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: AppColors.c3,
      drawer: SizeConfig.width < SizeConfig.tablet
          ? const AppDrawer(route: AppRouter.targets)
          : null,
      appBar:
          SizeConfig.width < SizeConfig.tablet ? const CustomAppBar() : null,
      body: AdaptiveLayout(
        mobileLayout: (context) => const TargetsMobileLayout(),
        tabletLayout: (context) => const TargetsTabletLayout(),
        desktopLayout: (context) => const TargetsDesktopLayout(),
      ),
    );
  }
}
