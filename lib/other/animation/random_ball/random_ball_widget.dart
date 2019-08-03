import 'package:flutter/material.dart';
import 'ball_widget.dart';
import 'dart:math' as math;

class RandomBallWidget extends StatefulWidget {
  @override
  _RandomBallWidgetState createState() => _RandomBallWidgetState();
}

class _RandomBallWidgetState extends State<RandomBallWidget>
    with TickerProviderStateMixin {
  var _balls = List<Ball>(); //将_ball换成集合

  Ball _ball;
  Rect _limit;

  AnimationController controller;
  bool animationPlaying;

  @override
  void initState() {
    super.initState();
    animationPlaying = false;
    _ball =
        Ball(x: 101, y: 101, color: Colors.blue, r: 100, aX: 0.31, aY: 0.54, vX: 0, vY: 0);
    _balls.add(_ball);

    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 10));
    controller.addListener(() {
      updateBall(); //更新小球

      setState(() {});
    });
    controller.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
  }

  void updateBall() {
    for (int i = 0; i < _balls.length; i++) {
      var ball = _balls[i];
      if (ball.r < 0.5) {
        //半径小于0.3就移除
        _balls.removeAt(i);
        if(_balls.isEmpty){
          controller.stop();
          print("停止动画");
        }
      }

      //运动学公式
      ball.x += ball.vX;
      ball.y += ball.vY;
      ball.vX += ball.aX;
      ball.vY += ball.aY;



      //限定上边界
      if (ball.y-ball.r <= _limit.top ) {
        ball.y = _limit.top+ball.r;
        ball.vY = -ball.vY;
        ball.vY += ball.aY;



        ball.color = randomRGB();
      }

      //限定下边界
      if (ball.y+ball.r >= _limit.bottom ) {
        ball.y = _limit.bottom -ball.r;
        ball.vY = -ball.vY;
        ball.vY += ball.aY;

        if(_balls.length<40) {
          if(ball.r>3) {
            ball.r /= 2;
          }
          Ball newBall = Ball.fromBall(ball);
          newBall.x = ball.x + ball.r * 2;


          var t = i/100;
          var p = ball.x;


          double result=
              (p *  (math.pow((1-t), 3)) + 3*p * t *(math.pow((1-t), 2)) + 3*p*t*t*(1-t) + p*t*t*t) ;

          while(result>1){
            result/=10;
          }

          if(result>0.5){
            result/=2;
          }



          newBall.aX = result;
          newBall.aY =result;
          newBall.vX = -newBall.vX;
          newBall.color = randomRGB();
          _balls.add(newBall);
        }
        ball.color = randomRGB();

      }


      //限定左边界
      if (ball.x-ball.r <= _limit.left) {
        ball.x = _limit.left+ball.r;
        ball.vX = - ball.vX;
        ball.vX += ball.aX;
//        ball.color = randomRGB();
      }

      //限定右边界
      if (ball.x+ball.r >= _limit.right) {
        ball.x = _limit.right-ball.r;
        ball.vX = - ball.vX;
        ball.vX += ball.aX;
//        ball.color = randomRGB();
      }



    }
  }

  Color randomRGB() {
    int red = math.Random().nextInt(255);
    int green = math.Random().nextInt(255);
    int blue =math. Random().nextInt(255);
    return Color.fromARGB(255, red, green, blue);
  }

  @override
  Widget build(BuildContext context) {
    _limit = Rect.fromLTRB(0, 0, MediaQuery.of(context).size.width,
        MediaQuery.of(context).size.height/4*3); //矩形边界

    return Scaffold(
      appBar: AppBar(
        title: Text("RandomBall"),
      ),
      body: Container(
        child: CustomPaint(
          painter: RunBallView(context, _balls, _limit),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

          if(controller.isAnimating){
            controller.stop(canceled: false);
          }else{
            controller.forward();
          }
        },
        child: Icon(Icons.play_circle_filled),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
