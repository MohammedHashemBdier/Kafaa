import 'package:flutter/material.dart';
import 'package:kafaa_app/generated/l10n.dart';
import 'package:kafaa_app/models/drawer_item_model.dart';
import 'package:kafaa_app/utils/app_images.dart';
import 'package:kafaa_app/widgets/drawer/drawer_item.dart';

class DrawerItemsListView extends StatefulWidget {
  const DrawerItemsListView({
    super.key,
  });

  @override
  State<DrawerItemsListView> createState() => _DrawerItemsListViewState();
}

class _DrawerItemsListViewState extends State<DrawerItemsListView> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<DrawerItemModel> items = [
      DrawerItemModel(
          title: S.of(context).home, image: Assets.imagesDashboardIcon),
      DrawerItemModel(
          title: S.of(context).employees, image: Assets.imagesEmployeesIcon),
      DrawerItemModel(
          title: S.of(context).targets, image: Assets.imagesTargetIcon),
      DrawerItemModel(
          title: S.of(context).reviews, image: Assets.imagesReviewsIcon),
      DrawerItemModel(
          title: S.of(context).notification,
          image: Assets.imagesNotificationIcon),
      DrawerItemModel(
          title: S.of(context).settings, image: Assets.imagesSettingsIcon),
    ];

    return SliverList.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: InkWell(
            onTap: () {
              if (activeIndex != index) {
                setState(
                  () {
                    activeIndex = index;
                  },
                );
              }
            },
            child: DrawerItem(
              draweritemModel: items[index],
              isActive: activeIndex == index,
            ),
          ),
        );
      },
    );
  }
}
