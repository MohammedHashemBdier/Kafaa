import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kafaa_app/generated/l10n.dart';
import 'package:kafaa_app/utils/app_colors.dart';
import 'package:kafaa_app/utils/app_styles.dart';
import 'package:kafaa_app/widgets/custom_confirmation_dialog.dart';

class EmployeePointReportAddDeleteCard extends StatelessWidget {
  const EmployeePointReportAddDeleteCard({
    super.key,
    required this.onDelete,
    this.number,
    this.comment,
  });
  final VoidCallback onDelete;
  final String? number, comment;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(S.of(context).Add_Discount,
                    style: AppStyles.styleBold24(context)),
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9+\-]')),
                    ],
                    decoration: InputDecoration(
                      hintText: number ?? S.of(context).enter_the_number,
                      hintStyle: AppStyles.styleRegular16(context)
                          .copyWith(color: AppColors.c5),
                      border: InputBorder.none,
                    ),
                  ),
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
            TextFormField(
              maxLines: 5,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: comment ?? S.of(context).Enter_your_notes_here,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
