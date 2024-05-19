import 'package:flutter/material.dart';
import 'package:kfaa_app/utils/app_colors.dart';

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
      leading: IconButton(
        icon: Icon(
          Icons.menu,
          color: AppColors.c1,
        ),
        onPressed: () {
          scaffoldKey.currentState!.openDrawer();
        },
      ),
    );
  }
}
