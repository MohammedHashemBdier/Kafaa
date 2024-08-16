import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafaa_app/blocs/auth/auth_bloc.dart';
import 'package:kafaa_app/utils/app_images.dart';
import 'package:kafaa_app/widgets/custom_password_field.dart';
import 'package:kafaa_app/widgets/login_page/login_button.dart';

import '../../generated/l10n.dart';

class LoginContent extends StatelessWidget {
  const LoginContent({super.key});

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
            child: Image.asset(Assets.imagesKafaaAppLogoPng),
          ),
        ),
        Row(
          children: [
            const Spacer(),
            Flexible(
              flex: 5,
              child: BlocSelector<AuthBloc, AuthState, GlobalKey<FormState>?>(
                selector: (state) {
                  return state is UnauthenticatedState ? state.formKey : null;
                },
                builder: (context, formKey) {
                  return Form(
                    key: formKey,
                    child: CustomPasswordField(
                      hint: S.of(context).enter_the_password,
                      label: S.of(context).password,
                      onChanged: (value) => context
                          .read<AuthBloc>()
                          .add(ChangePasswordEvent(password: value)),
                      validator: (value) => value == null || value.isEmpty
                          ? S.of(context).this_field_is_required
                          : null,
                    ),
                  );
                },
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
