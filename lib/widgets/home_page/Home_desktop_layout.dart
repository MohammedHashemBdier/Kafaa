import 'package:flutter/material.dart';
import 'package:kafaa_app/widgets/drawer/app_drawer.dart';

class HomeDesktopLayout extends StatelessWidget {
  const HomeDesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: AppDrawer()),
        Expanded(flex: 4, child: SizedBox()),
      ],
    );
  }
}
