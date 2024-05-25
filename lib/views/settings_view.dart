import 'package:flutter/material.dart';
import 'package:kafaa_app/utils/app_colors.dart';
import 'package:kafaa_app/utils/size_config.dart';
import 'package:kafaa_app/utils/adaptiv_layout.dart';
import 'package:kafaa_app/widgets/custom_app_bar.dart';
import 'package:kafaa_app/widgets/drawer/app_drawer.dart';
import 'package:kafaa_app/widgets/settings_page/settings_desktop_layout.dart';
import 'package:kafaa_app/widgets/settings_page/settings_mobile_layout.dart';
import 'package:kafaa_app/widgets/settings_page/settings_tablet_layout.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _HomViewState();
}

class _HomViewState extends State<SettingsView> {
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
      body: AdaptiveLayout(
        mobileLayout: (context) => const SettingsMobileLayout(),
        tabletLayout: (context) => const SettingsTabletLayout(),
        desktopLayout: (context) => const SettingsDesktopLayout(),
      ),
    );
  }
}
