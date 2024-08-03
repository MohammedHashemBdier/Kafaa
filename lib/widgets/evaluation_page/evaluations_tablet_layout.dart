import 'package:flutter/material.dart';
import 'package:kafaa_app/widgets/drawer/app_drawer.dart';
import 'package:kafaa_app/widgets/evaluation_page/evaluations_mobile_layout.dart';

class EvaluationsTabletLayout extends StatelessWidget {
  const EvaluationsTabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: AppDrawer()),
        SizedBox(width: 30),
        Expanded(
          flex: 3,
          child: EvaluationsMobileLayout(),
        ),
      ],
    );
  }
}
