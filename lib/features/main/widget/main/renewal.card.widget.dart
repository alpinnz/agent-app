import 'package:agent/core/constant/Consts.dart';
import 'package:agent/core/utils/colors.utils.dart';
import 'package:agent/core/utils/sizes.utils.dart';
import 'package:agent/core/widget/basic.button.dart';
import 'package:agent/features/main/widget/main/title.card.widget.dart';
import 'package:flutter/material.dart';

class RenewalCardWidget extends StatelessWidget {
  const RenewalCardWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: SizesUtils.heightMultiplier * 2,
        // horizontal: SizesUtils.widthMultiplier * 80,
      ),
      width: SizesUtils.widthMultiplier * 80,
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(
              vertical: SizesUtils.heightMultiplier * 0.25,
            ),
            child: Text(
              'Renewal',
              style: TextStyle(
                fontSize: SizesUtils.textMultiplier * 2.25,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
          ),
          TitleCardWidget(
            borderTop: true,
            title: 'Polis Jatuh Tempo ( dalam 2 bulan)',
          ),
          Container(
            height: SizesUtils.heightMultiplier * 15,
            width: SizesUtils.widthMultiplier * 80,
            padding: EdgeInsets.symmetric(
              horizontal: SizesUtils.widthMultiplier * 2.5,
              vertical: SizesUtils.heightMultiplier * 1,
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "${Constanta.IMAGE_ASSET}/bg-polis-jatuh-tempo.png",
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.0),
                topRight: Radius.circular(12.0),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    '0',
                    style: TextStyle(
                      fontSize: SizesUtils.textMultiplier * 5,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '0',
                        style: TextStyle(
                          fontSize: SizesUtils.textMultiplier * 2,
                          fontWeight: FontWeight.w600,
                          color: ColorsUtils.primary,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: SizesUtils.widthMultiplier * 1,
                          // vertical: SizesUtils.heightMultiplier * 1,
                        ),
                        child: Text(
                          'pola jatuh tempo',
                          style: TextStyle(
                            fontSize: SizesUtils.textMultiplier * 2,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      BasicButton(
                        buttonType: ButtonType.IMAGE,
                        imageName: 'arrow.png',
                        onClickEvent: () {
                          print('>');
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
