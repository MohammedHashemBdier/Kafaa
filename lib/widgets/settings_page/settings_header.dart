import 'package:flutter/material.dart';
import 'package:kafaa_app/generated/l10n.dart';
import 'package:kafaa_app/utils/app_styles.dart';
import 'package:kafaa_app/widgets/custom_app_container.dart';
import 'package:lottie/lottie.dart';

class SettingsHeader extends StatelessWidget {
  const SettingsHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAppContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Flexible(
            fit: FlexFit.loose,
            child: Lottie.asset(
              'assets/lottie/settings_header.json',
              height: 100,
              width: 100,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            S.of(context).app_and_user_sittings,
            style: AppStyles.styleBold24(context),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
