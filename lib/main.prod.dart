import 'package:flutter/material.dart';

import 'config/flavor.config.dart';
import 'main.app.dart';

Future<Null> main() async {
  FlavorConfig(
    flavor: Flavor.PRODUCTION,
    values: FlavorValues(
      baseUrl: "",
    ),
  );

  runApp(MainApp());
}
