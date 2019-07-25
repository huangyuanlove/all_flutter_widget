import 'package:flutter/material.dart';
import 'index_stack_widget.dart';
class StackWidget extends StatefulWidget {
  @override
  _StackWidgetState createState() => _StackWidgetState();
}

class _StackWidgetState extends State<StackWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Stack"),),
      body: Stack(
        alignment:AlignmentDirectional.lerp(AlignmentDirectional.topStart, AlignmentDirectional.bottomEnd, 0.2),
        children: <Widget>[
          SizedBox(
            height: 200,
            width: 200,
            child: Container(
              child: Text("first stack"),
              color: Colors.amber,
            ),
          ),
          SizedBox(
            height: 100,
            width: 100,
            child: Container(
              child: Text("second stack"),
              color: Colors.cyan,
            ),
          ),
          SizedBox(
            height: 50,
            width: 50,
            child: Container(
              child: Text("third stack"),
              color: Colors.deepOrange,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){ Navigator.of(context).push(MaterialPageRoute(builder: (context){return IndexStackWidget();})); },child: Text("indexStack"),),
    );
  }
}
