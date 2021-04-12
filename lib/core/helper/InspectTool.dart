import 'package:flutter/cupertino.dart';

void inspecting(String key, dynamic value) => print("😎 > $key: $value");

void shout(String key, dynamic value) {
  inspecting(key, value);
}

void inspectPage({@required String className}) {
  inspecting("Page Classname", className);
}