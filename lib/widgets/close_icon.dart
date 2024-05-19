import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kfaa_app/utils/app_images.dart';

class CloseIcon extends StatelessWidget {
  const CloseIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.all(10),
          side: const BorderSide(
            color: Colors.transparent, // Set the border color as desired
            width: 2.0, // Adjust the border width as needed
          ),
          shape: const CircleBorder(), // Use CircleBorder for a circular shape
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: SvgPicture.asset(width: 50, height: 50, Assets.imagesCloseIcon),
      ),
    );
  }
}
