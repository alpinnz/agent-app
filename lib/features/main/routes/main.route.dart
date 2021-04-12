import 'package:agent/config/route.config.dart';
import 'package:agent/core/app.dart';
import 'package:agent/features/main/screen/main.screen.dart';
import 'package:agent/features/main/screen/motor.screen.dart';
import 'package:flutter/material.dart';
import 'package:sailor/sailor.dart';

class RouteConfigMain {
  static final List<SailorRoute> routes = <SailorRoute>[
    SailorRoute(
      name: RouteConfig.MAIN_ROUTE,
      builder: (context, args, params) {
        return MainScreen();
      },
    ),
    SailorRoute(
      name: RouteConfig.MAIN_MOTOR_ROUTE,
      builder: (context, args, params) {
        return MotorScreen();
      },
    ),
  ];

  static void navigateToMain(BuildContext context, {bool clearStack = false}) {
    if (clearStack) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          RouteConfig.MAIN_ROUTE, (Route<dynamic> route) => false);
    } else {
      App.main.router.navigate(
        RouteConfig.MAIN_ROUTE,
        navigationType: NavigationType.pushAndRemoveUntil,
        removeUntilPredicate: (_) => false,
      );
    }
  }

  static void navigateToMotor(BuildContext context, {bool clearStack = false}) {
    if (clearStack) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          RouteConfig.MAIN_MOTOR_ROUTE, (Route<dynamic> route) => false);
    } else {
      App.main.router.navigate(RouteConfig.MAIN_MOTOR_ROUTE);
    }
  }
}
