import 'package:flutter/material.dart';
import 'package:kafaa_app/widgets/evaluation_page/evaluations_header.dart';
import 'package:kafaa_app/widgets/evaluation_page/evaluations_table.dart';

class EvaluationsSection extends StatelessWidget {
  const EvaluationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        EvaluationsHeader(),
        EvaluationsTable(),
        SizedBox(height: 40),
      ],
    );
  }
}
