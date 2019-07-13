import 'package:flutter/material.dart';

import 'package:flutter_widget/widget_test/inherited_widget_test/two/inherited_context.dart';
import 'package:flutter_widget/widget_test/inherited_widget_test/two/single_page_model.dart';

class WidgetA extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WidgetAState();
  }
}

class WidgetAState extends State<WidgetA> {

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    final InheritedContext inheritedContext = InheritedContext.of(context);
    final SinglePageModel model = inheritedContext.model;
    print("WidgetA build");
    return Center(
      child: Column(
        children: <Widget>[
          Text("当前页${model.page}"),
          Text("内容：${model.content}"),
          FlatButton(
            onPressed: () {
              if(model.page==null){
                model.page = 1;
              }else {
                model.page += 1;
              }
              MyNotification("refresh").dispatch(context);
              setState(() {

              });


            },
            child: Icon(Icons.add),
          ),
          FlatButton(
            onPressed: () {
              model.content = DateTime.now().toLocal().toString();
              MyNotification("refresh").dispatch(context);
              setState(() {

              });
            },
            child: Text("改变content"),
          ),
        ],
      ),
    );
  }
}
