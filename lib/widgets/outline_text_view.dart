import 'package:flutter/material.dart';
import 'package:tasmkt/configuration.dart';

class OutlineTextView extends StatelessWidget {
  final String hintText;
  final Color borderColor;
  final bool readOnly;
  final Function() onTap;
  final TextEditingController controller;
  const OutlineTextView(
      {Key key,
      @required this.hintText,
      this.controller,
      this.readOnly = false,
      this.borderColor = colorPrimaryDark,
      this.onTap = _dummyOnTap})
      : assert(onTap != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      controller: controller,
      decoration: new InputDecoration(
          contentPadding: EdgeInsets.all(8.0),
          labelText: hintText,
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(color: borderColor)),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
      onTap: onTap,
    );
  }

  static dynamic _dummyOnTap() {}
}
