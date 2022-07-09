import 'package:flutter/material.dart';
import 'notification_test.dart';
import 'small_notification_widget.dart';
class NotificationWidgetRoute extends StatefulWidget{
  @override
  NotificationWidgetRouteState createState() {
    return NotificationWidgetRouteState();
  }

}

class NotificationWidgetRouteState extends State<NotificationWidgetRoute>{

  String _msg="";
  @override
  Widget build(BuildContext context) {



    return NotificationListener<MyNotification>(
      onNotification: (notification)  {
        setState(() {
          _msg += notification.msg;
        });
        return true;
      },
      child:Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Builder(
            builder: (context) {
              return RaisedButton(
                //按钮点击时分发通知
                onPressed: () => MyNotification(msg: "hi ").dispatch(context),
                child: Text("Send Notification"),
              );
            },
          ),
          Text(_msg),
          SmallNotificationWidget()
        ],
      ));
  }

}