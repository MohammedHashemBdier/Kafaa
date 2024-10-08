import 'package:flutter/material.dart';
import 'package:kafaa_app/generated/l10n.dart';
import 'package:kafaa_app/utils/app_styles.dart';
import 'package:kafaa_app/widgets/custom_app_container.dart';
import 'package:lottie/lottie.dart';

class AddEvaluationHeader extends StatelessWidget {
  const AddEvaluationHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAppContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  fit: FlexFit.loose,
                  child: Lottie.asset(
                    'assets/lottie/add_evaluation_header.json',
                    height: 100,
                    width: 100,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  S.of(context).add_evaluation,
                  style: AppStyles.styleBold24(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
