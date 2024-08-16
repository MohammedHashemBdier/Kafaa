import 'package:flutter/material.dart';
import 'package:kafaa_app/widgets/targets__page/point_value.dart';
import 'package:kafaa_app/widgets/targets__page/top_in_rating_section.dart';

class TopInRatingAndPointValueSection extends StatelessWidget {
  const TopInRatingAndPointValueSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TopInRatingSection(),
        const SizedBox(height: 40),
        PointValue(
          label: "2000",
          onChanged: (String) {},
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}
