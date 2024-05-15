import 'package:flutter/material.dart';
import 'package:kfaa_app/widgets/drawer/custom_drawer.dart';

class HomeDesktopLayout extends StatelessWidget {
  const HomeDesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: CustomDrawer()),
        Expanded(flex: 3, child: SizedBox()),
      ],
    );
  }
}
