import 'package:flutter/material.dart';
import 'overflow_box_widget.dart';
import 'decoratebox_widget.dart';
import 'fitted_box_widget.dart';
import 'limited_box_widget.dart';

class BoxWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("box widget"),
      ),
      body: (Column(
        children: <Widget>[
          ConstrainedBox(
            constraints: BoxConstraints(
                minHeight: 100, minWidth: 100, maxHeight: 200, maxWidth: 200),
            child: Container(
              width: 250,
              height: 80,
              color: Colors.teal,
              child: Text(
                "ConstrainedBox",
                softWrap: true,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return OverflowBoxWidget();
              }));
            },
            child: Text("OverflowBox"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return DecorateBoxWidget();
              }));
            },
            child: Text("DecoratedBox"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return FittedBoxWidget();
              }));
            },
            child: Text("FittedBox"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return LimitedBoxWidget();
              }));
            },
            child: Text("LimitedBox"),
          ),
          TextButton(
            onPressed: () {},
            child: Text("RotatedBox"),
          ),
          TextButton(
            onPressed: () {},
            child: Text("SizedOverflowBox"),
          ),
          TextButton(
            onPressed: () {},
            child: Text("UnconstrainedBox"),
          ),
        ],
      )),
    );
  }
}
