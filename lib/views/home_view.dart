import 'package:flutter/material.dart';
import 'package:kafaa_app/utils/app_colors.dart';
import 'package:kafaa_app/utils/size_config.dart';
import 'package:kafaa_app/utils/adaptiv_layout.dart';
import 'package:kafaa_app/widgets/custom_app_bar.dart';
import 'package:kafaa_app/widgets/drawer/app_drawer.dart';
import 'package:kafaa_app/widgets/home_page/Home_desktop_layout.dart';

class HomView extends StatefulWidget {
  const HomView({super.key});

  @override
  State<HomView> createState() => _HomViewState();
}

class _HomViewState extends State<HomView> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: AppColors.c3,
      key: scaffoldKey,
      drawer: SizeConfig.width < SizeConfig.tablet ? const AppDrawer() : null,
      appBar: SizeConfig.width < SizeConfig.tablet
          ? CustomAppBar(scaffoldKey: scaffoldKey)
          : null,
      body: AdaptiveLayout(
        mobileLayout: (context) => const SizedBox(),
        tabletLayout: (context) => const SizedBox(),
        desktopLayout: (context) => const HomeDesktopLayout(),
      ),
    );
  }
}
