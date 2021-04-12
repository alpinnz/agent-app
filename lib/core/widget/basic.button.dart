import 'package:agent/core/constant/Consts.dart';
import 'package:agent/core/utils/colors.utils.dart';
import 'package:agent/core/utils/sizes.utils.dart';
import 'package:flutter/material.dart';

enum ButtonType { TEXT, ICON, IMAGE }

class BasicButton extends StatelessWidget {
  final ButtonType buttonType;
  final String title;
  final Function onClickEvent;
  final Image image;
  final String imageName;
  final Icon icon;
  final Color color;
  final double size, height, width;
  BasicButton({
    Key key,
    this.buttonType,
    this.title,
    this.onClickEvent,
    this.image,
    this.size,
    this.height,
    this.width,
    this.imageName,
    this.icon,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: typeWidget(buttonType),
    );
  }

  Widget typeWidget(ButtonType _buttonType) {
    switch (_buttonType) {
      case ButtonType.TEXT:
        return GestureDetector(
            onTap: () => onClickEvent(),
            child: Text(
              '$title',
              style: TextStyle(
                fontSize: SizesUtils.textMultiplier * 2.25,
                fontWeight: FontWeight.bold,
                color: color ?? ColorsUtils.white,
              ),
            ));

      case ButtonType.ICON:
        return IconButton(
          padding: EdgeInsets.zero,
          constraints: BoxConstraints(),
          icon: icon ??
              Icon(
                Icons.chevron_left,
                color: ColorsUtils.white,
                size: SizesUtils.imageSizeMultiplier * 6.25,
              ),
          onPressed: () => onClickEvent(),
        );

      case ButtonType.IMAGE:
        return GestureDetector(
          onTap: () => onClickEvent(),
          child: Image.asset(
            "${Constanta.IMAGE_ASSET}/$imageName",
            height: height ?? SizesUtils.imageSizeMultiplier * 6.25,
            width: width ?? SizesUtils.imageSizeMultiplier * 6.25,
            fit: BoxFit.contain,
          ),
        );

      default:
        return null;
    }
  }
}
