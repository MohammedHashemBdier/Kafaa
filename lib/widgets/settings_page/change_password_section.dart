import 'package:flutter/material.dart';
import 'package:kafaa_app/widgets/settings_page/change_password_body.dart';
import 'package:kafaa_app/widgets/settings_page/change_password_header.dart';

class ChangePasswordSection extends StatelessWidget {
  const ChangePasswordSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ChangePasswordHeader(),
        ChangePasswordBody(),
      ],
    );
  }
}
