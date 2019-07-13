import "package:flare_flutter/flare_actor.dart";
import "package:flutter/material.dart";



class FlareSimplePage extends StatefulWidget {
  FlareSimplePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _FlareSimplePageState createState() => _FlareSimplePageState();
}

class _FlareSimplePageState extends State<FlareSimplePage> {
  String _animationName = "idle";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(title: Text(widget.title)),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                  child: FlareActor(
                "assets/image/Filip.flr",
                alignment: Alignment.center,
                fit: BoxFit.contain,
                animation: _animationName,
              ))
            ],
          ),
        ));
  }
}
