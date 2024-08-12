import 'package:flutter/material.dart';
import 'package:kafaa_app/utils/app_colors.dart';
import 'package:kafaa_app/utils/app_images.dart';
import 'package:kafaa_app/widgets/drawer/logout_button.dart';
import 'package:kafaa_app/widgets/drawer/drawer_items_list_view.dart';
import 'package:kafaa_app/widgets/custom_app_border_radius.dart';

class AppDrawer extends StatelessWidget {
  final String route;

  const AppDrawer({super.key, required this.route});

  @override
  Widget build(BuildContext context) {
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';

    return Container(
      decoration: BoxDecoration(
        borderRadius: customAppBorderRadius(isArabic),
        color: AppColors.c4,
      ),
      width: MediaQuery.sizeOf(context).width * .7,
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 50,
              child: Image.asset(Assets.imagesKafaaAppLogoPng),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
          DrawerItemsListView(currentRoute: route),
          const SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                Expanded(child: SizedBox(height: 20)),
                LogoutButton(),
                SizedBox(height: 50),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
