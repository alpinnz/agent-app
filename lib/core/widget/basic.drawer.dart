import 'package:agent/core/constant/Consts.dart';
import 'package:agent/core/utils/colors.utils.dart';
import 'package:agent/core/utils/sizes.utils.dart';
import 'package:agent/features/authentication/bloc/authentication/authentication_bloc.dart';
import 'package:agent/features/user/route/user.route.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BasicDrawer extends StatelessWidget {
  const BasicDrawer({Key key}) : super(key: key);

  Widget itemMenu(
    String _title,
    String _imageName,
    Function _onPressEven,
    BuildContext _context,
  ) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: SizesUtils.heightMultiplier * 0.25,
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(_context).pop();
          _onPressEven();
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: SizesUtils.heightMultiplier * 0.5,
          ),
          child: Row(
            children: [
              Image.asset(
                '${Constanta.IMAGE_ASSET}/$_imageName',
                width: SizesUtils.imageSizeMultiplier * 7,
                height: SizesUtils.imageSizeMultiplier * 7,
              ),
              SizedBox(width: 10),
              Text(
                '$_title',
                style: TextStyle(
                  fontSize: SizesUtils.textMultiplier * 2.50,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: SizesUtils.widthMultiplier * 8,
          vertical: SizesUtils.heightMultiplier * 4,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("${Constanta.IMAGE_ASSET}/full-bg.png"),
            //  NetworkImage(
            //       //   "https://i.imgur.com/BoN9kdC.png",
            //       // ),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: CircleAvatar(
                  backgroundImage: AssetImage(
                    "${Constanta.IMAGE_ASSET}/avatar.png",
                  ),
                  radius: SizesUtils.imageSizeMultiplier * 15,
                  // maxRadius: SizesUtils.imageSizeMultiplier * 30,
                  backgroundColor: Colors.orange[700],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: SizesUtils.heightMultiplier * 0.5,
                ),
                child: Text(
                  'Daeng Gemilang Enterprise',
                  style: TextStyle(
                    fontSize: SizesUtils.textMultiplier * 3,
                    fontWeight: FontWeight.bold,
                    color: ColorsUtils.white,
                  ),
                ),
              ),
              // Divider(),
              itemMenu('Manage Profile', '01.png', () {
                RouteConfigUser.navigateToProfile(context);
              }, context),
              Divider(),
              ExpandableNotifierCustom(
                title: 'Agent Reports',
                imageName: '05.png',
                widget: ListView(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  children: [
                    itemMenu('Agent Reports 1', '02.png', () {}, context),
                    itemMenu('Agent Reports 2', '02.png', () {}, context),
                    itemMenu('Agent Reports 3', '02.png', () {}, context),
                    itemMenu('Agent Reports 4', '02.png', () {}, context),
                  ],
                ),
              ),
              Divider(),
              itemMenu('App Feedback', '03.png', () {}, context),
              Divider(),
              itemMenu('Survey Feedback', '04.png', () {}, context),
              Divider(),
              ExpandableNotifierCustom(
                title: 'Motor Quick Quide',
                imageName: '05.png',
                widget: ListView(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  children: [
                    itemMenu('Motor Quick Quide 1', '05.png', () {}, context),
                    itemMenu('Motor Quick Quide 2', '05.png', () {}, context),
                    itemMenu('Motor Quick Quide 3', '05.png', () {}, context),
                    itemMenu('Motor Quick Quide 4', '05.png', () {}, context),
                    itemMenu('Motor Quick Quide 5', '05.png', () {}, context),
                  ],
                ),
              ),
              Divider(),
              itemMenu('Logout', '06.png', () {
                BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
              }, context),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}

class ExpandableNotifierCustom extends StatelessWidget {
  final Widget widget;
  final String title, imageName;

  ExpandableNotifierCustom({this.widget, this.title, this.imageName});

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      child: ScrollOnExpand(
        scrollOnExpand: true,
        scrollOnCollapse: false,
        child: ExpandablePanel(
          theme: ExpandableThemeData(
            headerAlignment: ExpandablePanelHeaderAlignment.center,
            tapBodyToCollapse: false,
          ),
          header: Row(
            children: [
              Image.asset(
                '${Constanta.IMAGE_ASSET}/$imageName',
                width: SizesUtils.imageSizeMultiplier * 7,
                height: SizesUtils.imageSizeMultiplier * 7,
              ),
              SizedBox(width: 10),
              Text(
                '$title',
                style: TextStyle(
                  fontSize: SizesUtils.textMultiplier * 2.50,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          collapsed: null,
          expanded: widget,
          builder: (_, collapsed, expanded) {
            return Expandable(
              collapsed: collapsed,
              expanded: expanded,
              theme: ExpandableThemeData(
                iconColor: Colors.black,
                animationDuration: Duration(milliseconds: 500),
                useInkWell: true,
                expandIcon: Icons.keyboard_arrow_down_outlined,
                collapseIcon: Icons.keyboard_arrow_up_outlined,
                crossFadePoint: 0,
              ),
            );
          },
        ),
      ),
    );
  }
}
