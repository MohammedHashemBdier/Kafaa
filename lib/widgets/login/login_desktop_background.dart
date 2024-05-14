import 'package:flutter/material.dart';
import 'package:kfaa_app/utils/app_colors.dart';
import 'package:kfaa_app/utils/app_images.dart';

class LoginDesktopBackground extends StatelessWidget {
  const LoginDesktopBackground({
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
                const Color.fromARGB(0, 255, 255, 255),
                AppColors.c2,
                AppColors.c2,
              ],
            ),
          ),
        ),
      ],
    );
  }
}
