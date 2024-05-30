import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kafaa_app/generated/l10n.dart';
import 'package:kafaa_app/utils/app_images.dart';

class CustomCloseIcon extends StatelessWidget {
  const CustomCloseIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Tooltip(
        showDuration: const Duration(milliseconds: 700),
        waitDuration: const Duration(milliseconds: 700),
        message: S.of(context).close,
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.all(10),
            side: const BorderSide(
              color: Colors.transparent, 
              width: 2.0,
            ),
            shape:
                const CircleBorder(), // Use CircleBorder for a circular shape
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
          child:
              SvgPicture.asset(width: 50, height: 50, Assets.imagesCloseIcon),
        ),
      ),
    );
  }
}
