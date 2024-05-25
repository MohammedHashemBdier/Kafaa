import 'package:flutter/material.dart';
import 'package:kafaa_app/widgets/settings_page/change_password_section.dart';
import 'package:kafaa_app/widgets/settings_page/settings_section.dart';

class SettingsMobileLayout extends StatelessWidget {
  const SettingsMobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: EdgeInsets.only(top: 40, bottom: 40, right: 20, left: 20),
            child: Column(
              children: [
                SettingsSection(),
                SizedBox(height: 20),
                ChangePassworSection(),
              ],
            ),
          ),
        )
      ],
    );
  }
}
