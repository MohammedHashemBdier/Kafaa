import 'package:flutter/material.dart';
import 'package:kafaa_app/utils/app_styles.dart';
import 'package:kafaa_app/widgets/custom_app_container.dart';

class EmployeePointReportHeader extends StatelessWidget {
  const EmployeePointReportHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAppContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Text(
            "Mohammed Hashem Bdier",
            style: AppStyles.styleBold24(context),
          ),
          const Spacer(),
          Text(
            "8/2024",
            style: AppStyles.styleBold24(context),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
