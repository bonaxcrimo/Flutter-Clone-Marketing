import 'package:flutter/material.dart';
import 'package:tasmkt/widgets/custom_appbar.dart';
import 'package:tasmkt/widgets/drawer_navigation.dart';

class KunjunganScreen extends StatefulWidget {
  KunjunganScreen({Key key}) : super(key: key);

  @override
  _KunjunganScreenScreenState createState() => _KunjunganScreenScreenState();
}

class _KunjunganScreenScreenState extends State<KunjunganScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Kunjungan"),
      drawer: DrawerNavigation(),
      body: Container(child: Text('Kunjungan')),
    );
  }
}
