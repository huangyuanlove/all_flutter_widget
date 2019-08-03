import 'package:flutter/material.dart';

class TweenWidgetPage extends StatefulWidget {
  @override
  _TweenWidgetPageState createState() => _TweenWidgetPageState();
}

class _TweenWidgetPageState extends State<TweenWidgetPage>
    with TickerProviderStateMixin {
  Animation<double> scaleAnimation;
  AnimationController scaleAnimationController;
  AnimationStatus scaleAnimationStatus;
  double scaleAnimationValue;


  Animation<Color> colorAnimation;
  AnimationController colorAnimationController;
  AnimationStatus colorAnimationStatus;
  Color colorAnimationValue = Colors.red;


   Animation curve ;




  @override
  void initState() {
    super.initState();

    scaleAnimationController =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    curve  = CurvedAnimation(parent: scaleAnimationController, curve: Curves.fastLinearToSlowEaseIn);


    scaleAnimation = Tween<double>(begin: 0, end: 300).animate(curve);
    scaleAnimation.addListener(() {
      setState(() {
        scaleAnimationValue = scaleAnimation.value;
      });
    });
    scaleAnimation.addStatusListener((AnimationStatus state) {
      setState(() {
        scaleAnimationStatus = state;
      });
    });



    colorAnimationController = AnimationController(vsync: this,duration: const Duration(seconds: 3));
    colorAnimation = ColorTween(begin: Colors.blue,end:Colors.red).animate(colorAnimationController);
    colorAnimation.addListener((){
      setState(() {
        colorAnimationValue = colorAnimation.value;
      });
    });
    colorAnimation.addStatusListener((AnimationStatus state){
      setState(() {
        colorAnimationStatus = state;
      });
    });






  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TweenWidgetPage"),
      ),
      body: ListView(
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              scaleAnimationController.reset();
              scaleAnimationController.forward();
              colorAnimationController.reset();
              colorAnimationController.forward();
            },
            child: Text(
              "动画",
            ),
          ),
          Text("动画状态：" + colorAnimationStatus.toString(),style: TextStyle(color: colorAnimationValue),),
          Text("动画值：" + colorAnimationValue.toString()),
          Text("动画状态：" + scaleAnimationStatus.toString(),),
          Text("动画值：" + scaleAnimationValue.toString()),
          Container(
            height: scaleAnimation.value,
            width: scaleAnimation.value,
            child: FlutterLogo(),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    colorAnimationController.dispose();
    scaleAnimationController.dispose();
  }

}
