import 'package:flutter/material.dart';
import 'package:tasmkt/widgets/custom_appbar.dart';
import 'package:tasmkt/widgets/drawer_navigation.dart';

class KunjunganRekapScreen extends StatefulWidget {
  KunjunganRekapScreen({Key key}) : super(key: key);

  @override
  _KunjunganRekapScreenState createState() => _KunjunganRekapScreenState();
}

class _KunjunganRekapScreenState extends State<KunjunganRekapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Kunjungan"),
      drawer: DrawerNavigation(),
      body: Container(child: Text('Kunjungan Rekap')),
    );
  }
}
