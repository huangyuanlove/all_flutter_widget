import 'package:flutter/material.dart';
import 'RandomWordsWidget.dart';
import 'CounterWidget.dart';
import 'SwitchAndCheckBox.dart';
import 'ImageViewPager.dart';
import 'test_small_widget.dart';
import 'will_pop_scope.dart';
import 'package:flutter_widget/widget_test/inherited_widget_test/one/inherited_widget_test_route.dart';
import 'package:flutter_widget/widget_test/inherited_widget_test/two/inherited_widget_in_single_page.dart';
import 'package:flutter_widget/widget_test/notification_test/notification_test_widget_route.dart';
import 'test_deliver_value.dart';
import 'package:flutter_widget/widget_test/provider/counter_model_widget.dart';
import 'package:flutter_widget/widget_test/provider/counter_model.dart';
import 'package:provider/provider.dart';
import 'save_image_to_file.dart';
import 'test_build_stateless.dart';
import 'package:flutter_widget/widget_test/listview_slide/swipe_list_item_demo_page.dart';
class MyPageHome extends StatefulWidget {
  @override
  MyPageHomeState createState() => new MyPageHomeState();
}

class MyPageHomeState extends State<MyPageHome> {
  int count = 0;
  GlobalKey scaffoldKey = new GlobalKey();

  void _increase() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: scaffoldKey,
      appBar: new AppBar(
        title: new Text("flutter demo"),
      ),
      body: new Center(
        child: new ListView(
          children: <Widget>[
            RandomWordsWidget(),

            FlatButton(
              child: Text("router"),
              onPressed: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) {
                  return new CounterWidget();
                }));
              },
            ),
            Text.rich(TextSpan(children: [
              TextSpan(
                text: "hello\n",
                style: TextStyle(color: Colors.deepOrangeAccent),
              ),
              TextSpan(
                  text: "http://flutter.github.io",
                  style: TextStyle(color: Colors.blue))
            ])),

            FlatButton(
              color: Colors.blue,
              highlightColor: Colors.blue[700],
              colorBrightness: Brightness.dark,
              splashColor: Colors.grey,
              child: Text("Submit"),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              onPressed: () => {
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (context) {
                      return ImageViewPager();
                    }))
                  },
            ),

            SwitchAndCheckBoxTestRoute(),
            FlatButton(
              color: Colors.blue,
              highlightColor: Colors.blue[700],
              colorBrightness: Brightness.dark,
              splashColor: Colors.grey,
              child: Text("CustomScrollView"),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              onPressed: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return TestSmallWidget();
                    }))
                  },
            ),

            FlatButton(
              child: Text("WillPopScopeTest"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return WillPopScopeTest();
                }));
              },
            ),
            FlatButton(
              child: Text("InheritedWidgetTestRoute_one"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return InheritedWidgetTestRoute();
                }));
              },
            ),
            FlatButton(
              child: Text("InheritedWidgetTestRoute_two"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return InheritedWidgetInSinglePage();
                }));
              },
            ),
            FlatButton(
              child: Text("Notification"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return NotificationWidgetRoute();
                }));
              },
            ),
            FlatButton(
              child: Text("TestDeliverValue"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return TestDeliverValueWidget(value: "TestDeliverValue");
                })).then((onValue) {
                  print(onValue);
                });
              },
            ),

            FlatButton(
              child: Text("TestProvider"),
              onPressed: () {
                final counter = CounterModel();
                final textSize = 48;
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Provider<int>.value(
                    value: textSize,
                    child: ChangeNotifierProvider.value(
                      value: counter,
                      child: CounterFirstScreen(),
                    ),
                  );
                })).then((onValue) {
                  print(onValue);
                });
              },
            ),
            FlatButton(
              child: Text("save_image_to_file"),
              onPressed: () {
                final counter = CounterModel();
                final textSize = 48;
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SaveImageWidget();
                })).then((onValue) {
                  print(onValue);
                });
              },
            ),
            FlatButton(
              child: Text("build stateless widget"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return TestBuildStateLess();
                })).then((onValue) {
                  print(onValue);
                });
              },
            ),

            FlatButton(
              child: Text("named router"),
              onPressed: () {
                Navigator.pushNamed(context, "new_page",
                        arguments: "this is argument")
                    .then((value) {
                  print("命名路由返回的参数$value");
                });
              },
            ),
            FlatButton(
              child: Text("a_router_widget"),
              onPressed: () {
                Navigator.pushNamed(context, "a_router_widget").then((value) {
                  print("命名路由返回的参数$value");
                });
              },
            ),
            FlatButton(
              child: Text("SwipeListItemDemoPage"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return SwipeListItemDemoPage();
                }));
              },
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _increase,
        child: new Icon(Icons.add),
        tooltip: "tip tip",
      ),
    );
  }
}
