import 'package:flutter/material.dart';
import 'package:flutter_widget/widget_test/inherited_widget_test/one/inherited_model_context.dart';
import 'package:flutter_widget/widget_test/inherited_widget_test/one/inherited_test_model.dart';

class InheritedSecondPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return InheritedSecondPageState();
  }
}

class InheritedSecondPageState extends State<InheritedSecondPage> {
  InheritedModelContext modelContext;
  InheritedTestModel model;

  String name = "";
  int age = 0;
  String sex = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    modelContext = InheritedModelContext.of(context);
    model = modelContext.model;
    return Scaffold(
      appBar: AppBar(
        title: Text("第二页"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text("age: ${model.age}"),
            Text("name: ${model.name}"),
            Text("sex: ${model.sex}"),
            Column(
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    setState(() {
                      model.name = DateTime.now().toLocal().toString();
                    });
                  },
                  child: Text("改变Name"),
                ),
                FlatButton(
                  onPressed: () {
                    setState(() {
                      model.age = DateTime.now().millisecondsSinceEpoch;
                    });
                  },
                  child: Text("改变Age"),
                ),
                FlatButton(
                  onPressed: () {
                    setState(() {
                      model.sex = DateTime.now().toString();
                    });
                  },
                  child: Text("改变sex"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //父或祖先widget中的InheritedWidget改变(updateShouldNotify返回true)时会被调用。
    //如果build中没有依赖InheritedWidget，则此回调不会被调用。
    print("Dependencies change InheritedSecondPage");
  }
}
