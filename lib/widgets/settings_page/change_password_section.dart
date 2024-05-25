import 'package:flutter/material.dart';
import 'package:kafaa_app/widgets/settings_page/change_password_body.dart';
import 'package:kafaa_app/widgets/settings_page/change_password_header.dart';

class ChangePassworSection extends StatelessWidget {
  const ChangePassworSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ChangePasswordHeader(),
        ChangePassworBody(),
      ],
    );
  }
}
