import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget/third_part/riverpod/provider_demo.dart';
import 'package:flutter_widget/third_part/riverpod/state_notifier_provider_widget.dart';
import 'package:flutter_widget/third_part/riverpod/state_provider_demo.dart';

class ReverpodWidget extends StatefulWidget {
  const ReverpodWidget({Key? key}) : super(key: key);

  @override
  State<ReverpodWidget> createState() => _ReverpodState();
}

class _ReverpodState extends State<ReverpodWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("riverpod demo"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: () => {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context){ return ProviderDemoWidget();}))
          }, child: Text("Provider")),
          ElevatedButton(onPressed: () => {
            Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (BuildContext context){ return StateProviderDemoWidget();}))
          }, child: Text("State Provider")),
          ElevatedButton(onPressed: () => {
            Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (BuildContext context){ return StateNotifierProviderWidget();}))
          }, child: Text("StateNotifier Provider")),
        ],
      ),
    );
  }
}
