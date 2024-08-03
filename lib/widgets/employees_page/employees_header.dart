import 'package:flutter/material.dart';
import 'package:kafaa_app/generated/l10n.dart';
import 'package:kafaa_app/utils/app_styles.dart';
import 'package:kafaa_app/widgets/custom_app_container.dart';
import 'package:kafaa_app/widgets/custom_text_field.dart';
import 'package:lottie/lottie.dart';

class EmployeesHeader extends StatelessWidget {
  const EmployeesHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAppContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  fit: FlexFit.loose,
                  child: Lottie.asset(
                    'assets/lottie/employees_header.json',
                    height: 150,
                    width: 150,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  S.of(context).employees,
                  style: AppStyles.styleBold24(context),
                ),
              ],
            ),
          ),
          Expanded(
            child: CustomTextField(
              suffixIcon: const Icon(Icons.search),
              hint: S.of(context).search_for_an_employee,
              label: S.of(context).the_search,
            ),
          ),
        ],
      ),
    );
  }
}
