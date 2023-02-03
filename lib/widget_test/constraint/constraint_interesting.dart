import 'package:flutter/material.dart';
import 'package:flutter_widget/widget_test/UseKeyWidget.dart';

class ConstraintInteresting extends StatelessWidget {
   ConstraintInteresting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("some interesting"),
      ),
      body: buildMNLayout(10,3),
    );
  }

  Widget buildMNLayout(int m, int n) {
    List<Widget> h = [];
    for (int i = 0; i < m; i++) {
      List<Widget> v = [];
      for (int j = 0; j < n; j++) {
        v.add(getRandomColorBox(i*j));
      }
      h.add(Expanded(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: v,
      )));
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: h,
    );
  }


  List<String> imagePath = [
    "assets/image/food/food01.jpeg",
    "assets/image/food/food02.jpeg",
    "assets/image/food/food03.jpeg",
    "assets/image/food/food04.jpeg",
    "assets/image/food/food05.jpeg",
    "assets/image/food/food06.jpeg",
  ];
  Widget getRandomColorBox(int index) {
    Widget child ;
    if(index % 2 ==0){
      child = Image.asset(imagePath[index % imagePath.length]);
    }else{
      child = Container();
    }



    return
      Expanded(child: ColoredBox(color: RandomColor.getColor(),child: child,));
  }
}
