import 'package:flutter/material.dart';

class ScrollMetricsWidget extends StatefulWidget {
  @override
  _ScrollMetricsState createState() => _ScrollMetricsState();
}

class _ScrollMetricsState extends State<ScrollMetricsWidget> {
  String _progress = "0%";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ScrollMetrics"),
      ),
      body: Scrollbar(
          child: NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification notification) {
                double progress = notification.metrics.pixels /
                    notification.metrics.maxScrollExtent;
                //重新构建
                setState(() {
                  _progress = "${(progress * 100).toInt()}%";
                });
                print("BottomEdge: ${notification.metrics.extentAfter == 0}");
                //return true; //放开此行注释后，进度条将失效
              },
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  ListView.builder(
                      itemCount: 100,
                      itemExtent: 50.0,
                      itemBuilder: (context, index) {
                        return Container(
                          color: Theme.of(context).primaryColor,
                          margin: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Text(
                            'test$index',
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        );
                      }),
                  CircleAvatar(
                    //显示进度百分比
                    radius: 30.0,
                    child: Text(_progress),
                    backgroundColor: Colors.black54,
                  )
                ],
              ))),
    );
  }
}
