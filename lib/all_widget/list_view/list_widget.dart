import 'package:flutter/material.dart';
import 'list_body_widget.dart';
import 'animated_list.dart';
import 'list_view_widget.dart';
class ListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListWidget"),
      ),
      body: Column(
        children: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return AnimatedListViewWidget();
              }));
            },
            child: Text("AnimatedList"),
          ),
          FlatButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return ListViewWidget();
              }));
            },
            child: Text("ListView"),
          ),
          FlatButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return ListBodyWidget();
              }));
            },
            child: Text("ListBody"),
          ),
        ],
      ),
    );
  }
}
