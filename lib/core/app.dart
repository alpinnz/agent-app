import 'package:bloc/bloc.dart';
import 'package:agent/config/bloc.observer.config.dart';
import 'package:agent/config/route.config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:sailor/sailor.dart';
import 'package:shared_preferences/shared_preferences.dart';

class App {
  static App get main => GetIt.instance.get<App>();

  SharedPreferences sharedPreferences;
  final Sailor router;
  static App _instance;

  App.configure({@required this.router}) {
    _instance = this;
  }

  factory App() {
    if (_instance == null) {
      throw UnimplementedError('App must be configured first.');
    }

    return _instance;
  }

  Future<Null> init() async {
    await SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        // DeviceOrientation.landscapeLeft,
        // DeviceOrientation.landscapeRight,
        // DeviceOrientation.portraitDown
      ],
    );

    // configure router
    RouteConfig.configureMainRoutes(router);

    // configure blog delegate
    Bloc.observer = BlocObserverConfig();

    sharedPreferences = await SharedPreferences.getInstance();
  }

  void dispose() async {}
}
