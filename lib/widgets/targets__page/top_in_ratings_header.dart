import 'package:flutter/material.dart';
import 'package:kafaa_app/generated/l10n.dart';
import 'package:kafaa_app/utils/app_styles.dart';
import 'package:kafaa_app/widgets/custom_app_container.dart';
import 'package:lottie/lottie.dart';

class TopInRatingsHeader extends StatelessWidget {
  const TopInRatingsHeader({
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
                    'assets/lottie/top_in_rating_header.json',
                    height: 150,
                    width: 150,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  S.of(context).top_in_ratings,
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
