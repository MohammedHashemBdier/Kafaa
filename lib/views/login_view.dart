import 'package:flutter/material.dart';
import 'package:kfaa_app/widgets/adaptiv_layout.dart';
import 'package:kfaa_app/widgets/login_page/login_desktop_layout.dart';
import 'package:kfaa_app/widgets/login_page/login_mobile_layout.dart';
import 'package:kfaa_app/widgets/login_page/login_tablet_layout.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdaptiveLayout(
        mobileLayout: (context) => const LoginMobileLayout(),
        tabletLayout: (context) => const LoginTabletLayout(),
        desktopLayout: (context) => const LoginDesktopLayout(),
      ),
    );
  }
}
