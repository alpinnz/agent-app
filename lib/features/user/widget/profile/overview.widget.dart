import 'package:agent/core/constant/Consts.dart';
import 'package:agent/core/utils/colors.utils.dart';
import 'package:agent/core/utils/sizes.utils.dart';
import 'package:flutter/material.dart';

class OverviewWidget extends StatelessWidget {
  const OverviewWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizesUtils.heightMultiplier * 40,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: SizesUtils.widthMultiplier * 25,
      ),
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: SizesUtils.imageSizeMultiplier * 30,
            height: SizesUtils.imageSizeMultiplier * 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                  "https://i.imgur.com/BoN9kdC.png",
                ),
              ),
              border: Border.all(
                color: Colors.orange[600],
                width: 3.0,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "${Constanta.IMAGE_ASSET}/aktif.png",
                height: SizesUtils.heightMultiplier * 3,
                width: SizesUtils.imageSizeMultiplier * 40,
                fit: BoxFit.contain,
              ),
              Text(
                'V0022922',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: SizesUtils.textMultiplier * 2.5,
                  fontWeight: FontWeight.normal,
                  color: ColorsUtils.grey,
                ),
              ),
              Text(
                'Daeng Gemilang Enterprice',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: SizesUtils.textMultiplier * 2.5,
                  fontWeight: FontWeight.bold,
                  color: ColorsUtils.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
