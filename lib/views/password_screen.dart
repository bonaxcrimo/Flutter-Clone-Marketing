import 'package:flutter/material.dart';
import 'package:tasmkt/widgets/drawer_navigation.dart';
import 'package:tasmkt/widgets/custom_appbar.dart';

class PasswordScreen extends StatefulWidget {
  PasswordScreen({Key key}) : super(key: key);

  @override
  _PasswordScreenState createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Ganti Password"),
      drawer: DrawerNavigation(),
      body: Container(child: Text('Data')),
    );
  }
}
