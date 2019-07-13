import 'package:flutter/material.dart';
import 'package:flutter_widget/widget_test/inherited_widget_test/two/inherited_context.dart';
import 'package:flutter_widget/widget_test/inherited_widget_test/two/single_page_model.dart';
class SecondPageWidget extends StatefulWidget{
  @override
  SecondPageState createState() {
    return SecondPageState();
  }

}

class SecondPageState extends State<SecondPageWidget>{



  @override
  Widget build(BuildContext context) {
    InheritedContext inheritedContext = InheritedContext.of(context);
    SinglePageModel model = inheritedContext.model;


    return Scaffold(
      appBar: AppBar(title: Text("SecondPageWidget"),),
      body: Container(
        child: Column(children: <Widget>[
          Text("page   ${model.page}"),
          FlatButton(
            onPressed: (){
              setState(() {
                model.page = DateTime.now().millisecondsSinceEpoch;
              });
            },
            child: Icon(Icons.add),
          ),


          Text("content   ${model.content}"),
          FlatButton(
            onPressed: (){
              setState(() {
                model.content = DateTime.now().toLocal().toString();
              });
            },
            child: Icon(Icons.add),
          ),
        ],),
      ),
    );
  }

}