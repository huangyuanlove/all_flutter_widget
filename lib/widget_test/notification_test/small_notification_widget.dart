import 'package:flutter/material.dart';
import 'notification_test.dart';

class SmallNotificationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text("点击发送通知"),
      onPressed: () {
        MyNotification(msg: "SmallNotificationWidget").dispatch(context);
      },
    );
  }

}