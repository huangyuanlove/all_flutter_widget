import 'package:flutter/material.dart';

class TestTextWidget extends StatelessWidget{

  TestTextWidget({required this.logTag,required this.child});
  final String logTag;
  final Widget child;


  @override
  Widget build(BuildContext context) {
    print(logTag);
    return child;
  }

}