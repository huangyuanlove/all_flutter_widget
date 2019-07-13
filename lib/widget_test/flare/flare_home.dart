import 'package:flutter/material.dart';
import 'package:flutter_widget/widget_test/flare/change_color.dart';
import 'package:flutter_widget/widget_test/flare/checkbox/settings.dart';
import 'package:flutter_widget/widget_test/flare/favorite/page.dart';
import 'package:flutter_widget/widget_test/flare/penguin_dance/penguin_dance.dart';
import 'package:flutter_widget/widget_test/flare/simple/flare_simple.dart';
import 'package:flutter_widget/widget_test/flare/slider/slider_page.dart';
import 'package:flutter_widget/widget_test/flare/space_reload/refresh_control.dart';
import 'package:flutter_widget/widget_test/flare/teddy/main.dart';
class FlareHomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flare"),
      ),
      body: ListView(
        children: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ChangeColorWidget(title: "change color example",);
              }));
            },
            child: Text("ChangeColorExample"),
          ),
          FlatButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return CheckBoxFlare();
              }));
            },
            child: Text("check box"),
          ),
          FlatButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return FavoritePage();
              }));
            },
            child: Text("FavoritePage"),
          ),
          FlatButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return PenguinDancePage(title: "PenguinDancePage",);
              }));
            },
            child: Text("PenguinDancePage"),
          ),
          FlatButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return FlareSimplePage(title: "PenguinDancePage",);
              }));
            },
            child: Text("FlareSimplePage"),
          ),
          FlatButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SliderPage(title: "SliderPage",);
              }));
            },
            child: Text("SliderPage"),
          ),
          FlatButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return CupertinoRefreshControlDemo();
              }));
            },
            child: Text("CupertinoRefreshControlDemo"),
          ),
          FlatButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return TeddyPage();
              }));
            },
            child: Text("teddy"),
          ),
        ],
      ),
    );
  }
}
