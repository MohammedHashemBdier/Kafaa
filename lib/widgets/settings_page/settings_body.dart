import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kafaa_app/blocks/localization/localization_bloc.dart';
import 'package:kafaa_app/generated/l10n.dart';
import 'package:kafaa_app/utils/app_colors.dart';
import 'package:kafaa_app/utils/app_images.dart';
import 'package:kafaa_app/utils/app_styles.dart';
import 'package:kafaa_app/widgets/custom_app_container.dart';
import 'package:kafaa_app/widgets/custom_dropdown_list.dart';

class SettingsBody extends StatelessWidget {
  const SettingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 3,
            child: SvgPicture.asset(
              Assets.imagesAdminAvatar,
              colorFilter: ColorFilter.mode(AppColors.c5, BlendMode.srcIn),
              height: 250,
            ),
          ),
          const SizedBox(height: 20),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                    text: "${S.of(context).name}: ",
                    style: AppStyles.styleMedium24(context)),
                TextSpan(
                    text: "${S.of(context).admin}\n",
                    style: AppStyles.styleRegular16(context)
                        .copyWith(color: AppColors.c5)),
                TextSpan(
                    text: "${S.of(context).last_login}: ",
                    style: AppStyles.styleSemiBold24(context)),
                TextSpan(
                    text: "24/5/2024 15:36:20\n",
                    style: AppStyles.styleRegular16(context)
                        .copyWith(color: AppColors.c5)),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Text(S.of(context).the_language,
              style: AppStyles.styleMedium24(context)),
          CustomDropdownList(
            menuItems: [
              S.of(context).arabic,
              S.of(context).english,
            ],
            label: S.of(context).the_language,
            hintText: S.of(context).choose_a_language,
            icon: Padding(
              padding: const EdgeInsets.only(right: 10, left: 10, top: 6),
              child: FaIcon(
                FontAwesomeIcons.language,
                color: AppColors.c5,
              ),
            ),
            enabled: true,
            selectedValue:
                context.read<LocalizationBloc>().state.languageCode == 'ar'
                    ? S.of(context).arabic
                    : S.of(context).english,
            onChose: (value) => context.read<LocalizationBloc>().add(
                ChangeLanguageEvent(
                    languageCode: value == S.of(context).arabic ? 'ar' : 'en')),
          ),
        ],
      ),
    );
  }
}
