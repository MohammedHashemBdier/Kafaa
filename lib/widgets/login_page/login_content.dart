import 'package:flutter/material.dart';
import 'package:kafaa_app/utils/app_images.dart';
import 'package:kafaa_app/widgets/custom_password_field.dart';
import 'package:kafaa_app/widgets/login_page/login_buttom.dart';

import '../../generated/l10n.dart';

class LoginContent extends StatelessWidget {
  const LoginContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(
          height: 20,
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.all(100),
            child: Image.asset(Assets.imagesKfaaAppLogoPng),
          ),
        ),
        Row(
          children: [
            const Spacer(),
            Flexible(
              flex: 5,
              child: CustomPasswordField(
                hint: S.of(context).entr_the_password,
                label: S.of(context).password,
                onTap: () {},
              ),
            ),
            const Spacer(),
          ],
        ),
        const SizedBox(height: 20),
        const LoginButton(),
        const SizedBox(height: 20),
      ],
    );
  }
}
