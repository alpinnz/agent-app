import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void toastInfo(String label) {
  Fluttertoast.showToast(
    msg: '$label',
    gravity: ToastGravity.CENTER,
    toastLength: Toast.LENGTH_SHORT,
    timeInSecForIosWeb: 1,
    fontSize: 16.0,
    textColor: Colors.white,
  );
}
