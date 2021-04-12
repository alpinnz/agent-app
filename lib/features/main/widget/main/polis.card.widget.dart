import 'package:agent/core/utils/sizes.utils.dart';
import 'package:agent/features/main/widget/main/item.card.widget.dart';
import 'package:agent/features/main/widget/main/title.card.widget.dart';
import 'package:flutter/material.dart';

class PolisCardWidget extends StatelessWidget {
  const PolisCardWidget({Key key}) : super(key: key);

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
              'Polis Untuk Ditindaklanjuti',
              style: TextStyle(
                fontSize: SizesUtils.textMultiplier * 2.25,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
          ),
          TitleCardWidget(
            borderTop: true,
            title: 'Polis',
          ),
          ItemCardWidget(
            title: 'Pembayaran tertunggak',
            value: '0',
            onPressEvent: () {},
          ),
          TitleCardWidget(
            // borderTop: true,
            title: 'Hangus',
          ),
          ItemCardWidget(
            title: 'Dalam 2 bulan',
            value: '0',
            borderButtom: true,
            onPressEvent: () {},
          ),
        ],
      ),
    );
  }
}
