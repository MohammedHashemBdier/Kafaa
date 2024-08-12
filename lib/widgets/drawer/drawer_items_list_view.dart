import 'package:flutter/material.dart';
import 'package:kafaa_app/extensions/navigator_on_context.dart';
import 'package:kafaa_app/utils/router.dart';
import 'package:kafaa_app/widgets/drawer/drawer_item.dart';

class DrawerItemsListView extends StatelessWidget {
  final String currentRoute;

  const DrawerItemsListView({
    super.key,
    required this.currentRoute,
  });

  @override
  Widget build(BuildContext context) {
    final items = AppRouter.drawerItems(context);
    
    return SliverList.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: InkWell(
            onTap: () {
              if (currentRoute != items[index].route)
                context.pushReplacementNamed(items[index].route);
            },
            child: DrawerItem(
              drawerItemModel: items[index],
              isActive: currentRoute == items[index].route,
            ),
          ),
        );
      },
    );
  }
}
