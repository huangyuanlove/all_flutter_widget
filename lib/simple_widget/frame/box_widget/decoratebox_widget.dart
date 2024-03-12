import 'package:flutter/material.dart';

class DecorateBoxWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DecorateBoxWidget"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 100.0,
            width: 100.0,
            child: DecoratedBox(
              position: DecorationPosition.background,
              decoration: BoxDecoration(
                color: const Color(0xff7c94b6),
                //设置图片内容
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: ExactAssetImage('assets/image/food/food01.jpeg')),
                //外宽边框，可以不设置
                border: Border.all(
                  color: Colors.blue.shade50,
                  width: 10.0,
                ),
              ),
            ),
          ),
          Container(
            height: 100.0,
            width: 100.0,
            child: DecoratedBox(
              position: DecorationPosition.background,
              decoration: BoxDecoration(
                color: const Color(0xff7c94b6),
                //设置图片内容
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: ExactAssetImage('assets/image/food/food01.jpeg')),
                //根据传入的不同大小，呈现图片效弧度不同，
                borderRadius: BorderRadius.circular(90.0),
              ),
            ),
          ),
          Container(
              height: 100.0,
              width: 100.0,
              child: DecoratedBox(
                position: DecorationPosition.background,
                decoration: BoxDecoration(
                  color: const Color(0xff7c94b6),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: ExactAssetImage('assets/image/food/food01.jpeg')),
                  border: Border.all(
                    color: Colors.blue.shade50,
                    width: 5.0,
                  ),
                  shape: BoxShape.circle,
                ),
              )),
        ],
      ),
    );
  }
}
