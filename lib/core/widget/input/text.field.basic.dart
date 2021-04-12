import 'package:agent/core/utils/sizes.utils.dart';
import 'package:flutter/material.dart';

enum TextFielcBasicType { TEXT, NUMBER, DATE, RUPIAH }

class TextFieldBasic extends StatefulWidget {
  final String title, error, hint, label, prefix;
  final TextEditingController controller;
  final TextFielcBasicType type;
  final void Function(TextEditingController controller) callback;

  TextFieldBasic({
    this.title,
    this.error,
    this.hint,
    this.controller,
    this.type,
    this.callback,
    this.label,
    this.prefix,
  });
  @override
  _TextFieldBasicState createState() => _TextFieldBasicState();
}

class _TextFieldBasicState extends State<TextFieldBasic> {
  TextEditingController controller;
  TextInputType keyboardType = TextInputType.text;
  DateTime _date = DateTime.now();
  bool readonly = false;
  Function onTap = () {};
  IconButton suffixIcon;
  @override
  void initState() {
    super.initState();
    suffixIcon = null;
    controller = TextEditingController();
    controller = widget.controller;

    if (widget.type == TextFielcBasicType.NUMBER) {
      keyboardType = TextInputType.number;
    }
    if (widget.type == TextFielcBasicType.DATE) {
      _date = DateTime.now();
      readonly = true;
      onTap = () => _dialogDate(context);
      keyboardType = TextInputType.datetime;
      if (controller.text == null || controller.text == '') {
        controller.text = "${_date.toLocal()}".split(' ')[0];
      }
      suffixIcon = IconButton(
        onPressed: () => _dialogDate(context),
        icon: Icon(Icons.calendar_today_rounded),
      );
    } else {}
    controller.addListener(() {
      widget.callback(controller);
    });
  }

  _dialogDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _date, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != _date)
      setState(() {
        _date = picked;
        controller.text = "${_date.toLocal()}".split(' ')[0];
      });
  }

  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          widget.title != null
              ? Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '${widget.title}',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w600,
                      fontSize: SizesUtils.textMultiplier * 2,
                    ),
                  ),
                )
              : Container(),
          TextField(
            controller: controller,
            keyboardType: keyboardType,
            autofocus: false,
            readOnly: readonly,
            onTap: onTap,
            style: TextStyle(
              color: Colors.grey[600],
              fontWeight: FontWeight.w600,
              fontSize: SizesUtils.textMultiplier * 2,
            ),
            decoration: InputDecoration(
              prefix: Text(
                'test',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w600,
                  fontSize: SizesUtils.textMultiplier * 2,
                ),
              ),
              // prefixText: widget.prefix != null ? '${widget.hint}' : null,
              // prefixStyle: TextStyle(
              //   color: Colors.grey[700],
              //   fontWeight: FontWeight.w600,
              //   fontSize: SizesUtils.textMultiplier * 2.5,
              // ),
              hintText: widget.hint != null ? '${widget.hint}' : null,
              errorText: widget.error != null ? '${widget.error}' : '',
              labelText: widget.label != null ? '${widget.label}' : null,
              suffixIcon: suffixIcon,
              labelStyle: TextStyle(color: Colors.grey[700]),
              errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 0.0),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 0.0),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 0.0),
              ),
              focusedErrorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 0.0),
              ),
              isDense: true,
              // contentPadding: EdgeInsets.only(10),
            ),
          ),
        ],
      ),
    );
  }
}
