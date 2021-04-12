import 'package:agent/core/utils/colors.utils.dart';
import 'package:agent/core/utils/sizes.utils.dart';
import 'package:agent/features/authentication/bloc/authentication/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('MainScreen'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: Text('MainScreen'),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                // shadowColor: Colors.blue,
                // onPrimary: Colors.white,
                primary: ColorsUtils.primary,
                // onSurface: Colors.red,
                minimumSize: Size(88, 36),
                padding: EdgeInsets.zero,

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(40),
                  ),
                ),
              ),
              child: SizedBox(
                height: SizesUtils.textMultiplier * 7,
                width: SizesUtils.textMultiplier * 25,
                child: Center(
                  child: Text(
                    'LOGOUT',
                    style: TextStyle(
                      fontSize: SizesUtils.textMultiplier * 3,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              onPressed: () {
                BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
              },
            ),
          )
        ],
      ),
    );
  }
}
