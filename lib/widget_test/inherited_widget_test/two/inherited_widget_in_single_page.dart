import 'package:flutter/material.dart';
import 'package:flutter_widget/widget_test/inherited_widget_test/two/single_page_model.dart';
import 'package:flutter_widget/widget_test/inherited_widget_test/two/inherited_context.dart';
import 'package:flutter_widget/widget_test/inherited_widget_test/two/widget_a.dart';
import 'package:flutter_widget/widget_test/inherited_widget_test/two/widget_b.dart';
import 'package:flutter_widget/widget_test/inherited_widget_test/two/second_page.dart';

class InheritedWidgetInSinglePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return InheritedWidgetInSinglePageState();
  }
}

class InheritedWidgetInSinglePageState
    extends State<InheritedWidgetInSinglePage> {
  SinglePageModel model = SinglePageModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("同一页面共享数据"),
      ),
      body: NotificationListener<MyNotification>(
        onNotification: (notification) {
          setState(() {});
        },
        child: InheritedContext(
          model: model,
          child: Column(
            children: <Widget>[
              Text("page:${model.page}"),
              Text("content:${model.content}"),
              FlatButton(
                onPressed: () {
                  if (model.page == null) {
                    model.page = 1;
                  } else {
                    model.page += 1;
                  }
                  setState(() {});
                },
                child: Icon(Icons.add),
              ),
              WidgetA(),
              WidgetB(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return InheritedContext(
              model: model,
              child: SecondPageWidget(),
            );
          }));
        },
        child: Icon(Icons.navigate_next),
      ),
    );
  }
}
