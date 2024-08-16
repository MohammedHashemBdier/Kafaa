import 'package:flutter/material.dart';
import 'package:kafaa_app/utils/app_colors.dart';
import 'package:kafaa_app/utils/size_config.dart';
import 'package:kafaa_app/widgets/custom_app_container.dart';
import 'package:kafaa_app/widgets/custom_close_icon.dart';
import 'package:kafaa_app/widgets/custom_save_edits_button.dart';
import 'package:kafaa_app/widgets/targets__page/employee_point_report_body.dart';
import 'package:kafaa_app/widgets/targets__page/employee_point_report_header.dart';

class EmployeePointReportDialog extends StatelessWidget {
  const EmployeePointReportDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                      const EmployeePointReportHeader(),
                      const Flexible(
                        child: CustomAppContainer(
                          child: EmployeePointReportBody(),
                        ),
                      ),
                      const SizedBox(height: 20),
                      IntrinsicWidth(
                        child: CustomAppContainer(
                          child: CustomSaveEditsButton(
                            enabled: true,
                            onPressed: () {},
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
