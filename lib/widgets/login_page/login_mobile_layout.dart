import 'package:flutter/material.dart';
import 'package:kafaa_app/widgets/login_page/login_mobile_background.dart';
import 'package:kafaa_app/widgets/login_page/login_mobile_section.dart';

class LoginMobileLayout extends StatelessWidget {
  const LoginMobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        LoginMobileBackground(),
        LoginMobileSection(),
      ],
    );
  }
}
