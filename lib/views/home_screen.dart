import 'package:tasmkt/models/GridMenu.dart';
import 'package:tasmkt/widgets/custom_appbar.dart';
import 'package:tasmkt/widgets/drawer_navigation.dart';
import 'package:flutter/material.dart';
import 'package:tasmkt/widgets/grid_view.dart';

class HomeScreen extends StatefulWidget {
  List<GridMenu> gridmenu = [
    GridMenu("Data Prospek", "assets/handshake.png"),
    GridMenu("Kunjungan", "assets/handshake.png"),
    GridMenu("Kunjungan New", "assets/handshake.png"),
    GridMenu("Kunjungan Rekap", "assets/handshake.png"),
  ];

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: 'Dashboard'),
        drawer: DrawerNavigation(),
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/bgapps.png"), fit: BoxFit.fill),
            ),
            child: Container(
                margin: EdgeInsets.only(top: 50.0),
                child: Column(
                  children: <Widget>[
                    Text("Good Morning",
                        style: TextStyle(fontSize: 20.0, color: Colors.white)),
                    SizedBox(
                      height: 20,
                    ),
                    MyGridView(gridMenu: widget.gridmenu)
                  ],
                ))));
  }
}
