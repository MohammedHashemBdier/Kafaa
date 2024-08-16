import 'package:flutter/material.dart';
import 'package:kafaa_app/generated/l10n.dart';
import 'package:kafaa_app/utils/app_colors.dart';

class CustomChangeLanguageIconButten extends StatelessWidget {
  const CustomChangeLanguageIconButten({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Padding(
        padding: const EdgeInsets.all(20),
        child: Tooltip(
          message: S.of(context).choose_a_language,
          showDuration: const Duration(milliseconds: 700),
          waitDuration: const Duration(milliseconds: 700),
          child: Icon(
            Icons.language,
            color: AppColors.c5,
            size: 40,
          ),
        ),
      ),
      onPressed: () {},
    );
  }
}