import 'package:flutter/material.dart';
import 'package:kfaa_app/generated/l10n.dart';
import 'package:kfaa_app/widgets/custom_text_field.dart';

class CustomLoginTextField extends StatelessWidget {
  const CustomLoginTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: SizedBox(),
        ),
        Expanded(
          flex: 3,
          child: CustomTextField(
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
