import 'package:agent/core/utils/sizes.utils.dart';
import 'package:flutter/material.dart';

enum Jaminan { komprehensif, tlo }

// ignore: must_be_immutable
class RadioBasic extends StatelessWidget {
  RadioBasic({Key key}) : super(key: key);
  Jaminan _jaminan;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              'Jaminan Dasar',
              style: TextStyle(
                color: Colors.grey[600],
                fontWeight: FontWeight.w600,
                fontSize: SizesUtils.textMultiplier * 2,
              ),
            ),
          ),
          Row(
            children: [
              Row(
                children: [
                  Radio<Jaminan>(
                    value: Jaminan.komprehensif,
                    groupValue: _jaminan,
                    onChanged: (Jaminan value) {
                      // setState(() {
                      //   _jaminan = value;
                      // });
                    },
                  ),
                  Text(
                    'Komprehensif',
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                      fontSize: SizesUtils.textMultiplier * 2,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Radio<Jaminan>(
                    value: Jaminan.tlo,
                    groupValue: _jaminan,
                    onChanged: (Jaminan value) {
                      // setState(() {
                      //   _jaminan = value;
                      // });
                    },
                  ),
                  Text(
                    'TLO',
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                      fontSize: SizesUtils.textMultiplier * 2,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
