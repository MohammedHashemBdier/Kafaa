import 'package:flutter/material.dart';
import 'package:kafaa_app/utils/router.dart';
import 'package:kafaa_app/widgets/drawer/app_drawer.dart';
import 'package:kafaa_app/widgets/targets__page/targets_section.dart';
import 'package:kafaa_app/widgets/targets__page/top_in_rating_and_point_value_section.dart';

class TargetsDesktopLayout extends StatelessWidget {
  const TargetsDesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: AppDrawer(route: AppRouter.targets)),
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
                      Expanded(flex: 2, child: TargetsSection()),
                      SizedBox(width: 20),
                      Expanded(child: TopInRatingAndPointValueSection()),
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
