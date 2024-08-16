import 'package:flutter/material.dart';
import 'package:kafaa_app/generated/l10n.dart';
import 'package:kafaa_app/models/drawer_item_model.dart';
import 'package:kafaa_app/utils/app_images.dart';
import 'package:kafaa_app/views/employees_view.dart';
import 'package:kafaa_app/views/evaluation_view.dart';
import 'package:kafaa_app/views/home_view.dart';
import 'package:kafaa_app/views/login_view.dart';
import 'package:kafaa_app/views/settings_view.dart';
import 'package:page_transition/page_transition.dart';

abstract class AppRouter {
  static const String home = '/';
  static const String login = '/login';
  static const String settings = '/settings';
  static const String employees = '/employees';
  static const String targets = '/targets';
  static const String evaluations = '/evaluations';
  static const String notifications = '/notifications';

  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) =>
      switch (routeSettings.name) {
        login => PageTransition(
            child: const LoginView(),
            type: PageTransitionType.fade,
            alignment: Alignment.center,
            // duration: const Duration(milliseconds: 700),
            settings: routeSettings,
          ),
        home => PageTransition(
            child: const HomView(),
            type: PageTransitionType.fade,
            alignment: Alignment.center,
            // duration: const Duration(milliseconds: 700),
            settings: routeSettings,
          ),
        settings => PageTransition(
            child: const SettingsView(),
            type: PageTransitionType.fade,
            alignment: Alignment.center,
            // duration: const Duration(milliseconds: 700),
            settings: routeSettings,
          ),
        employees => PageTransition(
            child: const EmployeesView(),
            type: PageTransitionType.fade,
            alignment: Alignment.center,
            // duration: const Duration(milliseconds: 700),
            settings: routeSettings,
          ),
        evaluations => PageTransition(
            child: const EvaluationView(),
            type: PageTransitionType.fade,
            alignment: Alignment.center,
            // duration: const Duration(milliseconds: 700),
            settings: routeSettings,
          ),
        _ => null,
      };

  static List<DrawerItemModel> drawerItems(BuildContext context) => [
        DrawerItemModel(
          title: S.of(context).home,
          image: Assets.imagesDashboardIcon,
          route: AppRouter.home,
        ),
        DrawerItemModel(
          title: S.of(context).employees,
          image: Assets.imagesEmployeesIcon,
          route: AppRouter.employees,
        ),
        DrawerItemModel(
          title: S.of(context).targets,
          image: Assets.imagesTargetIcon,
          route: AppRouter.targets,
        ),
        DrawerItemModel(
          title: S.of(context).evaluations,
          image: Assets.imagesReviewsIcon,
          route: AppRouter.evaluations,
        ),
        DrawerItemModel(
          title: S.of(context).notification,
          image: Assets.imagesNotificationIcon,
          route: AppRouter.notifications,
        ),
        DrawerItemModel(
          title: S.of(context).settings,
          image: Assets.imagesSettingsIcon,
          route: AppRouter.settings,
        ),
      ];
}
