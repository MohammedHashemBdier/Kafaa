import 'package:flutter/material.dart';
import 'package:kafaa_app/models/drawer_item_model.dart';
import 'package:kafaa_app/utils/app_colors.dart';
import 'package:kafaa_app/widgets/drawer/active_and_inactive_drawer_item.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    super.key,
    required this.drawerItemModel,
    required this.isActive,
  });

  final DrawerItemModel drawerItemModel;
  final bool isActive;
  
  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.c4,
      child: isActive
          ? ActiveDrawerItem(drawerItemModel: drawerItemModel)
          : InActiveDrawerItem(drawerItemModel: drawerItemModel),
    );
  }
}
