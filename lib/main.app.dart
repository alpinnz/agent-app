import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/flavor.config.dart';
import 'core/app.dart';
import 'core/helper/InspectTool.dart';
import 'core/utils/fonts.utils.dart';
import 'core/utils/sizes.utils.dart';
import 'features/authentication/bloc/authentication/authentication_bloc.dart';
import 'features/authentication/repository/authentication.repository.dart';
import 'features/authentication/screen/login.screen.dart';
import 'features/authentication/screen/splash.screen.dart';
import 'features/main/screen/main.screen.dart';

class MainApp extends StatelessWidget {
  final authenticationRepository = AuthenticationRepository();

  @override
  Widget build(BuildContext context) {
    Future<void> _showMyDialog(BuildContext context, String error) async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Failure'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('check your connection or the server is down.'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Retry'),
                onPressed: () {
                  Navigator.of(context).pop();
                  context.read<AuthenticationBloc>().add(AppStarted());
                  // AuthenticationBloc(userRepository: userRepository)
                  //   ..add(AppStarted());
                },
              ),
            ],
          );
        },
      );
    }

    inspecting('appTitle', FlavorConfig.instance.name);
    return BlocProvider(
      create: (context) {
        return AuthenticationBloc(
          authenticationRepository: authenticationRepository,
        )..add(AppStarted());
      },
      child: LayoutBuilder(
        builder: (context, constraints) {
          return OrientationBuilder(
            builder: (context, orientation) {
              SizesUtils().init(constraints, orientation);
              App().init();
              return MaterialApp(
                title: FlavorConfig.instance.name,
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  fontFamily: FontsUtils.segoe,
                  primarySwatch: Colors.blue,
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                ),
                // home: SplashScreen(),
                home: BlocConsumer<AuthenticationBloc, AuthenticationState>(
                  listener: (context, state) {
                    if (state is AuthenticationFailure) {
                      Future.delayed(const Duration(seconds: 1), () {
                        _showMyDialog(context, state.error);
                      });
                    }
                  },
                  builder: (context, state) {
                    // showing splash screen to user..
                    if (state is AuthenticationUninitialized) {
                      return SplashScreen();
                    }
                    // if state is authonticated take user to home page
                    if (state is AuthenticationAuthenticated) {
                      return MainScreen();
                    }
                    // else take user to login page
                    if (state is AuthenticationUnauthenticated) {
                      return LoginScreen();
                    }
                    // show progress bar
                    if (state is AuthenticationLoading) {
                      return SplashScreen();
                    }
                    // show error
                    if (state is AuthenticationFailure) {
                      return SplashScreen();
                    }
                    return SplashScreen();
                  },
                ),
                onGenerateRoute: App.main.router.generator(),
                navigatorKey: App.main.router.navigatorKey,
              );
            },
          );
        },
      ),
    );
  }
}
