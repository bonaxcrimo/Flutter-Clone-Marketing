import 'package:flutter/material.dart';
import 'package:tasmkt/configuration.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Text(title), backgroundColor: colorPrimaryDark, elevation: 1.0);
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
