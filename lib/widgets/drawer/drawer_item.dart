import 'package:flutter/material.dart';
import 'package:kfaa_app/models/drawer_item_model.dart';
import 'package:kfaa_app/utils/app_colors.dart';
import 'package:kfaa_app/widgets/drawer/active_and_inactive_drawer_item.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem(
      {super.key, required this.draweritemModel, required this.isActive});
  final DrawerItemModel draweritemModel;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.c4,
      child: isActive
          ? ActiveDrawerItem(draweritemModel: draweritemModel)
          : InActiveDrawerItem(draweritemModel: draweritemModel),
    );
  }
}
