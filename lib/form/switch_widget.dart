import 'package:flutter/material.dart';

class SwitchWidget extends StatefulWidget {
  @override
  _SwitchWidgetState createState() => _SwitchWidgetState();
}

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

class _DefaultAnimatedSwitcherState extends State<DefaultAnimatedSwitcher> {
  int _count = 0;
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
            '$_count',
            // This key causes the AnimatedSwitcher to interpret this as a "new"
            // child each time the count changes, so that it will begin its animation
            // when the count changes.
            key: ValueKey<int>(_count),
            style: Theme.of(context).textTheme.display1,
          ),
        ),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return SizeTransition(child: child, sizeFactor: animation);
          },
          child: Text(
            '$_count',
            // This key causes the AnimatedSwitcher to interpret this as a "new"
            // child each time the count changes, so that it will begin its animation
            // when the count changes.
            key: ValueKey<int>(_count),
            style: Theme.of(context).textTheme.display1,
          ),
        ),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return RotationTransition(child: child, turns: animation);
          },
          child: Text(
            '$_count',
            // This key causes the AnimatedSwitcher to interpret this as a "new"
            // child each time the count changes, so that it will begin its animation
            // when the count changes.
            key: ValueKey<int>(_count),
            style: Theme.of(context).textTheme.display1,
          ),
        ),
        RaisedButton(
          child: const Text('Increment'),
          onPressed: () {
            setState(() {
              _count += 1;
            });
          },
        ),
      ],
    );
  }
}


