import 'package:flutter/material.dart';

class BallWidget extends StatefulWidget {
  @override
  _BallWidgetState createState() => _BallWidgetState();
}

class _BallWidgetState extends State<BallWidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Ball {
  //加速度
  double aX;
  double aY;

  //速度
  double vX;
  double vY;

  //坐标
  double x;
  double y;

  //颜色
  Color color;

  //半径
  double r;

  Ball(
      {this.x, this.y, this.color, this.r, this.aX, this.aY, this.vX, this.vY});

  //复制一个小球
  Ball.fromBall(Ball ball) {
    this.x = ball.x;
    this.y = ball.y;
    this.color = ball.color;
    this.r = ball.r;
    this.aX = ball.aX;
    this.aY = ball.aY;
    this.vX = ball.vX;
    this.vY = ball.vY;
  }
}

class RunBallView extends CustomPainter {
  Paint mPaint;
  BuildContext context;
  List<Ball> _balls;
  Rect _limit;

  RunBallView(this.context, List<Ball> balls, Rect limit) {
    mPaint = new Paint();
    _balls = balls;
    _limit = limit;
  }

  @override
  void paint(Canvas canvas, Size size) {
    mPaint.color = Color.fromARGB(148, 198, 246, 248);

    canvas.drawRect(_limit, mPaint);
    canvas.save();
    _balls.forEach((Ball ball) {
      mPaint.color = ball.color;
      canvas.drawCircle(Offset(ball.x, ball.y), ball.r, mPaint);
    });

    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
