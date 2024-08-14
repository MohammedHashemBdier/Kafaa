import 'package:flutter/material.dart';
import 'package:kafaa_app/generated/l10n.dart';
import 'package:kafaa_app/models/evaluation_model.dart';
import 'package:kafaa_app/utils/app_colors.dart';
import 'package:kafaa_app/widgets/evaluation_page/add_evaluation_dialog.dart';

class AddEvaluationFloatingActionButton extends StatelessWidget {
  final void Function(EvaluationModel evaluation) onAdd;

  const AddEvaluationFloatingActionButton({super.key, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: S.of(context).add_evaluation,
      showDuration: const Duration(milliseconds: 700),
      waitDuration: const Duration(milliseconds: 700),
      child: FloatingActionButton(
        elevation: 3,
        child: Icon(
          Icons.add,
          color: AppColors.c5,
          size: 30,
        ),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AddAnEvaluationDialog(onAdd: onAdd);
            },
          );
        },
      ),
    );
  }
}
