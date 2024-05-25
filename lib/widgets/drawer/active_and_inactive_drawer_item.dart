import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kafaa_app/models/drawer_item_model.dart';
import 'package:kafaa_app/utils/app_colors.dart';
import 'package:kafaa_app/utils/app_images.dart';
import 'package:kafaa_app/utils/app_styles.dart';

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
            colorFilter: ColorFilter.mode(AppColors.c5, BlendMode.srcIn),
          ),
        ),
        title: FittedBox(
          fit: BoxFit.scaleDown,
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            draweritemModel.title,
            style: AppStyles.styleBold16(context).copyWith(
              color: AppColors.c5,
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
        trailing: SvgPicture.asset(
          Assets.imagesAppFavIconSvg,
          width: 30,
          height: 30,
          colorFilter: ColorFilter.mode(AppColors.c1, BlendMode.srcIn),
        ),
      ),
    );
  }
}
