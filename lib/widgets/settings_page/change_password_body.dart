import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kafaa_app/generated/l10n.dart';
import 'package:kafaa_app/utils/app_styles.dart';
import 'package:kafaa_app/widgets/custom_app_container.dart';
import 'package:kafaa_app/widgets/custom_password_field.dart';
import 'package:kafaa_app/widgets/custom_save_edits_button.dart';

class ChangePassworBody extends StatelessWidget {
  const ChangePassworBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAppContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(S.of(context).old_password,
              style: AppStyles.styleBold16(context)),
          CustomPasswordField(
            label: S.of(context).old_password,
            enabled: true,
            hint: S.of(context).add_password,
            onTap: () {},
          ),
          Text(S.of(context).new_password,
              style: AppStyles.styleBold16(context)),
          CustomPasswordField(
            label: S.of(context).new_password,
            enabled: false,
            hint: S.of(context).add_password,
            onTap: () {},
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.center,
            child: IntrinsicWidth(
              child: CustomSaveEditsButton(
                onPressed: () {},
                enabled: false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
