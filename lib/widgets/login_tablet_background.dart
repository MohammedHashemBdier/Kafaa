import 'package:flutter/material.dart';
import 'package:kfaa_app/utils/app_colors.dart';
import 'package:kfaa_app/utils/app_images.dart';

class LoginTabletBackground extends StatelessWidget {
  const LoginTabletBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Assets.imagesLoginDesktopBackground),
                fit: BoxFit.cover),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.c2,
                const Color.fromARGB(0, 255, 255, 255),
              ],
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color.fromARGB(0, 255, 255, 255),
                AppColors.c2,
              ],
            ),
          ),
        ),
      ],
    );
  }
}
