import 'package:agent/core/utils/colors.utils.dart';
import 'package:agent/core/utils/sizes.utils.dart';
import 'package:flutter/material.dart';

class FailedHostView extends StatelessWidget {
  final String message;
  const FailedHostView({Key key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      color: Colors.transparent,
      width: double.maxFinite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(
            message == null || message == ''
                ? "Error, periksa koneksi Anda"
                : message,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: SizesUtils.textMultiplier * 3,
              fontWeight: FontWeight.w400,
              color: ColorsUtils.whiteDark,
              decoration: TextDecoration.none,
            ),
          )
        ],
      ),
    );
  }
}
