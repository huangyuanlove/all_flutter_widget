import 'package:flutter/material.dart';

class ARouterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("命名路由A"),
        ),
        body: WillPopScope(
            child: Center(
              child: Column(
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      final argument = {"title": "A界面传来的值"};

                      Navigator.of(context)
                          .pushNamed("b_router_widget", arguments: argument);
                    },
                    child: Text(
                      "去B界面",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("c_router_widget");
                    },
                    child: Text(
                      "去C界面",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("d_router_widget");
                    },
                    child: Text(
                      "去D界面",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("e_router_widget");
                    },
                    child: Text(
                      "去E界面",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ),
            onWillPop: (){
             onBackPress(context);
            }));
  }


  void onBackPress(BuildContext context){
    print("点击了返回按钮");
    Navigator.of(context).pop();
  }

}
