import 'package:flutter/material.dart';
import 'package:kfaa_app/widgets/login_page/login_desctop_section.dart';
import 'package:kfaa_app/widgets/login_page/login_desktop_background.dart';

class LoginDesktopLayout extends StatelessWidget {
  const LoginDesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        LoginDesktopBackground(),
        LoginDesktopSection(),
      ],
    );
  }
}
