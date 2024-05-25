import 'package:flutter/material.dart';
import 'package:kafaa_app/widgets/drawer/app_drawer.dart';
import 'package:kafaa_app/widgets/settings_page/settings_mobile_layout.dart';

class SettingsTabletLayout extends StatelessWidget {
  const SettingsTabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: AppDrawer()),
        SizedBox(width: 30),
        Expanded(
          flex: 3,
          child: SettingsMobileLayout(),
        ),
      ],
    );
  }
}
