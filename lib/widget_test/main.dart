import 'package:flutter/material.dart';
import 'MyPageHome.dart';
import 'NewRoute.dart';
import 'package:flutter_widget/widget_test/test_named_router/a_router_widget.dart';
import 'package:flutter_widget/widget_test/test_named_router/b_router_widget.dart';
import 'package:flutter_widget/widget_test/test_named_router/c_router_widget.dart';
import 'package:flutter_widget/widget_test/test_named_router/d_router_widget.dart';
import 'package:flutter_widget/widget_test/test_named_router/e_router_widget.dart';

class AppTestWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "flutter demo",
      theme: new ThemeData(primarySwatch: Colors.blue),
      routes: {
        "new_page": (BuildContext context) {
          return new NewRoute(text: ModalRoute.of(context).settings.arguments);
        },
        "a_router_widget": (BuildContext context) {
          return ARouterWidget();
        },
        "b_router_widget": (BuildContext context) {
          return BRouterWidget();
        },
        "c_router_widget": (BuildContext context) {
          Map arguments = ModalRoute.of(context).settings.arguments;

          return CRouterWidget(
              shareContent: arguments["shareContent"],
              shareImageUrl: arguments["shareContent"],
              shareTitle: arguments["shareTitle"]);
        },
        "d_router_widget": (BuildContext context) {
          return DRouterWidget();
        },
        "e_router_widget": (BuildContext context) {
          return ERouterWidget();
        },
      },
      home: new MyPageHome(),
    );
  }
}
