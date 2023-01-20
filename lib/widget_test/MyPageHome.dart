import 'package:flutter/material.dart';
import 'UseKeyWidget.dart';
import 'test_small_widget.dart';
import 'will_pop_scope.dart';
import 'package:flutter_widget/widget_test/notification_test/notification_test_widget_route.dart';
import 'test_deliver_value.dart';
import 'package:flutter_widget/widget_test/provider/counter_model_widget.dart';
import 'package:flutter_widget/widget_test/provider/counter_model.dart';
import 'package:provider/provider.dart';
import 'save_image_to_file.dart';
import 'test_build_stateless.dart';
import 'package:flutter_widget/widget_test/listview_slide/swipe_list_item_demo_page.dart';
import 'gesture/gesture_test.dart';
import 'custom_error_widget.dart';

class MyPageHome extends StatefulWidget {
  @override
  MyPageHomeState createState() => new MyPageHomeState();
}

class MyPageHomeState extends State<MyPageHome> {
  int count = 0;
  GlobalKey scaffoldKey = new GlobalKey();

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

            ElevatedButton(

              child: Text("CustomScrollView"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return TestSmallWidget();
                }));
              },

            ),
            Divider(height: 10,),
            ElevatedButton(
              child: Text("WillPopScopeTest"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return WillPopScopeTest();
                }));
              },
            ),
            Divider(height: 10,),
            ElevatedButton(
              child: Text("Notification"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return NotificationWidgetRoute();
                }));
              },
            ),
            Divider(height: 10,),
            ElevatedButton(
              child: Text("TestDeliverValue"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return TestDeliverValueWidget(value: "TestDeliverValue");
                })).then((onValue) {
                  print(onValue);
                });
              },
            ),
            Divider(height: 10,),
            ElevatedButton(
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
            Divider(height: 10,),
            ElevatedButton(
              child: Text("save_image_to_file"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SaveImageWidget();
                })).then((onValue) {
                  print(onValue);
                });
              },
            ),
            Divider(height: 10,),
            ElevatedButton(
              child: Text("build stateless widget"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return TestBuildStateLess();
                })).then((onValue) {
                  print(onValue);
                });
              },
            ),
            Divider(height: 10,),
            ElevatedButton(
              child: Text("named router"),
              onPressed: () {
                Navigator.pushNamed(context, "new_page",
                        arguments: "this is argument")
                    .then((value) {
                  print("命名路由返回的参数$value");
                });
              },
            ),
            Divider(height: 10,),
            ElevatedButton(
              child: Text("a_router_widget"),
              onPressed: () {
                Navigator.pushNamed(context, "a_router_widget").then((value) {
                  print("命名路由返回的参数$value");
                });
              },
            ),
            Divider(height: 10,),
            ElevatedButton(
              child: Text("SwipeListItemDemoPage"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SwipeListItemDemoPage();
                }));
              },
            ),
            Divider(height: 10,),
            ElevatedButton(
              child: Text("手势竞技场"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return GestureTest();
                }));
              },
            ),
            Divider(height: 10,),
            ElevatedButton(
              child: Text("自定义错误页面"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return TestCustomErrorWidget();
                }));
              },
            ),
            Divider(height: 10,),
            ElevatedButton(
              child: Text("Key"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SwapColorBox();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
