import 'package:flutter/material.dart';
import 'package:kafaa_app/utils/app_colors.dart';
import 'package:kafaa_app/widgets/custom_app_border_radius.dart';
import 'package:kafaa_app/widgets/login_page/login_content.dart';

class LoginDesktopSection extends StatelessWidget {
  const LoginDesktopSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';

    return Row(
      children: [
        Expanded(
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: PhysicalModel(
                  color: Colors.black,
                  elevation: 10,
                  shadowColor: AppColors.c1,
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    alignment: Alignment.topRight,
                    decoration: BoxDecoration(
                      borderRadius: customAppBorderRadius(isArabic),
                      color: AppColors.c4,
                    ),
                    child: const LoginContent(),
                  ),
                ),
              ),
            ],
          ),
        ),
        const Expanded(child: SizedBox()),
      ],
    );
  }
}
