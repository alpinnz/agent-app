import 'package:agent/core/utils/colors.utils.dart';
import 'package:agent/core/widget/basic.appbar.dart';
import 'package:agent/core/widget/basic.drawer.dart';
import 'package:agent/features/user/widget/profile/content.widget.dart';
import 'package:agent/features/user/widget/profile/overview.widget.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: ColorsUtils.white,
      drawer: BasicDrawer(),
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, kToolbarHeight),
        child: BasicAppbar(
          title: 'Profile Agent',
          appbarType: AppbarType.BACK_BUTTON,
        ),
      ),
      body: ProfileContent(),
    );
  }
}

class ProfileContent extends StatelessWidget {
  const ProfileContent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            OverviewWidget(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: ContentWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
