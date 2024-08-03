import 'package:flutter/material.dart';
import 'package:kafaa_app/widgets/reviews_page/add_review_body.dart';
import 'package:kafaa_app/widgets/reviews_page/add_review_header.dart';

class AddReviewSection extends StatelessWidget {
  const AddReviewSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        AddReviewHeader(),
        AddReviewBody(
          enabled: true,
        ),
        SizedBox(height: 40),
      ],
    );
  }
}
