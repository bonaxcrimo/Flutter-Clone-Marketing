import 'package:flutter/material.dart';
import 'package:tasmkt/widgets/custom_appbar.dart';
import 'package:tasmkt/widgets/drawer_navigation.dart';

class KunjunganNewScreen extends StatefulWidget {
  KunjunganNewScreen({Key key}) : super(key: key);

  @override
  _KunjunganNewScreenState createState() => _KunjunganNewScreenState();
}

class _KunjunganNewScreenState extends State<KunjunganNewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Kunjugan New"),
      drawer: DrawerNavigation(),
      body: Container(child: Text('Data Kunjungan New')),
    );
  }
}
