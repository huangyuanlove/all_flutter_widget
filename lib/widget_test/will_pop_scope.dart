import 'package:flutter/material.dart';

class WillPopScopeTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime _lastPressedAt;
    return WillPopScope(
        child: Container(
          alignment: Alignment.center,
          child: Text("1秒内连续按两次返回键退出"),
        ),
        onWillPop: () async {
          if (_lastPressedAt == null ||
              DateTime.now().difference(_lastPressedAt) >
                  Duration(seconds: 1)) {
            _lastPressedAt = DateTime.now();
            return false;
          } else {
            return true;
          }
        });
  }
}
