import 'package:flutter/material.dart';
import 'package:kfaa_app/utils/app_colors.dart';
import 'package:kfaa_app/utils/app_images.dart';
import 'package:kfaa_app/widgets/drawer/custom_logout_buttom.dart';
import 'package:kfaa_app/widgets/drawer/drawer_items_list_view.dart';
import 'package:kfaa_app/widgets/app_border_radius.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';

    return Container(
      decoration: BoxDecoration(
        borderRadius: appBorderRadius(isArabic),
        color: AppColors.c4,
      ),
      width: MediaQuery.sizeOf(context).width * .7,
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 50,
              child: Image.asset(Assets.imagesKfaaAppLogoPng),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
          const DrawerItemsListView(),
          const SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                Expanded(child: SizedBox(height: 20)),
                CustomLogoutButon(),
                SizedBox(height: 50),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
