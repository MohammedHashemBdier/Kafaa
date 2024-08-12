import 'package:flutter/material.dart';
import 'package:kafaa_app/widgets/settings_page/settings_body.dart';
import 'package:kafaa_app/widgets/settings_page/settings_header.dart';

class SettingsSection extends StatelessWidget {
  const SettingsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SettingsHeader(),
        SettingsBody(),
      ],
    );
  }
}
