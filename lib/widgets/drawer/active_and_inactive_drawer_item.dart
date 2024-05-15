import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kfaa_app/models/drawer_item_model.dart';
import 'package:kfaa_app/utils/app_colors.dart';
import 'package:kfaa_app/utils/app_styles.dart';

class InActiveDrawerItem extends StatelessWidget {
  const InActiveDrawerItem({
    super.key,
    required this.draweritemModel,
  });

  final DrawerItemModel draweritemModel;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.c4,
      child: ListTile(
        leading: FittedBox(
          fit: BoxFit.scaleDown,
          child: SvgPicture.asset(
            draweritemModel.image,
            width: 25,
            height: 25,
            colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
          ),
        ),
        title: FittedBox(
          fit: BoxFit.scaleDown,
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            draweritemModel.title,
            style: AppStyles.styleBold16(context).copyWith(
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

class ActiveDrawerItem extends StatelessWidget {
  const ActiveDrawerItem({
    super.key,
    required this.draweritemModel,
  });

  final DrawerItemModel draweritemModel;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.c4,
      child: ListTile(
        leading: FittedBox(
          child: SvgPicture.asset(
            draweritemModel.image,
            width: 50,
            height: 50,
          ),
        ),
        title: FittedBox(
          fit: BoxFit.scaleDown,
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            draweritemModel.title,
            style: AppStyles.styleSemiBold24(context)
                .copyWith(color: AppColors.c1),
          ),
        ),
        trailing: Container(
          width: 4,
          decoration: BoxDecoration(
            color: AppColors.c1,
          ),
        ),
      ),
    );
  }
}
