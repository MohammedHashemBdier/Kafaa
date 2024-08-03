import 'package:flutter/material.dart';
import 'package:kafaa_app/widgets/evaluation_page/add_evaluation_body.dart';
import 'package:kafaa_app/widgets/evaluation_page/add_evaluation_header.dart';

class AddEvaluationwSection extends StatelessWidget {
  const AddEvaluationwSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        AddEvaluationHeader(),
        AddEvaluationBody(
          enabled: true,
        ),
        SizedBox(height: 40),
      ],
    );
  }
}
