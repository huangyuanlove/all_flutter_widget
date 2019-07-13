import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget/widget_test/provider/counter_model.dart';
import 'test_text_build_widget.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('second screen rebuild');
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Consumer3<CounterModel, int, Color>(
              builder: (context, CounterModel counter, int textSize,
                  Color color, _) {
                return TestTextWidget(
                  logTag: "SecondPage Consumer3<CounterModel, int, Color>",
                  child: Text(
                    'Value:${counter.value}',
                    style:
                        TextStyle(fontSize: textSize.toDouble(), color: color),
                  ),
                );
              },
            ),
            Consumer<int>(
              builder: (context, int textSize, _) {
                return TestTextWidget(
                  logTag: "secondPage.Consumer<int>",
                  child: Text(
                    "textSize ${textSize + 5}",
                    style: TextStyle(fontSize: (textSize + 5).toDouble()),
                  ),
                );
              },
            ),
            TestTextWidget(
              logTag: "tag:第二个界面中固定不变的TestTextWidget",
              child: Text("第二个界面的固定文本 TestTextWidget.child"),
            ),
            Text("SecondPage fix text"),

          ],
        ),
      ),
      floatingActionButton: Consumer<CounterModel>(
        builder: (context, CounterModel counter, child) => FloatingActionButton(
              onPressed: counter.increment,
              child: child,
            ),
        child: Icon(Icons.add),
      ),
    );
  }
}
