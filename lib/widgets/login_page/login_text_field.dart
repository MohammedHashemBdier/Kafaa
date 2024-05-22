import 'package:flutter/material.dart';
import 'package:kafaa_app/generated/l10n.dart';
import 'package:kafaa_app/widgets/custom_text_field.dart';

class LoginTextField extends StatelessWidget {
  const LoginTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isActiv = false;
    return Row(
      children: [
        const Expanded(
          child: SizedBox(),
        ),
        Expanded(
          flex: 3,
          child: CustomTextField(
            onTap: () {
              isActiv == true;
            },
            suffixIcon: IconButton(
                onPressed: () {}, icon: const Icon(Icons.remove_red_eye)),
            hint: S.of(context).entr_the_password,
            label: S.of(context).password,
          ),
        ),
        const Expanded(
          child: SizedBox(),
        ),
      ],
    );
  }
}
