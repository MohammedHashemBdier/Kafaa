import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kfaa_app/generated/l10n.dart';
import 'package:kfaa_app/utils/app_colors.dart';
import 'package:kfaa_app/utils/app_images.dart';
import 'package:kfaa_app/utils/app_styles.dart';
import 'package:kfaa_app/widgets/custom_app_container.dart';
import 'package:kfaa_app/widgets/custom_text_field.dart';

class CustomEmployeesTableHeader extends StatelessWidget {
  const CustomEmployeesTableHeader({
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
                SvgPicture.asset(
                  Assets.imagesEmployeesIcon,
                  height: 30,
                  width: 30,
                  colorFilter: ColorFilter.mode(AppColors.c5, BlendMode.srcIn),
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
