import 'dart:async';

import 'package:flutter/material.dart';

class SwitchWidget extends StatefulWidget {
  @override
  _SwitchWidgetState createState() => _SwitchWidgetState();
}

final List<String> values = ["人之初，性本善。性相近，习相远。",

  "苟不教，性乃迁。教之道，贵以专。",

"昔孟母，择邻处。子不学，断机杼。",

"窦燕山，有义方。教五子，名俱扬。",

"养不教，父之过。教不严，师之惰。",

"子不学，非所宜。幼不学，老何为。",

"玉不琢，不成器。人不学，不知义。",

"为人子，方少时。亲师友，习礼仪。",

"香九龄，能温席。孝于亲，所当执。",

"融四岁，能让梨。弟于长，宜先知。",

"首孝悌，次见闻。知某数，识某文。",

"一而十，十而百。百而千，千而万。",

"三才者，天地人。三光者，日月星。",

"三纲者，君臣义。父子亲，夫妇顺。",

"曰春夏，曰秋冬。此四时，运不穷。",

"曰南北，曰西东。此四方，应乎中。",

"曰水火，木金土。此五行，本乎数。",

"十干者，甲至癸。十二支，子至亥。",

"曰黄道，日所躔。曰赤道，当中权。",

"赤道下，温暖极。我中华，在东北。",

"曰江河，曰淮济。此四渎，水之纪。",

"曰岱华，嵩恒衡。此五岳，山之名。",

"曰士农，曰工商。此四民，国之良。",

"曰仁义，礼智信。此五常，不容紊。",

"地所生，有草木。此植物，遍水陆。",

"有虫鱼，有鸟兽。此动物，能飞走。",

"稻粱菽，麦黍稷。此六谷，人所食。",

"马牛羊，鸡犬豕。此六畜，人所饲。"];


class _SwitchWidgetState extends State<SwitchWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("_SwitchWidgetState"),
      ),
      body: Column(
        children: <Widget>[
          DefaultSwitch(),
          CustomSwitch(),
          DefaultSwitchListTile(),
          DefaultAnimatedSwitcher(),
        ],
      ),
    );
  }
}

class DefaultSwitch extends StatefulWidget {
  @override
  _DefaultSwitchState createState() => _DefaultSwitchState();
}

class _DefaultSwitchState extends State<DefaultSwitch> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Switch(
        value: isOpen,
        onChanged: (value) {
          print("DefaultSwitch value $value");
          setState(() {
            isOpen = value;
          });
        });
  }
}

class CustomSwitch extends StatefulWidget {
  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Switch(
        value: isOpen,
        activeColor: Colors.blue,
        activeTrackColor: Colors.pink,
        inactiveThumbColor: Colors.black,
        inactiveTrackColor: Colors.green,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        onChanged: (value) {
          setState(() {
            isOpen = value;
          });
        });
  }
}

class DefaultSwitchListTile extends StatefulWidget {
  @override
  _DefaultSwitchListTileState createState() => _DefaultSwitchListTileState();
}

class _DefaultSwitchListTileState extends State<DefaultSwitchListTile> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
        value: isOpen,
        title: Text("title"),
        subtitle:Text("subtitle"),
        secondary:Icon(Icons.security),
        onChanged: (value) {
          setState(() {
            isOpen = value;
          });
        });
  }
}


class DefaultAnimatedSwitcher extends StatefulWidget {
  @override
  _DefaultAnimatedSwitcherState createState() => _DefaultAnimatedSwitcherState();
}

class _DefaultAnimatedSwitcherState extends State<DefaultAnimatedSwitcher> with SingleTickerProviderStateMixin{
  int _count = 0;


 late AnimationController slideAnimationController;
 @override
  void initState() {
    slideAnimationController= AnimationController(vsync: this,duration: Duration(seconds: 1));
    slideAnimationController.addStatusListener((status) {
      print ("当前状态  $status");
      if(status == AnimationStatus.completed){
        slideAnimationController.reset();
        setState(() {
          _count += 1;
        });
      }
    });
    Timer timer =  Timer.periodic(Duration(seconds: 2), (timer) {

      slideAnimationController.forward();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return ScaleTransition(child: child, scale: animation);
          },
          child: Text(
            values[_count % values.length],
            // This key causes the AnimatedSwitcher to interpret this as a "new"
            // child each time the count changes, so that it will begin its animation
            // when the count changes.
            key: ValueKey<int>(_count),
              style: TextStyle(color: Colors.redAccent,fontSize: 20)
          ),
        ),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return SizeTransition(child: child, sizeFactor: animation);
          },
          child: Text(
            values[_count % values.length],
            // This key causes the AnimatedSwitcher to interpret this as a "new"
            // child each time the count changes, so that it will begin its animation
            // when the count changes.
            key: ValueKey<int>(_count),
            style: TextStyle(color: Colors.blue,fontSize: 20)
          ),
        ),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return RotationTransition(child: child, turns: animation);
          },
          child: Text(
            values[_count % values.length ],
            // This key causes the AnimatedSwitcher to interpret this as a "new"
            // child each time the count changes, so that it will begin its animation
            // when the count changes.
            key: ValueKey<int>(_count),
            style: TextStyle(color: Colors.green,fontSize: 20)
          ),
        ),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return SlideTransition(position: Tween<Offset>(
              begin:Offset(0,0),
              end: Offset(0,-1)
            ).animate(slideAnimationController),
            child: Text(
                values[_count % values.length ],
                // This key causes the AnimatedSwitcher to interpret this as a "new"
                // child each time the count changes, so that it will begin its animation
                // when the count changes.
                key: ValueKey<int>(_count),
                style: TextStyle(color: Colors.orange,fontSize: 20)
            ),
            );

          },
          child: Text(
              values[_count % values.length],
              // This key causes the AnimatedSwitcher to interpret this as a "new"
              // child each time the count changes, so that it will begin its animation
              // when the count changes.
              key: ValueKey<int>(_count),
              style: TextStyle(color: Colors.green,fontSize: 20)
          ),
        ),
        ElevatedButton(
          child: const Text('Increment'),
          onPressed: () {
            slideAnimationController.reset();
            slideAnimationController.forward();
            setState(() {
              _count += 1;
            });
          },
        ),
      ],
    );
  }
}


