import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafaa_app/blocs/auth/auth_bloc.dart';
import 'package:kafaa_app/helpers/extensions/navigator_on_context.dart';
import 'package:kafaa_app/utils/router.dart';
import 'package:kafaa_app/widgets/home_page/home_page.dart';

class HomView extends StatelessWidget {
  const HomView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is UnauthenticatedState) {
          context.popUntil((route) => route.isFirst);
          context.pushReplacementNamed(AppRouter.login);
        }
      },
      child: const HomePage(),
    );
  }
}
