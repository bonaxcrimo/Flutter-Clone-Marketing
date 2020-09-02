import 'package:flutter/material.dart';
import 'package:tasmkt/models/GridMenu.dart';
import 'package:tasmkt/utils/simple_route.dart';

class MyGridView extends StatelessWidget {
  const MyGridView({Key key, this.gridMenu}) : super(key: key);

  final List<GridMenu> gridMenu;

  @override
  Widget build(BuildContext context) {
    return gridMenu == null
        ? Text("Empty")
        : GridView(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            children: gridMenu.map((grid) {
              return GestureDetector(
                child: Card(
                  elevation: 2.5,
                  margin: EdgeInsets.all(20.0),
                  child: getCardByTitle(grid.name, grid.imgUrl),
                ),
                onTap: () {
                  simpleRoute(context, grid.name);
                },
              );
            }).toList());
  }

  Column getCardByTitle(String title, String imgUrl) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Center(
          child: Container(
              child: new Stack(children: <Widget>[
            new Image.asset(imgUrl, width: 80.0, height: 80.0)
          ])),
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18.0, color: Color(0xff969696)),
        )
      ],
    );
  }
}
