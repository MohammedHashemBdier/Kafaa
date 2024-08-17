import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafaa_app/blocs/auth/auth_bloc.dart';
import 'package:kafaa_app/blocs/settings/settings_bloc.dart';
import 'package:kafaa_app/generated/l10n.dart';
import 'package:kafaa_app/helpers/extensions/navigator_on_context.dart';
import 'package:kafaa_app/helpers/functions.dart';
import 'package:kafaa_app/utils/dependency_injection.dart';
import 'package:kafaa_app/utils/router.dart';
import 'package:kafaa_app/widgets/settings_page/settings_page.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SettingsBloc>(
      create: (context) => locator<SettingsBloc>()..add(GetDataEvent()),
      child: MultiBlocListener(
        listeners: [
          BlocListener<SettingsBloc, SettingsState>(
            listener: (context, state) {
              if (state is ChangePasswordSuccessState)
                HelperFunctions.successSnackBar(
                  context,
                  S.of(context).Password_changed_successfully,
                );

              if (state is ChangePasswordFailureState)
                HelperFunctions.failureSnackBar(
                  context,
                  S.of(context).Old_password_is_wrong,
                );
            },
          ),
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is UnauthenticatedState) {
                context.popUntil((route) => route.isFirst);
                context.pushReplacementNamed(AppRouter.login);
              }
            },
          ),
        ],
        child: const SettingsPage(),
      ),
    );
  }
}
