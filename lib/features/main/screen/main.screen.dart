import 'package:agent/core/helper/toast.helper.dart';
import 'package:agent/core/utils/colors.utils.dart';
import 'package:agent/core/utils/sizes.utils.dart';
import 'package:agent/core/widget/basic.drawer.dart';
import 'package:agent/features/authentication/repository/user.repository.dart';
import 'package:agent/features/main/bloc/main/main.bloc.dart';
import 'package:agent/features/main/widget/main/overview.widget.dart';
import 'package:agent/features/main/widget/main/polis.card.widget.dart';
import 'package:agent/features/main/widget/main/quotation.card.widget.dart';
import 'package:agent/features/main/widget/main/renewal.card.widget.dart';
import 'package:flutter/material.dart';
import 'package:agent/core/widget/basic.appbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final userRepository = UserRepository();

  @override
  Widget build(BuildContext context) {
    DateTime backbuttonpressedTime;

    Future<bool> onWillPop() async {
      DateTime currentTime = DateTime.now();

      if (_scaffoldKey.currentState.isDrawerOpen) {
        Navigator.of(context).pop();
        return false;
      }

      bool backButton = backbuttonpressedTime == null ||
          currentTime.difference(backbuttonpressedTime) > Duration(seconds: 3);

      if (backButton) {
        backbuttonpressedTime = currentTime;
        toastInfo("Double Click to exit app");
        return false;
      }
      return true;
    }

    return WillPopScope(
      onWillPop: onWillPop,
      child: BlocProvider(
        create: (context) {
          return MainBloc(
            userRepository: userRepository,
          )..add(MainLoadEvent());
        },
        child: Scaffold(
          key: _scaffoldKey,
          backgroundColor: ColorsUtils.bg,
          drawer: BasicDrawer(),
          appBar: PreferredSize(
            preferredSize: const Size(double.infinity, kToolbarHeight),
            child: BasicAppbar(
              appbarType: AppbarType.MENU,
              actionsType: [ActionType.SEARCH],
            ),
          ),
          body: HomeContent(),
        ),
      ),
    );
  }
}

class HomeContent extends StatefulWidget {
  HomeContent({Key key}) : super(key: key);
  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  @override
  Widget build(BuildContext context) {
    Future<void> _showMyDialog(BuildContext context, String error) async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Failure'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('check your connection or the server is down.'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Retry'),
                onPressed: () {
                  Navigator.of(context).pop();
                  context.read<MainBloc>()..add(MainLoadEvent());
                },
              ),
            ],
          );
        },
      );
    }

    return BlocConsumer<MainBloc, MainState>(
      listener: (context, state) {
        if (state is MainFailure) {
          // toastInfo('${state.error}');
          _showMyDialog(context, '${state.error}');
        }
      },
      builder: (context, state) {
        if (state is MainLoaded) {
          return SingleChildScrollView(
            child: Column(
              children: [
                OverviewWidget(userModel: state.userModel),
                RenewalCardWidget(),
                QuotationCardWidget(),
                PolisCardWidget(),
              ],
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
