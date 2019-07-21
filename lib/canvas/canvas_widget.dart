import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'dart:math';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
class CanvasWidget extends StatefulWidget {
  @override
  _CanvasWidgetState createState() => _CanvasWidgetState();
}

class _CanvasWidgetState extends State<CanvasWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("CanvasWidget"),),
      body: Container(
        child:CustomPaint(
            painter: DrawPainter()
        ),
      ),
    );
  }
}



class DrawPainter extends CustomPainter{

  Paint painter;
  DrawPainter (){
    //    Paint painter = Paint()
    //    ..color = Colors.blueAccent //画笔颜色
    //    ..strokeCap = StrokeCap.round //画笔笔触类型
    //    ..isAntiAlias = true //是否启动抗锯齿
    //    ..blendMode = BlendMode.exclusion //颜色混合模式
    //    ..style = PaintingStyle.fill //绘画风格，默认为填充
    //    ..colorFilter = ColorFilter.mode(Colors.blueAccent,BlendMode.exclusion) //颜色渲染模式，一般是矩阵效果来改变的,但是flutter中只能使用颜色混合模式
    //    ..maskFilter = MaskFilter.blur(BlurStyle.inner, 3.0) //模糊遮罩效果，flutter中只有这个
    //    ..filterQuality = FilterQuality.high //颜色渲染模式的质量
    //    ..strokeWidth = 15.0 ;//画笔的宽度

    painter = new Paint()
      ..color = Colors.blueAccent
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true
      ..strokeWidth = 5.0
      ..filterQuality = FilterQuality.high
      ..style = PaintingStyle.stroke;
  }


  @override
  void paint(Canvas canvas, Size size) {
    const List<Offset> points1 = [Offset(20.0, 0.0), Offset(100.0, 50.0), Offset(150.0, 0.0),Offset(300.0, 0.0)];
    const List<Offset> points2 = [Offset(20.0, 100.0), Offset(100.0, 100.0), Offset(150.0, 100.0), Offset(300.0, 100.0)];
    const List<Offset> points3 = [Offset(20.0, 150.0), Offset(100.0, 150.0), Offset(150.0, 180.0), Offset(300.0, 150.0)];
    //绘制点
    canvas.drawPoints(
      ///PointMode的枚举类型有三个，points（点），lines（线，隔点连接），polygon（线，相邻连接）
        PointMode.points,
        points1,
        painter..color = Colors.redAccent // 这里可以追加修改 painter 属性
          ..strokeWidth = 10.0
    );
    canvas.drawPoints(
      ///PointMode的枚举类型有三个，points（点），lines（线，隔点连接），polygon（线，相邻连接）
        PointMode.lines,
        points2,
        painter..color = Colors.orange // 这里可以追加修改 painter 属性
          ..strokeWidth = 10.0
    );
    canvas.drawPoints(
      ///PointMode的枚举类型有三个，points（点），lines（线，隔点连接），polygon（线，相邻连接）
        PointMode.polygon,
        points3,
        painter..color = Colors.blue // 这里可以追加修改 painter 属性
          ..strokeWidth = 10.0
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

}