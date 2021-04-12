import 'package:agent/core/constant/Consts.dart';
import 'package:agent/core/utils/colors.utils.dart';
import 'package:agent/core/utils/sizes.utils.dart';
import 'package:flutter/material.dart';

enum AppbarType { BACK_BUTTON, MENU, NOTHING }
enum ActionType { SEARCH }

class BasicAppbar extends StatefulWidget {
  final AppbarType appbarType;
  final String title;
  final List<ActionType> actionsType;
  final double elevation;

  BasicAppbar({
    Key key,
    @required this.appbarType,
    this.elevation = 0.0,
    this.title,
    this.actionsType,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => BasicAppbarState();
}

class BasicAppbarState extends State<BasicAppbar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      left: false,
      right: false,
      bottom: false,
      child: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: widget.elevation,
        backgroundColor: ColorsUtils.grey,
        leading: leadingWidget(context),
        title: titleWidget(context),
        actions: listActionsWidget(context),
      ),
    );
  }

  List<Widget> listActionsWidget(BuildContext context) {
    List<Widget> _listWidget = [];
    if (widget.actionsType != null) {
      widget.actionsType.forEach((item) {
        if (item == ActionType.SEARCH) {
          Widget searchWidget = IconButton(
            icon: Icon(
              Icons.search,
              color: ColorsUtils.white,
              size: SizesUtils.imageSizeMultiplier * 7.0,
            ),
            onPressed: null,
          );
          _listWidget.add(searchWidget);
        }
      });
    } else {
      return null;
    }

    return _listWidget;
  }

  Widget titleWidget(BuildContext context) {
    if (widget.title != null) {
      return Text(
        widget.title,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: ColorsUtils.primary,
          fontWeight: FontWeight.w600,
          fontSize: SizesUtils.textMultiplier * 3.25,
        ),
        overflow: TextOverflow.fade,
      );
    } else {
      return Image.asset(
        "${Constanta.IMAGE_ASSET}/Agent-on-the-go-primary.png",
        height: kToolbarHeight - 10,
        width: SizesUtils.imageSizeMultiplier * 40,
        fit: BoxFit.contain,
      );
    }
  }

  Widget leadingWidget(BuildContext context) {
    switch (widget.appbarType) {
      case AppbarType.BACK_BUTTON:
        return IconButton(
          icon: Icon(
            Icons.chevron_left,
            color: ColorsUtils.white,
            size: SizesUtils.imageSizeMultiplier * 7.0,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        );

      case AppbarType.MENU:
        return IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: Image.asset(
            "${Constanta.IMAGE_ASSET}/menu.png",
            height: SizesUtils.imageSizeMultiplier * 7.0,
            width: SizesUtils.imageSizeMultiplier * 7.0,
            fit: BoxFit.contain,
          ),
        );
      case AppbarType.NOTHING:
        return null;

      default:
        return null;
    }
  }
}
