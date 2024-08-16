import 'package:flutter/material.dart';
import 'package:kafaa_app/utils/app_colors.dart';
import 'package:kafaa_app/utils/router.dart';
import 'package:kafaa_app/utils/size_config.dart';
import 'package:kafaa_app/utils/adaptiv_layout.dart';
import 'package:kafaa_app/widgets/custom_app_bar.dart';
import 'package:kafaa_app/widgets/drawer/app_drawer.dart';
import 'package:kafaa_app/widgets/settings_page/settings_desktop_layout.dart';
import 'package:kafaa_app/widgets/settings_page/settings_mobile_layout.dart';
import 'package:kafaa_app/widgets/settings_page/settings_tablet_layout.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Scaffold(
      backgroundColor: AppColors.c3,
      drawer: SizeConfig.width < SizeConfig.tablet
          ? const AppDrawer(route: AppRouter.settings)
          : null,
      appBar:
          SizeConfig.width < SizeConfig.tablet ? const CustomAppBar() : null,
      body: AdaptiveLayout(
        mobileLayout: (context) => const SettingsMobileLayout(),
        tabletLayout: (context) => const SettingsTabletLayout(),
        desktopLayout: (context) => const SettingsDesktopLayout(),
      ),
    );
  }
}
