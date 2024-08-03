import 'package:flutter/material.dart';
import 'package:kafaa_app/generated/l10n.dart';
import 'package:kafaa_app/utils/app_colors.dart';
import 'package:kafaa_app/widgets/evaluation_page/add_evaluation_dialog.dart';

class AddEvaluatonFloatingActionButton extends StatelessWidget {
  const AddEvaluatonFloatingActionButton({
    super.key,
  });

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
              return const AddAnEvaluationDialog();
            },
          );
        },
      ),
    );
  }
}
