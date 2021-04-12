import 'package:agent/config/route.config.dart';
import 'package:agent/core/app.dart';
import 'package:agent/features/authentication/screen/login.screen.dart';
import 'package:agent/features/authentication/screen/splash.screen.dart';
import 'package:flutter/material.dart';
import 'package:sailor/sailor.dart';

class RouteConfigAuth {
  static final List<SailorRoute> routes = <SailorRoute>[
    SailorRoute(
      name: RouteConfig.SPLASH_ROUTE,
      builder: (context, args, params) {
        return SplashScreen();
      },
    ),
    SailorRoute(
      name: RouteConfig.AUTH_LOGIN_ROUTE,
      builder: (context, args, params) {
        return LoginScreen();
      },
    ),
  ];

  static void navigateToLogin(BuildContext context, {bool clearStack = false}) {
    if (clearStack) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          RouteConfig.AUTH_LOGIN_ROUTE, (Route<dynamic> route) => false);
    } else {
      App.main.router.navigate(
        RouteConfig.AUTH_LOGIN_ROUTE,
        navigationType: NavigationType.pushAndRemoveUntil,
        removeUntilPredicate: (_) => false,
      );
    }
  }

  static void navigateToForgotPassword(BuildContext context,
      {bool clearStack = false}) {
    if (clearStack) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          RouteConfig.AUTH_FORGOT_PASSWORD_ROUTE,
          (Route<dynamic> route) => false);
    } else {
      App.main.router.navigate(RouteConfig.AUTH_FORGOT_PASSWORD_ROUTE);
    }
  }

  static void navigateToRegister(BuildContext context,
      {bool clearStack = false}) {
    if (clearStack) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          RouteConfig.AUTH_REGISTER_ROUTE, (Route<dynamic> route) => false);
    } else {
      App.main.router.navigate(RouteConfig.AUTH_REGISTER_ROUTE);
    }
  }
}
