import 'package:flutter/material.dart';

class IndexStackWidget extends StatefulWidget {
  @override
  _IndexStackWidgetState createState() => _IndexStackWidgetState();
}

class _IndexStackWidgetState extends State<IndexStackWidget> {

  int index = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("IndexStack"),
      ),
      body: IndexedStack(
        index: index,
        children: <Widget>[
          Icon(Icons.access_alarm),
          Icon(Icons.access_time),
          Icon(Icons.alarm_add),
          Icon(Icons.alarm_off),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        setState(() {
          index = (index+1)%4;
          print(index);
        });
      },child: Icon(Icons.add),),
    );
  }
}
