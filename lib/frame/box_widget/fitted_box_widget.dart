import 'package:flutter/material.dart';

class FittedBoxWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FittedBoxWidget"),
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                //外部有位置约束，内部大小设定失效，保持和外部约束一致
                height: 100.0,
                width: 100.0,
                color: Color(0xfff8bbd0),
                child: FittedBox(
                  fit: BoxFit.contain,
                  // 修改child写入布局时期分配的空间
                  alignment: Alignment.center,
                  //alignment修改child于父空间对齐方式，默认：Alignment.center,
                  child: Container(
                    color: Color(0xfff48fb1),
                    child: Text(
                      'fittedBox',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              Container(
                //外部有位置约束，内部大小设定失效，保持和外部约束一致
                height: 100.0,
                width: 100.0,
                color: Color(0xfff8bbd0),
                child: FittedBox(
                  fit: BoxFit.fill,
                  // 修改child写入布局时期分配的空间
                  alignment: Alignment.center,
                  //alignment修改child于父空间对齐方式，默认：Alignment.center,
                  child: Container(
                    color: Color(0xfff48fb1),
                    child: Text(
                      'fittedBox',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              Container(
                //外部有位置约束，内部大小设定失效，保持和外部约束一致
                height: 100.0,
                width: 100.0,
                color: Color(0xfff8bbd0),
                child: FittedBox(
                  fit: BoxFit.cover,
                  // 修改child写入布局时期分配的空间
                  alignment: Alignment.center,
                  //alignment修改child于父空间对齐方式，默认：Alignment.center,
                  child: Container(
                    color: Color(0xfff48fb1),
                    child: Text(
                      'fittedBox',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                //外部有位置约束，内部大小设定失效，保持和外部约束一致
                height: 100.0,
                width: 100.0,
                color: Color(0xfff8bbd0),
                child: FittedBox(
                  fit: BoxFit.fitHeight,
                  // 修改child写入布局时期分配的空间
                  alignment: Alignment.center,
                  //alignment修改child于父空间对齐方式，默认：Alignment.center,
                  child: Container(
                    color: Color(0xfff48fb1),
                    child: Text(
                      'fittedBox',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              Container(
                //外部有位置约束，内部大小设定失效，保持和外部约束一致
                height: 100.0,
                width: 100.0,
                color: Color(0xfff8bbd0),
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  // 修改child写入布局时期分配的空间
                  alignment: Alignment.center,
                  //alignment修改child于父空间对齐方式，默认：Alignment.center,
                  child: Container(
                    color: Color(0xfff48fb1),
                    child: Text(
                      'fittedBox',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              Container(
                //外部有位置约束，内部大小设定失效，保持和外部约束一致
                height: 100.0,
                width: 100.0,
                color: Color(0xfff8bbd0),
                child: FittedBox(
                  fit: BoxFit.none,
                  // 修改child写入布局时期分配的空间
                  alignment: Alignment.center,
                  //alignment修改child于父空间对齐方式，默认：Alignment.center,
                  child: Container(
                    color: Color(0xfff48fb1),
                    child: Text(
                      'fittedBox',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                //外部有位置约束，内部大小设定失效，保持和外部约束一致
                height: 100.0,
                width: 100.0,
                color: Color(0xfff8bbd0),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  // 修改child写入布局时期分配的空间
                  alignment: Alignment.center,
                  //alignment修改child于父空间对齐方式，默认：Alignment.center,
                  child: Container(
                    color: Color(0xfff48fb1),
                    child: Text(
                      'fittedBox',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
