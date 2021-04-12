import 'package:agent/core/utils/sizes.utils.dart';
import 'package:flutter/material.dart';

class DropdownBasic extends StatefulWidget {
  final String title;
  final String value;
   final String error;
  final List listData;
  final void Function(String value) callback;
  DropdownBasic({this.title, this.value, this.listData, this.callback, this.error});

  @override
  _DropdownBasicState createState() => _DropdownBasicState();
}

class _DropdownBasicState extends State<DropdownBasic> {
  String _value;

  @override
  void initState() {
    super.initState();
    _value = widget.listData.contains(widget.value) && widget.value != null
        ? widget.value
        : null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '${widget.title}',
              style: TextStyle(
                color: Colors.grey[600],
                fontWeight: FontWeight.w600,
                fontSize: SizesUtils.textMultiplier * 2,
              ),
            ),
          ),
          DropdownButtonHideUnderline(
            child: DropdownButton(
              isExpanded: true,
              value: _value,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: SizesUtils.textMultiplier * 2,
              ),
              items: widget.listData.map((item) {
                return DropdownMenuItem(
                  child: Text(item),
                  value: item,
                );
              }).toList(),
              onChanged: (value) {
                setState(
                  () {
                    _value = value;
                    widget.callback(_value);
                  },
                );
              },
            ),
          ),
          Text(widget.error)
        ],
      ),
    );
  }
}
