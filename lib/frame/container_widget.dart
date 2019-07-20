import 'package:flutter/material.dart';

class ContainerAndCenter extends StatefulWidget {
  @override
  _ContainerAndCenterState createState() => _ContainerAndCenterState();
}

class _ContainerAndCenterState extends State<ContainerAndCenter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ContainerAndCenter"),
      ),
      body: Container(
        color: Colors.tealAccent,
        transform: Matrix4.rotationZ(0.1),
        child: ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Center(
            child: Text(
              "Center",
              style: TextStyle(backgroundColor: Colors.teal),
            ),
          ),
        ),
      ),
    );
  }
}
