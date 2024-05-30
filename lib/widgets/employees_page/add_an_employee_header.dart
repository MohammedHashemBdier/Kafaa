import 'package:flutter/material.dart';
import 'package:kafaa_app/generated/l10n.dart';
import 'package:kafaa_app/utils/app_styles.dart';
import 'package:kafaa_app/widgets/custom_app_container.dart';
import 'package:lottie/lottie.dart';

class AddAnEmployeeHeader extends StatelessWidget {
  const AddAnEmployeeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAppContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            fit: FlexFit.loose,
            child: Lottie.asset(
              'assets/lottie/add_an_employee_header.json',
              reverse: true,
              height: 75,
              width: 100,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            S.of(context).add_an_employee,
            style: AppStyles.styleBold24(context),
          ),
        ],
      ),
    );
  }
}
