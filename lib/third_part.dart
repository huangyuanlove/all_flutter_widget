import 'package:flutter/material.dart';
import 'package:flutter_widget/third_part/riverpod/riverpod_widget.dart';
import 'package:flutter_widget/third_part/show_rich_text_html.dart';

class ThirdPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("常用三方"),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            RaisedButton(
              color: Colors.blue,
              highlightColor: Colors.blue[700],
              colorBrightness: Brightness.dark,
              splashColor: Colors.grey,
              child: Text("fl_chart"),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              onPressed: () {},
            ),
            ElevatedButton(
                onPressed: () =>
                {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (BuildContext context) {
                        return ReverpodWidget();
                      }))
                },
                child: Text("riverpod"),
              style: ButtonStyle(),

            ),
            ElevatedButton(
              onPressed: () =>
              {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (BuildContext context) {
                      return ShowHtmlTextWidget();
                    }))
              },
              child: Text("HtmlWidget"),


            ),


          ],
        ),
      ),
    );
  }
}
