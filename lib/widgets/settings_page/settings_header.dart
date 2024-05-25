import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kafaa_app/generated/l10n.dart';
import 'package:kafaa_app/utils/app_colors.dart';
import 'package:kafaa_app/utils/app_images.dart';
import 'package:kafaa_app/utils/app_styles.dart';
import 'package:kafaa_app/widgets/custom_app_container.dart';

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
          Text(
            S.of(context).app_and_user_sittings,
            style: AppStyles.styleBold24(context),
          ),
          const SizedBox(width: 10),
          SvgPicture.asset(
            Assets.imagesSettingsIcon,
            colorFilter: ColorFilter.mode(AppColors.c5, BlendMode.srcIn),
            width: 65,
            height: 65,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
