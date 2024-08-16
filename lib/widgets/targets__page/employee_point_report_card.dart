import 'package:flutter/material.dart';
import 'package:kafaa_app/generated/l10n.dart';
import 'package:kafaa_app/utils/app_colors.dart';
import 'package:kafaa_app/utils/app_styles.dart';
import 'package:flutter/services.dart';
import 'package:kafaa_app/widgets/custom_confirmation_dialog.dart';

class EmployeePointReportCard extends StatelessWidget {
  final String evaluationName, evaluationNumberName, evaluationAverageName;
  final String? evaluationNumber;
  final int evaluationAverage;
  final int points;
  final VoidCallback onDelete;

  const EmployeePointReportCard({
    super.key,
    required this.evaluationName,
    required this.points,
    required this.onDelete,
    required this.evaluationNumberName,
    required this.evaluationAverageName,
    this.evaluationNumber,
    required this.evaluationAverage,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  evaluationName,
                  style: AppStyles.styleBold24(context),
                ),
                Tooltip(
                  showDuration: const Duration(milliseconds: 700),
                  waitDuration: const Duration(milliseconds: 700),
                  message: S.of(context).delete,
                  child: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CustomConfirmationDialog(
                            content: S
                                .of(context)
                                .do_you_want_to_delete_the_evaluation,
                            onConfirm: () {
                              onDelete;
                            },
                          );
                        },
                      );
                    },
                    color: AppColors.c5,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "$evaluationNumberName: ",
                  style: AppStyles.styleBold16(context)
                      .copyWith(color: AppColors.c5),
                ),
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9+\-]')),
                    ],
                    decoration: InputDecoration(
                      hintText:
                          evaluationNumber ?? S.of(context).enter_the_number,
                      hintStyle: AppStyles.styleRegular16(context)
                          .copyWith(color: AppColors.c5),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "$evaluationAverageName:",
                  style: AppStyles.styleBold16(context)
                      .copyWith(color: AppColors.c5),
                ),
                Text(
                  " $evaluationAverage",
                  style: AppStyles.styleRegular16(context)
                      .copyWith(color: AppColors.c5),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "${S.of(context).points}:",
                  style: AppStyles.styleBold16(context)
                      .copyWith(color: AppColors.c5),
                ),
                Text(
                  " $points ${S.of(context).point}",
                  style: AppStyles.styleRegular16(context)
                      .copyWith(color: AppColors.c5),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
