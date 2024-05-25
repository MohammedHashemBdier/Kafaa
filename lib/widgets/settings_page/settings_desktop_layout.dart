import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kafaa_app/widgets/drawer/app_drawer.dart';
import 'package:kafaa_app/widgets/settings_page/change_password_section.dart';
import 'package:kafaa_app/widgets/settings_page/settings_section.dart';

class SettingsDesktopLayout extends StatelessWidget {
  const SettingsDesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: AppDrawer()),
        SizedBox(width: 30),
        Expanded(
          flex: 4,
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Padding(
                  padding:
                      EdgeInsets.only(top: 40, bottom: 40, right: 20, left: 20),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: SettingsSection(),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: ChangePassworSection(),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
