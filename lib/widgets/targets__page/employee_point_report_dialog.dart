import 'package:flutter/material.dart';
import 'package:kafaa_app/utils/app_colors.dart';
import 'package:kafaa_app/utils/size_config.dart';
import 'package:kafaa_app/widgets/custom_app_container.dart';
import 'package:kafaa_app/widgets/custom_close_icon.dart';
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
          child: const CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomCloseIcon(),
                      EmployeePointReportHeader(),
                      Flexible(
                        child: CustomAppContainer(
                          child: EmployeePointReportBody(),
                        ),
                      ),
                      SizedBox(height: 40),
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
