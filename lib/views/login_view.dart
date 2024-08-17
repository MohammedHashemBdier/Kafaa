import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafaa_app/blocs/auth/auth_bloc.dart';
import 'package:kafaa_app/generated/l10n.dart';
import 'package:kafaa_app/helpers/extensions/navigator_on_context.dart';
import 'package:kafaa_app/helpers/functions.dart';
import 'package:kafaa_app/utils/router.dart';
import 'package:kafaa_app/widgets/login_page/login_page.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthenticatedState) {
          context.pop();
          context.pushReplacementNamed(AppRouter.home);
          // showDialog(
          //   context: context,
          //   builder: (BuildContext context) {
          //     return CustomAlertDialog(
          //       content: S.of(context).you_are_now_logged_in,
          //     );
          //   },
          // );
        }

        if (state is LoginLoadingState) {
          HelperFunctions.loadingDialog(context);
        }

        if (state is LoginFailureState) {
          context.pop();
          HelperFunctions.failureSnackBar(
            context,
            S.of(context).Incorrect_password,
          );
        }
      },
      child: const LoginPage(),
    );
  }
}
