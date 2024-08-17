import 'package:flutter/material.dart';
import 'package:kafaa_app/widgets/login_page/login_desctop_section.dart';
import 'package:kafaa_app/widgets/login_page/login_desktop_background.dart';
import 'package:kafaa_app/widgets/custom_change_language_icon_button.dart';

class LoginDesktopLayout extends StatelessWidget {
  const LoginDesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        LoginDesktopBackground(),
        LoginDesktopSection(),
        CustomChangeLanguageIconButton(),
      ],
    );
  }
}
