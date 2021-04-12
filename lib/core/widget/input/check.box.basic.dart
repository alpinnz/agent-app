import 'package:agent/core/utils/sizes.utils.dart';
import 'package:flutter/material.dart';

class CheckBoxBasic extends StatefulWidget {
  final String title;
  final bool value;
  final void Function(bool value) callback;
  const CheckBoxBasic({Key key, this.title, this.callback, this.value})
      : super(key: key);
  @override
  _CheckBoxBasicState createState() => _CheckBoxBasicState();
}

class _CheckBoxBasicState extends State<CheckBoxBasic> {
  @override
  Widget build(BuildContext context) {
    return ListTileTheme(
      contentPadding: EdgeInsets.zero,
      child: CheckboxListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(
          '${widget.title}',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w600,
            fontSize: SizesUtils.textMultiplier * 2,
          ),
        ),
        // secondary: Icon(Icons.beach_access),
        controlAffinity: ListTileControlAffinity.leading,
        value: widget.value,
        onChanged: (bool _value) {
          widget.callback(_value);
        },
        activeColor: Colors.green,
        checkColor: Colors.black,
      ),
    );
  }
}
