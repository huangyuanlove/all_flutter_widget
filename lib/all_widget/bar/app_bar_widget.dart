import 'package:flutter/material.dart';

class AppBarWidget extends StatefulWidget {
  @override
  _AppBarWidgetState createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back)),
        title: Text("title widget"),
        actions: [
          Icon(Icons.print),
          Icon(Icons.alarm),
          Icon(Icons.build),
          Icon(Icons.adjust)
        ],
        flexibleSpace: Container(
          height: 100,
          color: Colors.red,
        ),
        elevation: 10.0,
        shape: CircleBorder(),
        backgroundColor: Colors.amber,
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.android),title: Text("android")),
        BottomNavigationBarItem(icon: Icon(Icons.done),title: Text("done")),
      ]),
      bottomSheet: Text("bottom sheet"),
    );
  }
}
