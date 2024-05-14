import 'package:flutter/material.dart';
import 'package:kfaa_app/widgets/login_tablet_background.dart';
import 'package:kfaa_app/widgets/login_tablet_section.dart';

class LoginTabletLayout extends StatelessWidget {
  const LoginTabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        LoginTabletBackground(),
        LoginTabletSection(),
      ],
    );
  }
}
