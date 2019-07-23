import 'package:flutter/material.dart';

class ProgressCircle extends StatefulWidget {
  @override
  _ProgressCircleState createState() => _ProgressCircleState();
}

class _ProgressCircleState extends State<ProgressCircle> with SingleTickerProviderStateMixin{
  Animation<double> _doubleAnimation;
  AnimationController _controller;
  CurvedAnimation curvedAnimation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this,duration: Duration(seconds: 3));
    curvedAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.decelerate);
    _doubleAnimation = Tween(begin: 0.0, end: 360.0).animate(_controller);

    _controller.addListener(() {
      if(mounted){
        this.setState(() {});
      }
    });
    onAnimationStart();
  }

  void onAnimationStart() {
    _controller.forward(from: 0.0);
  }

  @override
  void reassemble() {
    super.reassemble();
    onAnimationStart();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ProgressCircle"),
      ),

      body: Container(
        width: 100,
        height: 100,
        margin: EdgeInsets.all(10),
        child: CustomPaint(
          child: Center(
            child: Text((_doubleAnimation.value/3.6).ceil().toString()),
          ),
          painter: CircleProgressPainter(_doubleAnimation.value),
        ),
      ),
    );
  }
}


class CircleProgressPainter extends CustomPainter{

  var progress;
  Paint _paintBackground;
  Paint _paintFore;

  CircleProgressPainter(this.progress){
    _paintBackground = Paint()
      ..color = Colors.grey
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10.0
      ..isAntiAlias = true;
    _paintFore = Paint()
      ..color = Colors.red
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10.0
      ..isAntiAlias = true;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), size.width / 2,_paintBackground);
    Rect rect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: size.width / 2,
    );
    canvas.drawArc(rect, 0.0, progress * 3.14 / 180, false, _paintFore);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

}
