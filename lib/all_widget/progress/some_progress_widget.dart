import 'package:flutter/material.dart';

class SomeProgressWidget extends StatefulWidget {
  @override
  _SomeProgressWidgetState createState() => _SomeProgressWidgetState();
}

class _SomeProgressWidgetState extends State<SomeProgressWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SomeProgressWidget"),),
      body: Column(
        children: <Widget>[
          LinearProgressIndicator(),
          Divider(height: 24,),
          SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(
              backgroundColor: Colors.red,
            ),
          ),
          Divider(height: 24,),
          SizedBox(
            height: 30,
            width: 30,
            child: CircularProgressIndicator(
              backgroundColor: Colors.red,
            ),
          ),
          Divider(height: 24,),
          CircularProgressIndicator(
            backgroundColor: Colors.redAccent,
          ),
          Divider(height: 24,),
          SizedBox(
            height: 50,
            width: 50,
            child: CircularProgressIndicator(
              backgroundColor: Colors.red,
            ),
          ),
          Divider(height: 24,),
        ],
      ),
    );
  }
}
