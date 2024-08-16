import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafaa_app/blocs/evaluations/show_edit_evaluation/show_edit_evaluation_bloc.dart';
import 'package:kafaa_app/models/evaluation_model.dart';
import 'package:kafaa_app/utils/app_colors.dart';
import 'package:kafaa_app/utils/size_config.dart';
import 'package:kafaa_app/widgets/custom_app_container.dart';
import 'package:kafaa_app/widgets/custom_close_icon.dart';
import 'package:kafaa_app/widgets/custom_save_edits_button.dart';
import 'package:kafaa_app/widgets/evaluation_page/evaluation_info.dart';
import 'package:kafaa_app/widgets/evaluation_page/evaluation_info_header.dart';

class EvaluationsInfoDialog extends StatelessWidget {
  final EvaluationModel evaluation;
  final void Function() onDelete;
  final void Function(EvaluationModel newEvaluation) onEdit;
  

  const EvaluationsInfoDialog({
    super.key,
    required this.evaluation,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ShowEditEvaluationBloc>(
      create: (context) => ShowEditEvaluationBloc()
        ..add(GetEvaluationEvent(evaluation: evaluation)),
      child: BlocListener<ShowEditEvaluationBloc, ShowEditEvaluationState>(
        listener: (context, state) {
          if (state is DeleteEvaluationState) {
            onDelete.call();
            Navigator.of(context).pop();
          }

          if (state is SaveEvaluationState) {
            onEdit.call(state.evaluation);
          }
        },
        child: SizedBox(
          child: Dialog(
            elevation: 10,
            backgroundColor: AppColors.c2,
            child: SizedBox(
              width: SizeConfig.width < SizeConfig.desktop
                  ? MediaQuery.sizeOf(context).width * 0.8
                  : MediaQuery.sizeOf(context).width * 0.5,
              child: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const CustomCloseIcon(),
                          const EvaluationInfoHeader(),
                          const Flexible(
                            child: CustomAppContainer(
                              child: EvaluationInfo(),
                            ),
                          ),
                          const SizedBox(height: 10),
                          IntrinsicWidth(
                            child: CustomAppContainer(
                              child: BlocSelector<ShowEditEvaluationBloc,
                                  ShowEditEvaluationState, bool>(
                                selector: (state) => state is ShowInfoState
                                    ? state.isEditingEnabled
                                    : false,
                                builder: (context, enabled) {
                                  return CustomSaveEditsButton(
                                    enabled: enabled,
                                    onPressed: () {
                                      context
                                          .read<ShowEditEvaluationBloc>()
                                          .add(SaveEvaluationEvent());
                                      Navigator.of(context).pop();
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
