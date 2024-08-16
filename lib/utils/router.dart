import 'package:flutter/material.dart';
import 'package:kafaa_app/generated/l10n.dart';
import 'package:kafaa_app/models/drawer_item_model.dart';
import 'package:kafaa_app/utils/app_images.dart';
import 'package:kafaa_app/views/employees_view.dart';
import 'package:kafaa_app/views/evaluation_view.dart';
import 'package:kafaa_app/views/home_view.dart';
import 'package:kafaa_app/views/login_view.dart';
import 'package:kafaa_app/views/settings_view.dart';
import 'package:kafaa_app/views/targets_view.dart';
import 'package:page_transition/page_transition.dart';

abstract class AppRouter {
  static const String login = '/login';
  static const String home = '/home';
  static const String settings = '/settings';
  static const String employees = '/employees';
  static const String target = '/target';
  static const String evaluation = '/evaluation';
  static const String notifications = '/notifications';

  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    const transitionType = PageTransitionType.fade;
    const transitionDuration = Duration(milliseconds: 500);

    switch (routeSettings.name) {
      case login:
        return PageTransition(
          child: const LoginView(),
          type: transitionType,
          alignment: Alignment.center,
          duration: transitionDuration,
          settings: routeSettings,
        );
      case home:
        return PageTransition(
          child: const HomeView(),
          type: transitionType,
          alignment: Alignment.center,
          duration: transitionDuration,
          settings: routeSettings,
        );
      case settings:
        return PageTransition(
          child: const SettingsView(),
          type: transitionType,
          alignment: Alignment.center,
          duration: transitionDuration,
          settings: routeSettings,
        );
      case employees:
        return PageTransition(
          child: const EmployeesView(),
          type: transitionType,
          alignment: Alignment.center,
          duration: transitionDuration,
          settings: routeSettings,
        );
      case target:
        return PageTransition(
          child: const TargetsView(),
          type: transitionType,
          alignment: Alignment.center,
          duration: transitionDuration,
          settings: routeSettings,
        );
      case evaluation:
        return PageTransition(
          child: const EvaluationView(),
          type: transitionType,
          alignment: Alignment.center,
          duration: transitionDuration,
          settings: routeSettings,
        );
      default:
        return null;
    }
  }

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
          route: AppRouter.target,
        ),
        DrawerItemModel(
          title: S.of(context).evaluations,
          image: Assets.imagesReviewsIcon,
          route: AppRouter.evaluation,
        ),
        DrawerItemModel(
          title: S.of(context).settings,
          image: Assets.imagesSettingsIcon,
          route: AppRouter.settings,
        ),
      ];
}
