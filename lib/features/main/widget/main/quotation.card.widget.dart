import 'package:agent/core/utils/colors.utils.dart';
import 'package:agent/core/utils/sizes.utils.dart';
import 'package:agent/features/main/widget/main/item.card.widget.dart';
import 'package:agent/features/main/widget/main/title.card.widget.dart';
import 'package:flutter/material.dart';

class QuotationCardWidget extends StatelessWidget {
  const QuotationCardWidget({Key key}) : super(key: key);

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
              'Quotation',
              style: TextStyle(
                fontSize: SizesUtils.textMultiplier * 2.25,
                fontWeight: FontWeight.bold,
                color: ColorsUtils.primary,
              ),
            ),
          ),
          TitleCardWidget(
            title: 'Quotation',
            leading: true,
            trailing: true,
            borderTop: true,
            bgColor: ColorsUtils.primary,
            onPressLeading: () {
              print('onPressLeading');
            },
            onPressTrailing: () {
              print('onPressTrailing');
            },
          ),
          ItemCardWidget(
            title: 'Diterbitkan (dalam 2 bulan)',
            value: '0',
            onPressEvent: () {},
          ),
          Divider(
            height: 0.1,
            color: Colors.grey[600],
          ),
          ItemCardWidget(
            title: 'Disetujui (pembayaran tertunda)',
            value: '0',
            onPressEvent: () {},
          ),
          Divider(
            height: 0.1,
            color: Colors.grey[600],
          ),
          ItemCardWidget(
            title: 'Dibatalkan)',
            value: '0',
            borderButtom: true,
            onPressEvent: () {},
          )
        ],
      ),
    );
  }
}
