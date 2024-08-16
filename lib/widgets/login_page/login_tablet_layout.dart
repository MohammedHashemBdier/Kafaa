import 'package:flutter/material.dart';
import 'package:kafaa_app/widgets/login_page/login_tablet_background.dart';
import 'package:kafaa_app/widgets/login_page/login_tablet_section.dart';
import 'package:kafaa_app/widgets/custom_change_language_icon_butten.dart';

class LoginTabletLayout extends StatelessWidget {
  const LoginTabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        LoginTabletBackground(),
        LoginTabletSection(),
        CustomChangeLanguageIconButten(),
      ],
    );
  }
}
