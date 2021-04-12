import 'package:flutter/material.dart';

import 'flavor.banner.dart';

class BasicScaffold extends StatelessWidget {
  final Widget body, floatingActionButton, appBar;
  final Color backgroundColor;
  final BottomNavigationBar bottomNavigationBar;
  final FloatingActionButtonLocation floatingActionButtonLocation;
  BasicScaffold({
    Key key,
    this.body,
    this.floatingActionButton,
    this.appBar,
    this.backgroundColor,
    this.bottomNavigationBar,
    this.floatingActionButtonLocation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlavorBanner(
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: appBar,
        body: body,
        bottomNavigationBar: bottomNavigationBar,
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: floatingActionButtonLocation,
      ),
    );
  }
}
