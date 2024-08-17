import 'package:flutter/material.dart';
import 'package:kafaa_app/utils/router.dart';
import 'package:kafaa_app/widgets/drawer/app_drawer.dart';
import 'package:kafaa_app/widgets/targets__page/targets_mobile_layout.dart';

class TargetsTabletLayout extends StatelessWidget {
  const TargetsTabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: AppDrawer(route: AppRouter.targets)),
        SizedBox(width: 30),
        Expanded(
          flex: 3,
          child: TargetsMobileLayout(),
        ),
      ],
    );
  }
}
