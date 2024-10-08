import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafaa_app/blocs/evaluations/evaluations/evaluations_bloc.dart';
import 'package:kafaa_app/utils/adaptiv_layout.dart';
import 'package:kafaa_app/utils/app_colors.dart';
import 'package:kafaa_app/utils/router.dart';
import 'package:kafaa_app/utils/size_config.dart';
import 'package:kafaa_app/widgets/custom_app_bar.dart';
import 'package:kafaa_app/widgets/drawer/app_drawer.dart';
import 'package:kafaa_app/widgets/evaluation_page/add_evaluation_floating_action_button.dart';
import 'package:kafaa_app/widgets/evaluation_page/evaluations_desktop_layout.dart';
import 'package:kafaa_app/widgets/evaluation_page/evaluations_mobile_layout.dart';
import 'package:kafaa_app/widgets/evaluation_page/evaluations_tablet_layout.dart';

class EvaluationPage extends StatelessWidget {
  const EvaluationPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return BlocBuilder<EvaluationsBloc, EvaluationsState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.c3,
          drawer: SizeConfig.width < SizeConfig.tablet
              ? const AppDrawer(route: AppRouter.evaluations)
              : null,
          appBar: SizeConfig.width < SizeConfig.tablet
              ? const CustomAppBar()
              : null,
          floatingActionButton: state is GetEvaluationsLoadedState
              ? SizeConfig.width < SizeConfig.desktop
                  ? AddEvaluationFloatingActionButton(
                      onAdd: (evaluation) => context
                          .read<EvaluationsBloc>()
                          .add(AddEvaluationEvent(evaluation: evaluation)),
                      evaluationTypes: state.evaluationTypes,
                    )
                  : null
              : null,
          body: AdaptiveLayout(
            mobileLayout: (context) => const EvaluationsMobileLayout(),
            tabletLayout: (context) => const EvaluationsTabletLayout(),
            desktopLayout: (context) => const EvaluationsDesktopLayout(),
          ),
        );
      },
    );
  }
}
