import 'package:flutter/material.dart';
import 'package:kafaa_app/generated/l10n.dart';
import 'package:kafaa_app/utils/app_colors.dart';
import 'package:kafaa_app/utils/app_styles.dart';
import 'package:kafaa_app/utils/size_config.dart';
import 'package:kafaa_app/widgets/custom_app_container.dart';
import 'package:kafaa_app/widgets/custom_close_icon.dart';
import 'package:kafaa_app/widgets/custom_date_dialog.dart';
import 'package:kafaa_app/widgets/custom_next_button.dart';
import 'package:kafaa_app/widgets/custom_text_field.dart';
import 'package:kafaa_app/widgets/targets__page/employee_point_report_dialog.dart';

class SelectDateDialog extends StatelessWidget {
  const SelectDateDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 10,
      backgroundColor: AppColors.c2,
      child: IntrinsicWidth(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: SizeConfig.width < SizeConfig.desktop
                ? MediaQuery.sizeOf(context).width * 0.8
                : MediaQuery.sizeOf(context).width * 0.5,
          ),
          child: IntrinsicHeight(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CustomCloseIcon(),
                  CustomAppContainer(
                    child: Column(
                      children: [
                        Text(
                          S.of(context).employee_point_report,
                          style: AppStyles.styleBold24(context),
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          label: S.of(context).select_date,
                          prefixIcon: const Icon(Icons.calendar_today),
                          hint: S.of(context).select_date,
                          onTap: () {
                            customSelectDate(context);
                          },
                        ),
                        const SizedBox(height: 10),
                        IntrinsicWidth(
                          child: CustomNextButton(
                            enabled: true,
                            onPressed: () {
                              Navigator.of(context).pop();

                              showDialog(
                                context: context,
                                builder: (context) =>
                                    const EmployeePointReportDialog(),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
