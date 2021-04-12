import 'package:agent/core/constant/Consts.dart';
import 'package:agent/core/utils/colors.utils.dart';
import 'package:agent/core/utils/sizes.utils.dart';
import 'package:agent/features/authentication/model/user.model.dart';
import 'package:agent/features/main/routes/main.route.dart';
import 'package:flutter/material.dart';

class OverviewWidget extends StatelessWidget {
  final UserModel userModel;
  OverviewWidget({Key key, this.userModel}) : super(key: key);

  Widget iconButtonMenu(String imageAsset, Function onPress) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: SizesUtils.widthMultiplier * 1,
      ),
      child: IconButton(
        iconSize: SizesUtils.imageSizeMultiplier * 15.0,
        icon: Image.asset(
          '${Constanta.IMAGE_ASSET}/$imageAsset',
          fit: BoxFit.contain,
        ),
        onPressed: () {
          onPress();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizesUtils.heightMultiplier * 40,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("${Constanta.IMAGE_ASSET}/bar-atas.png"),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12.0),
          bottomRight: Radius.circular(12.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.50),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizesUtils.widthMultiplier * 10,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '${userModel.agent.name}',
                    style: TextStyle(
                      fontSize: SizesUtils.textMultiplier * 4,
                      fontWeight: FontWeight.bold,
                      color: ColorsUtils.grey,
                    ),
                  ),
                  Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Hi',
                            style: TextStyle(
                              fontSize: SizesUtils.textMultiplier * 4,
                              fontWeight: FontWeight.normal,
                              color: ColorsUtils.whiteDark,
                            ),
                          ),
                          TextSpan(
                            text: ' ',
                            style: TextStyle(
                              fontSize: SizesUtils.textMultiplier * 4,
                              fontWeight: FontWeight.normal,
                              color: ColorsUtils.white,
                            ),
                          ),
                          TextSpan(
                            text: '${userModel.userName}',
                            style: TextStyle(
                              fontSize: SizesUtils.textMultiplier * 4,
                              fontWeight: FontWeight.bold,
                              color: ColorsUtils.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  'Monitor Bisnis di:',
                  style: TextStyle(
                    fontSize: SizesUtils.textMultiplier * 2.5,
                    fontWeight: FontWeight.w500,
                    color: ColorsUtils.grey,
                  ),
                ),
                Container(
                  // padding: EdgeInsets.symmetric(
                  //   horizontal: SizesUtils.widthMultiplier * 1,
                  // ),
                  height: SizesUtils.heightMultiplier * 12,
                  width: double.infinity,
                  child: Row(
                    children: [
                      // IconButton(
                      //   padding: EdgeInsets.zero,
                      //   constraints: BoxConstraints(),
                      //   icon: Icon(
                      //     Icons.chevron_left,
                      //     color: ColorsUtils.grayDark,
                      //   ),
                      //   iconSize: SizesUtils.imageSizeMultiplier * 7,
                      //   onPressed: () {
                      //     print('left');
                      //   },
                      // ),
                      Expanded(
                        child: ScrollConfiguration(
                          behavior: MyBehavior(),
                          child: ListView(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            children: [
                              iconButtonMenu(
                                'icon-kecelakaan.png',
                                () {},
                              ),
                              iconButtonMenu(
                                'icon-mobile.png',
                                () {
                                  RouteConfigMain.navigateToMotor(context);
                                },
                              ),
                              iconButtonMenu(
                                'icon-property.png',
                                () {},
                              ),
                              iconButtonMenu(
                                'icon-traveling.png',
                                () {},
                              ),
                              iconButtonMenu(
                                'icon-traveling.png',
                                () {},
                              ),
                              iconButtonMenu(
                                'icon-traveling.png',
                                () {},
                              )
                            ],
                          ),

                          // ListView.builder(
                          //   shrinkWrap: true,
                          //   scrollDirection: Axis.horizontal,
                          //   itemCount: menus.length,
                          //   itemBuilder: (BuildContext ctxt, int index) {
                          //     Menu menu = menus[index];
                          //     return Container(
                          //       margin: EdgeInsets.symmetric(
                          //         horizontal: SizesUtils.widthMultiplier * 1,
                          //       ),
                          //       child: IconButton(
                          //         // onPressed: () =>
                          //         //     RouteConfigDashboard.navigateToMenu(context, menu),
                          //         iconSize: SizesUtils.imageSizeMultiplier * 15,
                          //         icon: Image.network(
                          //           menu.image,
                          //           // height: SizesUtils.imageSizeMultiplier * 15,
                          //           // width: SizesUtils.imageSizeMultiplier * 15,
                          //           fit: BoxFit.contain,
                          //         ),
                          //       ),
                          //     );
                          //   },
                          // ),
                        ),
                      ),
                      // IconButton(
                      //   padding: EdgeInsets.zero,
                      //   constraints: BoxConstraints(),
                      //   icon: Icon(
                      //     Icons.chevron_right,
                      //     color: ColorsUtils.grayDark,
                      //   ),
                      //   iconSize: SizesUtils.imageSizeMultiplier * 7,
                      //   onPressed: () {
                      //     print('right');
                      //   },
                      // ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
