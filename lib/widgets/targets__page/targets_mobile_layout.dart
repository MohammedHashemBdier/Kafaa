import 'package:flutter/material.dart';
import 'package:kafaa_app/widgets/targets__page/point_value.dart';
import 'package:kafaa_app/widgets/targets__page/targets_section.dart';
import 'package:kafaa_app/widgets/targets__page/top_in_rating_section.dart';

class TargetsMobileLayout extends StatelessWidget {
  const TargetsMobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding:
                const EdgeInsets.only(top: 40, bottom: 40, right: 20, left: 20),
            child: Column(
              children: [
                TopInRatingSection(),
                const SizedBox(height: 10),
                const TargetsSection(),
                const SizedBox(height: 10),
                PointValue(
                  label: "2000",
                  onChanged: (String) {},
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
