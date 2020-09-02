import 'package:flutter/material.dart';
import 'package:tasmkt/configuration.dart';
import 'package:tasmkt/utils/simple_route.dart';
//views
import 'package:tasmkt/views/home_screen.dart';
import 'package:tasmkt/views/password_screen.dart';

class DrawerNavigation extends StatefulWidget {
  @override
  _DrawerNavigationState createState() => _DrawerNavigationState();
}

class _DrawerNavigationState extends State<DrawerNavigation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage:
                    NetworkImage('https://via.placeholder.com/150'),
              ),
              accountName: Text('medanincode'),
              accountEmail: Text('medanincode@gmail.com'),
              decoration: BoxDecoration(color: colorPrimaryDark),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                simpleRoute(context, "Home");
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.vpn_key),
              title: Text('Ganti Password'),
              onTap: () {
                simpleRoute(context, "Password");
              },
            )
          ],
        ),
      ),
    );
  }
}
