import 'package:agent/core/utils/sizes.utils.dart';
import 'package:agent/core/widget/basic.button.dart';
import 'package:flutter/material.dart';

class ItemCardWidget extends StatelessWidget {
  final bool borderButtom;
  final String title, value;
  final Function onPressEvent;
  ItemCardWidget(
      {Key key, this.borderButtom, this.onPressEvent, this.title, this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizesUtils.heightMultiplier * 11,
      width: SizesUtils.widthMultiplier * 80,
      padding: EdgeInsets.symmetric(
        horizontal: SizesUtils.widthMultiplier * 2.5,
        vertical: SizesUtils.heightMultiplier * 1,
      ),
      decoration: BoxDecoration(
        color: Colors.blue[100],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(borderButtom != null ? 12.0 : 0),
          bottomRight: Radius.circular(borderButtom != null ? 12.0 : 0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              '$title',
              style: TextStyle(
                fontSize: SizesUtils.textMultiplier * 1.25,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '$value',
                  style: TextStyle(
                    fontSize: SizesUtils.textMultiplier * 5,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                BasicButton(
                  buttonType: ButtonType.IMAGE,
                  imageName: 'arrow.png',
                  onClickEvent: () => onPressEvent(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
