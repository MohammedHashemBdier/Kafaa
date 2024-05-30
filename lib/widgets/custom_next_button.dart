import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kafaa_app/generated/l10n.dart';
import 'package:kafaa_app/utils/app_colors.dart';
import 'package:kafaa_app/utils/app_images.dart';
import 'package:kafaa_app/utils/app_styles.dart';

class CustomNextButton extends StatelessWidget {
  const CustomNextButton({
    super.key,
    required this.enabled,
    required this.onPressed,
  });
  final bool enabled;

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: enabled
          ? () async {
              await onPressed();
            }
          : null,
      style: ButtonStyle(
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        backgroundColor: WidgetStateProperty.all<Color>(
            enabled ? AppColors.c2 : AppColors.c5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Assets.imagesNextIcon,
              colorFilter:   enabled ?  ColorFilter.mode(AppColors.c5, BlendMode.srcIn) :  ColorFilter.mode(AppColors.c2, BlendMode.srcIn),
              width: 15,
            ),
            const SizedBox(width: 10),
            Text(
              S.of(context).next,
              style: AppStyles.styleSemiBold16(context).copyWith(
                color: enabled ? AppColors.c1 : AppColors.c2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
