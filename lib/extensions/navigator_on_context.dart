import 'package:flutter/material.dart';

extension NavigatorExtension on BuildContext {
  void pop<T extends Object?>([T? result]) => Navigator.pop<T>(this, result);

  void popUntil(bool Function(Route<dynamic> route) predicate) =>
      Navigator.popUntil(this, predicate);

  Future<T?> push<T extends Object?>(
    Widget route, {
    RouteSettings? settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
    bool allowSnapshotting = true,
  }) {
    return Navigator.push<T>(
      this,
      MaterialPageRoute<T>(builder: (context) => route),
    );
  }

  Future<T?> pushNamed<T extends Object?>(
    String routeName, {
    Object? arguments,
  }) {
    return Navigator.pushNamed<T>(
      this,
      routeName,
      arguments: arguments,
    );
  }

  Future<T?> pushReplacement<T extends Object?, TO extends Object?>(
    Widget route, {
    TO? result,
  }) {
    return Navigator.pushReplacement<T, TO>(
      this,
      MaterialPageRoute<T>(builder: (context) => route),
      result: result,
    );
  }

  Future<T?> pushReplacementNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    TO? result,
    Object? arguments,
  }) {
    return Navigator.pushReplacementNamed<T, TO>(
      this,
      routeName,
      result: result,
      arguments: arguments,
    );
  }
}
