import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TestCustomSingleChildLayoutWidget extends StatefulWidget {
  const TestCustomSingleChildLayoutWidget({Key? key}) : super(key: key);

  @override
  State<TestCustomSingleChildLayoutWidget> createState() =>
      _TestCustomSingleChildLayoutWidgetState();
}

class _TestCustomSingleChildLayoutWidgetState
    extends State<TestCustomSingleChildLayoutWidget> {
  double lenValue = 0;
  double degValue = 0;
  ValueNotifier<Polar> polar = ValueNotifier(Polar(len: 0, deg: 0));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SingleChildLayoutDelegate"),
      ),
      body:

      Column(
        children: [
          SizedBox(
            width: 200,
            height: 200,
            child: ColoredBox(
              color: Colors.amberAccent,
              child: CustomSingleChildLayout(
                  delegate: PolarLayoutDelegate(polar: polar),
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: ColoredBox(
                      color: Colors.greenAccent,
                    ),
                  )),
            ),
          ),
          Column(
            children: [
              Slider(value: lenValue,max: 1,min: 0, onChanged:(value){
                setState((){
                  lenValue = value;
                  polar.value = Polar(len: value,deg: polar.value.deg);
                });

              } ),
              Slider(value: degValue,max: 360,min: 0, onChanged:(value){
                setState((){
                  degValue = value;
                  polar.value = Polar(len:polar.value.len,deg: value * pi / 180);
                });
              } )

            ],
          )
        ],
      ),
    );
  }
}

class PolarLayoutDelegate extends SingleChildLayoutDelegate {
  final ValueListenable<Polar> polar;

  PolarLayoutDelegate({required this.polar}) : super(relayout: polar);

  @override
  bool shouldRelayout(covariant PolarLayoutDelegate oldDelegate) {
    return oldDelegate.polar != polar;
  }

  @override
  Size getSize(BoxConstraints constraints) {
    final radius = constraints.biggest.shortestSide;
    return Size(radius, radius);
  }

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return constraints.loosen();
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    final tmpPolar = polar.value;
    double r = size.width / 2 * tmpPolar.len;
    Offset center = Offset(size.width / 2, size.height / 2);
    Offset offset = Offset(r * cos(tmpPolar.deg), r * sin(tmpPolar.deg));
    Offset childSizeOffset = Offset(childSize.width / 2, childSize.height / 2);
    return center + offset - childSizeOffset;
  }
}

class Polar {
  final double len;
  final double deg;

  Polar({required this.len, required this.deg});
}
