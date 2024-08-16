import 'package:flutter/widgets.dart';
import 'package:kafaa_app/widgets/targets__page/targets_header.dart';
import 'package:kafaa_app/widgets/targets__page/targets_table.dart';

class TargetsSection extends StatelessWidget {
  const TargetsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TargetsHeader(),
        TargetsTable(),
        SizedBox(height: 40),
      ],
    );
  }
}
