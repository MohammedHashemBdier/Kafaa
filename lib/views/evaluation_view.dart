import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafaa_app/blocks/evaluations/evaluations/evaluations_bloc.dart';
import 'package:kafaa_app/utils/dependency_injection.dart';
import 'package:kafaa_app/widgets/evaluation_page/evaluation_page.dart';

class EvaluationView extends StatelessWidget {
  const EvaluationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EvaluationsBloc>(
      create: (context) =>
          locator<EvaluationsBloc>()..add(GetEvaluationsEvent()),
      child: BlocListener<EvaluationsBloc, EvaluationsState>(
        listener: (context, state) {},
        child: const EvaluationPage(),
      ),
    );
  }
}
