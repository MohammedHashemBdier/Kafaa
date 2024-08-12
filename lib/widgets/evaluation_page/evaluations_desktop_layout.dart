import 'package:flutter/material.dart';
import 'package:kafaa_app/utils/router.dart';
import 'package:kafaa_app/widgets/drawer/app_drawer.dart';
import 'package:kafaa_app/widgets/evaluation_page/add_evaluation_section.dart';
import 'package:kafaa_app/widgets/evaluation_page/evaluations_section.dart';

class EvaluationsDesktopLayout extends StatelessWidget {
  const EvaluationsDesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: AppDrawer(route: AppRouter.evaluation)),
        SizedBox(width: 30),
        Expanded(
          flex: 4,
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Padding(
                  padding:
                      EdgeInsets.only(top: 40, bottom: 40, right: 20, left: 20),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: EvaluationsSection(),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: AddEvaluationwSection(),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
