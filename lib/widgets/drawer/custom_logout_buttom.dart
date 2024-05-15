import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kfaa_app/generated/l10n.dart';
import 'package:kfaa_app/utils/app_colors.dart';
import 'package:kfaa_app/utils/app_images.dart';
import 'package:kfaa_app/utils/app_styles.dart';
import 'package:kfaa_app/views/login_view.dart';

class CustomLogoutButon extends StatelessWidget {
  const CustomLogoutButon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.c3,
      child: GestureDetector(
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => (const LoginView()),
            ),
          );
        },
        child: ListTile(
          leading: FittedBox(
            fit: BoxFit.scaleDown,
            child: SvgPicture.asset(
              Assets.imagesLogoutIcon,
              width: 30,
              height: 30,
            ),
          ),
          title: FittedBox(
            fit: BoxFit.scaleDown,
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              S.of(context).logout,
              style: AppStyles.styleBold24(context).copyWith(
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
