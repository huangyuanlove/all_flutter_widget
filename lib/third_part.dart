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
            ElevatedButton(

              child: Text("fl_chart"),

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
