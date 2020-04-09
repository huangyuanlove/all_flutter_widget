import 'package:flutter/material.dart';
import 'package:flutter_widget/third_part/fl_charts/fl_chart.dart';
import 'third_part/charts/chart_page.dart';
class ThirdPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("常用三方"),),
      body: Center(
        child: ListView(
          children: <Widget>[
            RaisedButton(
              color: Colors.blue,
              highlightColor: Colors.blue[700],
              colorBrightness: Brightness.dark,
              splashColor: Colors.grey,
              child: Text("charts_flutter"),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              onPressed: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) {
                      return ChartPage();
                    }));
              },
            ),
            RaisedButton(
              color: Colors.blue,
              highlightColor: Colors.blue[700],
              colorBrightness: Brightness.dark,
              splashColor: Colors.grey,
              child: Text("fl_chart"),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              onPressed: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) {
                      return FLChart();
                    }));
              },
            ),
          ],
        ),
      ),

    );
  }
}
