import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GestureTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _GestureTest();
}

class _GestureTest extends State<GestureTest> {

  double _top = 0.0;
  double _left =0.0;
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {

return Scaffold(
  appBar: new AppBar(
        title: new Text('Gesture'),
      ),
      body:RawGestureDetector(
        gestures: {
          MultipleTapGestureRecognizer:GestureRecognizerFactoryWithHandlers<MultipleTapGestureRecognizer>(

              ()=>MultipleTapGestureRecognizer(),
              (MultipleTapGestureRecognizer instance){
                instance.onTap=()=>print("parent tap");
              
              }

          )
        },
        child:Container(
          color:Colors.pinkAccent,
          child:Center(
            child:GestureDetector(
              onTap: () => print("child tap"),
              child: Container(
                color: Colors.blueAccent,
                width: 200,
                height: 200,
              ),
            ),
          )
        )
      )
);

  }
}


class MultipleTapGestureRecognizer extends TapGestureRecognizer{

 @override
  void rejectGesture(int pointer) {
    acceptGesture(pointer);
  }

}