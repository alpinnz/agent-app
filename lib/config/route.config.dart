import 'package:agent/features/authentication/routes/auth.route.dart';
import 'package:agent/features/main/routes/main.route.dart';
import 'package:agent/features/user/route/user.route.dart';
import 'package:sailor/sailor.dart';

class RouteConfig {
  static const SPLASH_ROUTE = '/splash';
  static const AUTH_LOGIN_ROUTE = '/auth/login';
  static const AUTH_FORGOT_PASSWORD_ROUTE = '/auth/forgot-password';
  static const AUTH_REGISTER_ROUTE = '/auth/register';

  static const MAIN_ROUTE = '/main';

  static const MAIN_MOTOR_ROUTE = '/main/motor';

  static const USER_PROFILE_ROUTE = '/user/profile';

  static void configureMainRoutes(Sailor router) {
    router.addRoutes(RouteConfigAuth.routes);
    router.addRoutes(RouteConfigMain.routes);
    router.addRoutes(RouteConfigUser.routes);
  }
}
