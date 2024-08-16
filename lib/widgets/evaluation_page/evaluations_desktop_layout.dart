import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafaa_app/blocs/evaluations/evaluations/evaluations_bloc.dart';
import 'package:kafaa_app/utils/router.dart';
import 'package:kafaa_app/widgets/drawer/app_drawer.dart';
import 'package:kafaa_app/widgets/evaluation_page/add_evaluation_section.dart';
import 'package:kafaa_app/widgets/evaluation_page/evaluations_section.dart';

class EvaluationsDesktopLayout extends StatelessWidget {
  const EvaluationsDesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: AppDrawer(route: AppRouter.evaluations)),
        const SizedBox(width: 30),
        Expanded(
          flex: 4,
          child: BlocBuilder<EvaluationsBloc, EvaluationsState>(
            builder: (context, state) {
              if (state is GetEvaluationsLoadedState)
                return CustomScrollView(
                  slivers: [
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 40, bottom: 40, right: 20, left: 20),
                        child: Row(
                          children: [
                            const Expanded(
                              flex: 2,
                              child: EvaluationsSection(),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: AddEvaluationSection(
                                evaluationTypes: (context
                                        .read<EvaluationsBloc>()
                                        .state as GetEvaluationsLoadedState)
                                    .evaluationTypes,
                                onAdd: (evaluation) => context
                                    .read<EvaluationsBloc>()
                                    .add(AddEvaluationEvent(
                                        evaluation: evaluation)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                );
              return const SizedBox();
            },
          ),
        ),
      ],
    );
  }
}
