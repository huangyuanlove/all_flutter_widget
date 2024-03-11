import 'package:flutter/material.dart';
import 'dart:math';

class ButtonWidget extends StatefulWidget {
  @override
  _ButtonWidgetState createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  String buttonShapeType = 'border'; // 边框类型

  String dropdownButtonValue="";

  void setButtonShapeType() {
    String _buttonShapeType =
        (buttonShapeType == 'border') ? 'radius' : 'border';
    if (mounted) {
      this.setState(() {
        buttonShapeType = _buttonShapeType;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("button"),
      ),
      body: ListView(
        children: <Widget>[
          TextButton(
            onPressed: null,
            child: Text("被禁用的button"),
          ),
          TextButton(
            onPressed: () {
              print("点击了Button");
            },
            child: Text("可点击的button"),

          ),
          TextButton.icon(
            onPressed: () {
              print("点了了带有icon的FlatButton");
            },
            icon: Icon(Icons.print),
            label: Text("带有icon的FlatButton"),
          ),
          TextButton(
              // 文本内容
              child: Text("自定义按钮", semanticsLabel: 'FLAT BUTTON 2'),
              style: ButtonStyle(
                //定义样式，这里设置颜色不起作用
                textStyle: MaterialStateProperty.all(
                  TextStyle(fontSize: 18,color: Colors.red)
                ),
                padding:MaterialStateProperty.all(
                  EdgeInsets.only(
                      bottom: 5.0, top: 5.0, left: 30.0, right: 30.0),
                ),
                foregroundColor: MaterialStateProperty.resolveWith((states)  {
                  if(states.contains(MaterialState.pressed)){
                     return Colors.blue;
                  }
                  return Colors.grey;
                }),
                backgroundColor: MaterialStateProperty.resolveWith((states)  {
                  if(states.contains(MaterialState.pressed)){
                    return Colors.blue[200];
                  }
                  return null;
                }),
                overlayColor: MaterialStateProperty.all(Colors.yellow),
                side: MaterialStateProperty.all(BorderSide(color:Colors.grey,width: 1) ),
                shape:MaterialStateProperty.all(StadiumBorder())
              ),
            onPressed: () {  },
              ),
          ElevatedButton(
            onPressed: () {
              print("点击了凸起按钮");
            },
            child: Text("RaisedButton"),
          ),
          ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.print),
              label: Text("带有icon的RaisedButton")),
          ElevatedButton(
              onPressed: () {  },
              child: Text("自定义RaiseButton:同TextButton", semanticsLabel: 'FLAT BUTTON 2'),
              ),
          IconButton(
            icon: Icon(Icons.print),
            onPressed: () {
              print("电点击了IconButton");
            },
            tooltip: "长按弹出的信息",
          ),
          ListTile(
            title: const Text('弹出菜单'),
            trailing: PopupMenuButton<String>(
              padding: EdgeInsets.zero,
              onSelected: (value) {
                print("select value $value");
              },
              itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
                    PopupMenuItem<String>(
                        value: "value1",
                        child: const Text('Context menu item one')),
                    const PopupMenuItem<String>(
                        enabled: false, child: Text('A disabled menu item')),
                    PopupMenuItem<String>(
                        value: "value2",
                        child: const Text('Context menu item three')),
                  ],
            ),
          ),
          ButtonBar(
            children: <Widget>[
              FloatingActionButton(
                onPressed: () {
                  print("点击了FloatingActionButton");
                },
                heroTag: null,
                backgroundColor: Colors.red,
                child: const Icon(Icons.add),
              ),
              FloatingActionButton(
                  // 子视图，一般为Icon，不推荐使用文字
                  child: const Icon(Icons.refresh),
                  // FAB的文字解释，FAB被长按时显示，也是无障碍功能
                  tooltip: "弹出文字",
                  // 前景色
                  foregroundColor: Colors.white,
                  // 背景色
                  backgroundColor: Colors.deepOrangeAccent,
                  // hero效果使用的tag,系统默认会给所有FAB使用同一个tag,方便做动画效果,简单理解为两个界面内拥有同样tag的元素在界面切换过程中，会有动画效果，是界面切换不再那么生硬。
                  heroTag: null,
                  // 未点击时阴影值，默认6.0
                  elevation: 7.0,
                  // 点击时阴影值，默认12.0
                  highlightElevation: 14.0,
                  // 点击事件回调
                  onPressed: () {
                    print("点击了自定义FloatingActionButton");
                  },
                  // 是否为“mini”类型，默认为false,FAB 分为三种类型：regular, mini, and extended
                  mini: false,
                  // 定义FAB的shape，设置shape时，默认的elevation将会失效,默认为CircleBorder
                  //shape: CircleBorder(),
                  shape: drawShape(buttonShapeType),
                  // 是否为”extended”类型
                  isExtended: true),
            ],
          ),
          FloatingActionButton.extended(
            onPressed: () {
              print('button click');
            },
            foregroundColor: Colors.white,
            backgroundColor: Colors.amber,
            //如果不手动设置icon和text颜色,则默认使用foregroundColor颜色
            icon: Icon(Icons.flag, color: Colors.red),
            label: Text('FloatingActionButton.extended', maxLines: 1),
          ),
          RawMaterialButton(
              child: Text("默认RawMaterialButton"),
              onPressed: () {
                print("点击了RawMaterialButton");
              }),
          RawMaterialButton(
              // 使用Material.textStyle为按钮的子项定义默认文本样式。
              textStyle: TextStyle(color: _randomColor(), fontSize: 20),
              // 定义形状和高程的动画更改的持续时间
              animationDuration: Duration(seconds: 1),
              // 文本内容
              child:
                  Text("自定义RawMaterialButton", semanticsLabel: 'FLAT BUTTON 2'),
              // 高亮时的背景色
              highlightColor: Colors.yellow,
              // 按钮内部,墨汁飞溅的颜色,点击按钮时的渐变背景色，当你不设置高亮背景时才会看的更清楚
              splashColor: _randomColor(),
              // 抗锯齿能力,抗锯齿等级依次递增,none（默认),hardEdge,antiAliasWithSaveLayer,antiAlias
              clipBehavior: Clip.antiAlias,
              padding: EdgeInsets.only(
                  bottom: 5.0, top: 5.0, left: 30.0, right: 30.0),
              //高亮时候的阴影
              highlightElevation: 10.0,
              // 按钮材质的形状
              // shape: shape,
              // RawMaterialButton 的点击事件
              onPressed: () {
                // Perform some action
                print("点击了自定义RawMaterialButton");
              }),
          DropdownButton<String>(
            hint: Text("请选择一个名字"),
            value: dropdownButtonValue,
            onChanged: (value) {
              print("选择了  $value");
              setState(() {
                dropdownButtonValue = value??"选择为空";
              });
            },
            items: buildDropdownItems(),
          ),
          OutlinedButton(
              child: Text("默认OutlineButton"),
              onPressed: () {
                print("点击了OutlineButton");
              }),
          OutlinedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.android),
              label: Text("带有icon的OutlineButton")),
          OutlinedButton(
            // 文本内容
              child: Text("自定义OutlineButton", semanticsLabel: 'FLAT BUTTON 2'),
              // OutlineButton 的点击事件
              onPressed: () {
                // Perform some action
                print("点击了自定义的OutlineButton");
              }),
        ],
      ),
    );
  }

  List<DropdownMenuItem<String>> buildDropdownItems() {
    List<DropdownMenuItem<String>> items = [];
    final DropdownMenuItem<String> item1 =
        DropdownMenuItem<String>(value: '张三', child: Text('张三'));
    final DropdownMenuItem<String> item2 =
        DropdownMenuItem<String>(value: '李四', child: Text('李四'));
    final DropdownMenuItem<String> item3 =
        DropdownMenuItem<String>(value: '王二', child: Text('王二'));
    final DropdownMenuItem<String> item4 =
        DropdownMenuItem<String>(value: '麻子', child: Text('麻子'));
    items.add(item1);
    items.add(item2);
    items.add(item3);
    items.add(item4);
    return items;
  }

  // 绘制边框信息,比如是否有边框,是否是圆角
  ShapeBorder drawShape(String type) {
    final Color _color = _randomColor();
    final borderWidth = Random.secure().nextInt(5).toDouble();
    final radiusWidth = Random.secure().nextInt(50).toDouble();

    switch (type) {
      case 'border':
        return Border.all(
          // 设置边框样式
          width: borderWidth,
          color: _color,
          style: BorderStyle.solid,
        );
      case 'radius':
        return RoundedRectangleBorder(
          side: BorderSide(
            // 保留原来的边框样式
            width: borderWidth,
            color: _color,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(radiusWidth),
            topLeft: Radius.circular(radiusWidth),
            bottomLeft: Radius.circular(radiusWidth),
            bottomRight: Radius.circular(radiusWidth),
          ),
        );
      default:
        return   Border.all(
          // 设置边框样式
          width: borderWidth,
          color: _color,
          style: BorderStyle.solid,
        );;
    }
  }

  // 取随机颜色
  Color _randomColor() {
    var red = Random.secure().nextInt(255);
    var greed = Random.secure().nextInt(255);
    var blue = Random.secure().nextInt(255);
    return Color.fromARGB(255, red, greed, blue);
  }
}
