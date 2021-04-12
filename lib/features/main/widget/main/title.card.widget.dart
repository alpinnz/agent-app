import 'package:agent/core/utils/colors.utils.dart';
import 'package:agent/core/utils/sizes.utils.dart';
import 'package:agent/core/widget/basic.button.dart';
import 'package:flutter/material.dart';

class TitleCardWidget extends StatelessWidget {
  final String title;
  final Color bgColor, titleColor;
  final Function onPressLeading, onPressTrailing;
  final bool leading, trailing;
  final bool borderTop;

  const TitleCardWidget({
    Key key,
    this.title,
    this.bgColor,
    this.titleColor,
    this.onPressLeading,
    this.onPressTrailing,
    this.leading,
    this.trailing,
    this.borderTop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizesUtils.heightMultiplier * 5,
      width: SizesUtils.widthMultiplier * 80,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(
        left: SizesUtils.widthMultiplier * 2.5,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(borderTop != null ? 12.0 : 0),
          topRight: Radius.circular(borderTop != null ? 12.0 : 0),
        ),
        color: bgColor ?? Colors.grey[800],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          leading != null
              ? BasicButton(
                  buttonType: ButtonType.ICON,
                  icon: Icon(
                    Icons.add,
                    color: Colors.black,
                    size: SizesUtils.imageSizeMultiplier * 5,
                  ),
                  onClickEvent: () => onPressLeading(),
                )
              : Container(),
          Expanded(
            child: Text(
              '$title',
              style: TextStyle(
                fontSize: SizesUtils.textMultiplier * 2,
                fontWeight: FontWeight.w600,
                color: titleColor ?? ColorsUtils.white,
              ),
            ),
          ),
          trailing != null
              ? Padding(
                  padding: EdgeInsets.only(
                    right: SizesUtils.widthMultiplier * 2.5,
                  ),
                  child: BasicButton(
                    buttonType: ButtonType.IMAGE,
                    imageName: 'arrow-hitam.png',
                    onClickEvent: () => onPressTrailing(),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
