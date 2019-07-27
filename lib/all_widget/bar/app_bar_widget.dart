import 'package:flutter/material.dart';

class AppBarWidget extends StatefulWidget {
  @override
  _AppBarWidgetState createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back)),
        title: Text("title widget"),
        actions: [
          SnackBarWithoutAction(),
          SnackBarWithAction(),
          IconButton(icon: Icon(Icons.speaker_notes),onPressed: (){
            _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("通过GlobalKey呼出SnakeBar")));
          },)
        ],
        flexibleSpace: Container(
          color: Colors.red,
        ),
        elevation: 10.0,
        backgroundColor: Colors.amber,
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.android), title: Text("android")),
        BottomNavigationBarItem(icon: Icon(Icons.done), title: Text("done")),
      ]),
      bottomSheet: Text("bottom sheet"),
      body: GestureDetector(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Icon(Icons.delete),
        ),
        onTap: () {
          print("delete");
          Scaffold.of(this.context)
              .showSnackBar(SnackBar(content: Text("delete")));
        },
      ),
    );
  }
}

class SnackBarWithoutAction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text("没有Action的SnakeBar")));
      },
      icon: Icon(Icons.done),
    );
  }
}

class SnackBarWithAction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Scaffold.of(context).showSnackBar(SnackBar(
            content: Text("右侧是一个ActionBar"),
            action: SnackBarAction(
                label: "确认撤销?",
                onPressed: () {
                  print("撤销");
                })));
      },
      icon: Icon(Icons.undo),
    );
  }
}
