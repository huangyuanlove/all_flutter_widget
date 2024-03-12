import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomFlowWidget extends StatefulWidget {
  const CustomFlowWidget({Key? key}) : super(key: key);

  @override
  State<CustomFlowWidget> createState() => _CustomFlowWidgetState();
}

class _CustomFlowWidgetState extends State<CustomFlowWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CustomFlowWidget"),
      ),
      body: ColoredBox(
        color: Colors.cyanAccent,
        child: SizedBox(
          width: 300,
          height: 300,
          child: Flow(
            delegate: SimpleFlowDelegate(),
            children: [
              Icon(Icons.add),
              Icon(Icons.backspace),
              Icon(Icons.cached),
              Icon(Icons.dashboard_outlined),
              Icon(Icons.edgesensor_high),
            ],
          ),
        ),
      ),
    );
  }
}

class SimpleFlowDelegate extends FlowDelegate {
  final int space;

  SimpleFlowDelegate({this.space = 10});

  @override
  BoxConstraints getConstraintsForChild(int i, BoxConstraints constraints) {
    return constraints.loosen();
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    // double counter = 0;
    // for (int i = 0; i < context.childCount; i++) {
    //   counter = context.getChildSize(i)!.width * i;
    //   context.paintChild(i,
    //       transform: Matrix4.translationValues(i * space + counter, 0, 0));
    // }
    //sin是正弦，直角三角形中对边比斜边

    double angel = 90;
    double startAngel = 90;



    final double radius = context.size.shortestSide / 2;
    final int count = context.childCount;
    final double perRad = angel/180 * pi/(count-2);

    for (int i = 0; i < count-1; i++) {
      final Size size = context.getChildSize(i) ?? Size.zero;
      final double offsetX = (radius - size.width / 2) * cos(i * perRad ) + size.width/2;
      final double offsetY = (radius - size.height / 2) * sin(i * perRad ) + radius;
      context.paintChild(i+1,
          transform: Matrix4.translationValues(
              (offsetX - size.width / 2), (offsetY - size.height / 2), 0.0));
    }

    final Size size = context.getChildSize(0) ?? Size.zero;
    context.paintChild(0,transform:Matrix4.translationValues(0, radius-size.height/2, 0.0));
    

  }

  @override
  bool shouldRepaint(covariant SimpleFlowDelegate oldDelegate) {
    return oldDelegate.space != space;
  }
}
