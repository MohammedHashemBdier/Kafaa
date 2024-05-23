import 'package:flutter/material.dart';
import 'package:kafaa_app/generated/l10n.dart';
import 'package:kafaa_app/utils/app_colors.dart';
import 'package:kafaa_app/utils/app_images.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const CustomAppBar({super.key, required this.scaffoldKey});

  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight); // Assuming standard toolbar height

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      elevation: 0,
      backgroundColor: AppColors.c4,
      centerTitle: true,
      title: Image.asset(
        Assets.imagesKfaaAppLogoPng,
        width: 100,
        height: 100,
      ),
      leading: Tooltip(
        message: S.of(context).main_menu,
        showDuration: const Duration(milliseconds: 700),
        waitDuration: const Duration(milliseconds: 700),
        child: IconButton(
          icon: Icon(
            Icons.menu,
            color: AppColors.c1,
          ),
          onPressed: () {
            scaffoldKey.currentState!.openDrawer();
          },
        ),
      ),
    );
  }
}
