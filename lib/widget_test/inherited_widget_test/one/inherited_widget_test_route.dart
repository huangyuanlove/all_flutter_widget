import 'package:flutter/material.dart';
import 'package:flutter_widget/widget_test/inherited_widget_test/one/inherited_model_context.dart';
import 'package:flutter_widget/widget_test/inherited_widget_test/one/inherited_test_model.dart';
import 'package:flutter_widget/widget_test/inherited_widget_test/one/inherited_model_second.dart';
class InheritedWidgetTestRoute extends StatefulWidget {
  @override
  InheritedWidgetTestRouteState createState() =>
      InheritedWidgetTestRouteState();
}

class InheritedWidgetTestRouteState extends State<InheritedWidgetTestRoute> {
  InheritedTestModel model;

  @override
  void initState() {
    model = new InheritedTestModel();
    model.age = 10;
    model.name = "abc";
    model.sex = "f";
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("InheritedWidget"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text("age: ${model.age}"),
            Text("name: ${model.name}"),
            Text("sex: ${model.sex}"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context){
          return  InheritedModelContext(
            model: model,
            child: InheritedSecondPage(),
          );
          }));
        },
        child: Icon(Icons.navigate_next),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //父或祖先widget中的InheritedWidget改变(updateShouldNotify返回true)时会被调用。
    //如果build中没有依赖InheritedWidget，则此回调不会被调用。
    print("Dependencies change InheritedWidgetTestRoute");
  }
}
