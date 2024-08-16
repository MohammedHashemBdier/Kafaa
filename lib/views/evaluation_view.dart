import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafaa_app/blocs/auth/auth_bloc.dart';
import 'package:kafaa_app/blocs/evaluations/evaluations/evaluations_bloc.dart';
import 'package:kafaa_app/helpers/extensions/navigator_on_context.dart';
import 'package:kafaa_app/utils/dependency_injection.dart';
import 'package:kafaa_app/utils/router.dart';
import 'package:kafaa_app/widgets/evaluation_page/evaluation_page.dart';

class EvaluationView extends StatelessWidget {
  const EvaluationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EvaluationsBloc>(
      create: (context) =>
          locator<EvaluationsBloc>()..add(GetEvaluationsEvent()),
      child: MultiBlocListener(
        listeners: [
          BlocListener<EvaluationsBloc, EvaluationsState>(
            listener: (context, state) {},
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
        child: const EvaluationPage(),
      ),
    );
  }
}
