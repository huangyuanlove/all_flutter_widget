import 'dart:math';

import 'package:flutter/material.dart';

class RandomColorBoxStateful extends StatefulWidget {
  RandomColorBoxStateful({Key? key}) : super(key: key);

  @override
  State<RandomColorBoxStateful> createState() => RandomColorBoxState();
}

class RandomColorBoxState extends State<RandomColorBoxStateful> {
  late Color myColor;

  @override
  void initState() {
    super.initState();
    myColor = RandomColor.getColor();
  }

  @override
  Widget build(BuildContext context) {
    return Text("$myColor",style: TextStyle(color: myColor),);
  }
}

class RandomColorBoxStateless extends StatelessWidget {
  RandomColorBoxStateless({Key? key}) : super(key: key);
  Color myColor = RandomColor.getColor();

  @override
  Widget build(BuildContext context) {
    return Text("$myColor",style: TextStyle(color: myColor),);
  }
}

class RandomColor {
  static final Random _random = Random();

  static Color getColor() {
    return Color.fromRGBO(
      _random.nextInt(256),
      _random.nextInt(256),
      _random.nextInt(256),
      1,
    );
  }
}

class SwapColorBox extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SwapColorBoxState();
}

class SwapColorBoxState extends State<SwapColorBox> {
  List<Widget> tiles = [
    RandomColorBoxStateful(

    ),
    RandomColorBoxStateful(

    )
  ];

  // List<Widget> tiles = [ RandomColorBoxStateless(), RandomColorBoxStateless() ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(children: tiles)),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.sentiment_very_satisfied),
        onPressed: swapTiles,
      ),
    );
  }

  void swapTiles() {
    setState(() {
      List<Widget> tmp = [tiles[1], tiles[0]];
      Key? keyOne = tmp[0].key;
      Key? keyTwo = tmp[1].key;
      if (keyOne != null) {
        print("keyOne $keyOne");
      }
      if (keyTwo != null) {
        print("keyTwo $keyTwo");
      }
      tiles = tmp;
    });
  }
}
