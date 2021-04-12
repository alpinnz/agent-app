import 'package:agent/core/constant/Consts.dart';
import 'package:agent/core/utils/sizes.utils.dart';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "${Constanta.IMAGE_ASSET}/full-bg.png",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Center(
          child: Image.asset(
            "${Constanta.IMAGE_ASSET}/Agent-on-the-go.png",
            height: SizesUtils.imageSizeMultiplier * 10,
            width: SizesUtils.imageSizeMultiplier * 100,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}
