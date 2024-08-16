import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafaa_app/blocs/evaluations/show_edit_evaluation/show_edit_evaluation_bloc.dart';
import 'package:kafaa_app/generated/l10n.dart';
import 'package:kafaa_app/utils/app_styles.dart';
import 'package:kafaa_app/widgets/custom_app_container.dart';
import 'package:kafaa_app/widgets/custom_confirmation_dialog.dart';

class EvaluationInfoHeader extends StatelessWidget {
  const EvaluationInfoHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Tooltip(
            message: S.of(context).edit,
            showDuration: const Duration(milliseconds: 700),
            waitDuration: const Duration(milliseconds: 700),
            child: IconButton(
              icon: const Icon(Icons.edit),
              iconSize: 30,
              onPressed: () => context
                  .read<ShowEditEvaluationBloc>()
                  .add(EnableDisableEditingEvent()),
            ),
          ),
          const Expanded(child: SizedBox()),
          const Icon(Icons.star),
          const SizedBox(width: 10),
          Text(
            S.of(context).evaluation_info,
            style: AppStyles.styleBold24(context),
          ),
          const Expanded(child: SizedBox()),
          Tooltip(
            showDuration: const Duration(milliseconds: 700),
            waitDuration: const Duration(milliseconds: 700),
            message: S.of(context).delete,
            child: IconButton(
              icon: const Icon(Icons.delete),
              iconSize: 30,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext cnx) {
                    return CustomConfirmationDialog(
                      content:
                          S.of(context).do_you_want_to_delete_the_evaluation,
                      onConfirm: () {
                        Navigator.of(cnx).pop();
                        context
                            .read<ShowEditEvaluationBloc>()
                            .add(DeleteEvaluationEvent());
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
