import 'package:flutter/material.dart';

class ScaleAnimation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ScaleAnimationState();
  }
}

class ScaleAnimationState extends State<ScaleAnimation>
    with TickerProviderStateMixin {
 late Animation<double> animation;
 late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
        vsync: this, duration: const Duration(seconds: 3));
    //使用弹性曲线
    animation=CurvedAnimation(parent: animationController, curve: Curves.fastOutSlowIn);
    animation = new Tween(begin: 0.0, end: 300.0).animate(animationController)
    ..addStatusListener((state){
      if(AnimationStatus.completed == state){
        animationController.reverse();
      }else if (AnimationStatus.dismissed == state){
        animationController.forward();
      }
    })
      ..addListener(() {
        setState(() {});
      });
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset("image/pic.png",width: animation.value,height: animation.value,),

    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
