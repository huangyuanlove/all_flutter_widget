import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_widget/complex_widget/provider/counter_model.dart';
import 'counter_model_widget_second.dart';
import 'test_text_build_widget.dart';

class CounterFirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _counter = Provider.of<CounterModel>(context);
    final _textSize = Provider.of<int>((context)).toDouble();
    print('first screen rebuild');
    return Scaffold(
      appBar: AppBar(
        title: Text('FirstPage'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            TestTextWidget(
              logTag: "tag:第一个界面中显示计数的TestTextWidget",
              child: Text(
                'Value: ${_counter.value}',
                style: TextStyle(fontSize: _textSize),
              ),
            ),
            TestTextWidget(
              logTag: "tag:第一个界面中固定的文本",
              child: Text("固定文本，不需要重绘"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
//                return Provider<int>.value(
//                  value: _textSize.toInt(),
//                  child: ChangeNotifierProvider.value(
//                    value: _counter,
//                    child: Provider<Color>.value(
//                      value: Colors.red.shade50,
//                      child: SecondPage(),
//                    ),
//                  ),
//                );
            return MultiProvider(
              providers: [
                Provider<int>.value(value: _textSize.toInt()),
                ChangeNotifierProvider.value(value: _counter),
                Provider.value(value: Colors.red.shade50),
              ],
              child: SecondPage(),
            );
          }))
        },
        child: Icon(Icons.navigate_next),
      ),
    );
  }
}
