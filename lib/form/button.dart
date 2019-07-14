import 'package:flutter/material.dart';
import 'dart:math';

class ButtonWidget extends StatefulWidget {
  @override
  _ButtonWidgetState createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  String buttonShapeType = 'border'; // 边框类型

  String dropdownButtonValue;

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
          FlatButton(
            onPressed: null,
            child: Text("被禁用的button"),
            disabledColor: Colors.blueGrey,
          ),
          FlatButton(
            onPressed: () {
              print("点击了Button");
            },
            child: Text("可点击的button"),
            color: Colors.tealAccent,
          ),
          FlatButton.icon(
            onPressed: () {
              print("点了了带有icon的FlatButton");
            },
            icon: Icon(Icons.print),
            label: Text("带有icon的FlatButton"),
          ),
          FlatButton(
              // 文本内容
              child: Text("自定义按钮", semanticsLabel: 'FLAT BUTTON 2'),
              // 按钮颜色
              color: Colors.lightGreenAccent,
              // 按钮亮度
              colorBrightness: Brightness.dark,
              // 高亮时的背景色
              //highlightColor: Colors.yellow,
              // 失效时的背景色
              disabledColor: Colors.grey,
              // 该按钮上的文字颜色，但是前提是不设置字体自身的颜色时才会起作用
              textColor: Colors.white,
              // 按钮失效时的文字颜色，同样的不能使用文本自己的样式或者颜色时才会起作用
              disabledTextColor: Colors.grey,
              // 按钮主题,主要用于与ButtonTheme和ButtonThemeData一起使用来定义按钮的基色,RaisedButton，FlatButton，OutlineButton，它们是基于环境ButtonTheme配置的
              //ButtonTextTheme.accent，使用模版颜色的;ButtonTextTheme.normal，按钮文本是黑色或白色取决于。ThemeData.brightness;ButtonTextTheme.primary，按钮文本基于。ThemeData.primaryColor.
              textTheme: ButtonTextTheme.normal,
              // 按钮内部,墨汁飞溅的颜色,点击按钮时的渐变背景色，当你不设置高亮背景时才会看的更清楚
              splashColor: Colors.deepPurple,
              // 抗锯齿能力,抗锯齿等级依次递增,none（默认),hardEdge,antiAliasWithSaveLayer,antiAlias
              clipBehavior: Clip.antiAlias,
              padding: EdgeInsets.only(
                  bottom: 5.0, top: 5.0, left: 30.0, right: 30.0),
              shape: Border.all(
                // 设置边框样式
                color: Colors.grey,
                width: 2.0,
                style: BorderStyle.solid,
              ),
              // FlatButton 的点击事件
              onPressed: () {
                // Perform some action
              },
              // 改变高亮颜色回掉函数，一个按钮会触发两次，按下后改变时触发一次，松手后恢复原始颜色触发一次
              // 参数 bool，按下后true，恢复false
              onHighlightChanged: (isClick) {
                print(isClick);
              }),
          RaisedButton(
            onPressed: () {
              print("点击了凸起按钮");
            },
            child: Text("RaisedButton"),
          ),
          RaisedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.print),
              label: Text("带有icon的RaisedButton")),
          RaisedButton(
              child: Text("自定义RaiseButton", semanticsLabel: 'FLAT BUTTON 2'),
              // 按钮颜色
              color: Colors.cyan,
              // 按钮亮度
              colorBrightness: Brightness.dark,
              // 高亮时的背景色
              //highlightColor: Colors.yellow,
              // 失效时的背景色
              disabledColor: Colors.grey,
              // 该按钮上的文字颜色，但是前提是不设置字体自身的颜色时才会起作用
              textColor: Colors.white,
              // 按钮失效时的文字颜色，同样的不能使用文本自己的样式或者颜色时才会起作用
              disabledTextColor: Colors.grey,
              // 按钮主题,主要用于与ButtonTheme和ButtonThemeData一起使用来定义按钮的基色,RaisedButton，RaisedButton，OutlineButton，它们是基于环境ButtonTheme配置的
              //ButtonTextTheme.accent，使用模版颜色的;ButtonTextTheme.normal，按钮文本是黑色或白色取决于。ThemeData.brightness;ButtonTextTheme.primary，按钮文本基于。ThemeData.primaryColor.
              textTheme: ButtonTextTheme.normal,
              // 按钮内部,墨汁飞溅的颜色,点击按钮时的渐变背景色，当你不设置高亮背景时才会看的更清楚
              splashColor: Colors.deepPurple,
              // 抗锯齿能力,抗锯齿等级依次递增,none（默认),hardEdge,antiAliasWithSaveLayer,antiAlias
              clipBehavior: Clip.antiAlias,
              padding: EdgeInsets.only(
                  bottom: 5.0, top: 5.0, left: 30.0, right: 30.0),
              shape: drawShape(buttonShapeType),
              // RaisedButton 的点击事件
              onPressed: () {
                // Perform some action
                setButtonShapeType();
              },
              // 改变高亮颜色回掉函数，一个按钮会触发两次，按下后改变时触发一次，松手后恢复原始颜色触发一次
              // 参数 bool，按下后true，恢复false
              onHighlightChanged: (isClick) {
                print(isClick);
              }),
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
          DropdownButton(
            hint: Text("请选择一个名字"),
            value: dropdownButtonValue,
            onChanged: (value) {
              print("选择了  $value");
              setState(() {
                dropdownButtonValue = value;
              });
            },
            items: buildDropdownItems(),
          ),
          OutlineButton(
              child: Text("默认OutlineButton"),
              onPressed: () {
                print("点击了OutlineButton");
              }),
          OutlineButton.icon(
              onPressed: () {},
              icon: Icon(Icons.android),
              label: Text("带有icon的OutlineButton")),
          OutlineButton(
            // 文本内容
              child: Text("自定义OutlineButton", semanticsLabel: 'FLAT BUTTON 2'),
              // 边框的颜色,颜色也可以走主题色 Theme.of(context).primaryColor
              borderSide: BorderSide(color: _randomColor(),width:Random.secure().nextInt(10).toDouble()),
              // 按钮颜色
              color: _randomColor(),
              // 按钮失效时边框颜色
              disabledBorderColor: Colors.red,
              highlightedBorderColor:Colors.black54,
              // 高亮时的背景色
              highlightColor: Colors.yellow,
              // 失效时的背景色
              //disabledColor: Colors.grey,
              // 该按钮上的文字颜色，但是前提是不设置字体自身的颜色时才会起作用
              textColor: _randomColor(),
              // 按钮失效时的文字颜色，同样的不能使用文本自己的样式或者颜色时才会起作用
              disabledTextColor: _randomColor(),
              // 按钮主题,主要用于与ButtonTheme和ButtonThemeData一起使用来定义按钮的基色,OutlineButton，OutlineButton，OutlineButton，它们是基于环境ButtonTheme配置的
              //ButtonTextTheme.accent，使用模版颜色的;ButtonTextTheme.normal，按钮文本是黑色或白色取决于。ThemeData.brightness;ButtonTextTheme.primary，按钮文本基于。ThemeData.primaryColor.
              textTheme: ButtonTextTheme.normal,
              // 按钮内部,墨汁飞溅的颜色,点击按钮时的渐变背景色，当你不设置高亮背景时才会看的更清楚
              splashColor: _randomColor(),
              // 抗锯齿能力,抗锯齿等级依次递增,none（默认),hardEdge,antiAliasWithSaveLayer,antiAlias
              clipBehavior: Clip.antiAlias,
              padding:  EdgeInsets.only(bottom: 5.0, top: 5.0, left: 30.0, right: 30.0),
              //高亮时候的阴影
              highlightElevation: 10.0,
              shape: drawShape(buttonShapeType), // 在Outline 里只能设置圆角,边框用borderSide
              // OutlineButton 的点击事件
              onPressed: () {
                // Perform some action
                print("点击了自定义的OutlineButton");
              }),
        ],
      ),
    );
  }

  List<DropdownMenuItem> buildDropdownItems() {
    List<DropdownMenuItem> items = [];
    final DropdownMenuItem item1 =
        DropdownMenuItem(value: '张三', child: Text('张三'));
    final DropdownMenuItem item2 =
        DropdownMenuItem(value: '李四', child: Text('李四'));
    final DropdownMenuItem item3 =
        DropdownMenuItem(value: '王二', child: Text('王二'));
    final DropdownMenuItem item4 =
        DropdownMenuItem(value: '麻子', child: Text('麻子'));
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
        break;
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
        break;
      default:
        return null;
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
