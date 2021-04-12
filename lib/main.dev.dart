import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:sailor/sailor.dart';
import 'config/flavor.config.dart';
import 'core/app.dart';
import 'main.app.dart';

Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GetIt.instance.registerSingleton<App>(App.configure(router: Sailor()));

  await GetIt.instance.get<App>().init();
  FlavorConfig(
    flavor: Flavor.DEV,
    color: Colors.green,
    values: FlavorValues(
      baseUrl: "https://uatechannel.etiqa.co.id/aotg",
    ),
  );

  runApp(MainApp());
}
