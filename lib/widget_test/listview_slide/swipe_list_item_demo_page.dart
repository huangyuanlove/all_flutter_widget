import 'package:flutter/material.dart';

class SwipeListItemDemoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _SwipeListItemDemoPagePageState();
}

class _SwipeListItemDemoPagePageState extends State<SwipeListItemDemoPage> {
  final items = List<String>.generate(10, (i) => "Item $i");

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('SwipeListItem Demo'),
      ),
      body: new ListView(
        children: ListTile.divideTiles(
          context: context,
          tiles: new List.generate(10, (index) {
            final item = items[index];
            return Builder(
              builder: (ctx) => _buildSlideMenuItem(ctx, index, item),
            );
          }),
        ).toList(),
      ),
    );
  }

  Widget _buildSlideMenuItem(BuildContext context, index, item) {
    return new SlideMenu(
      child: new ListTile(
        leading: new CircleAvatar(
          backgroundColor: Colors.indigoAccent,
          child: new Text('$index'),
          foregroundColor: Colors.white,
        ),
        title: new Text('Tile No. $index'),
        subtitle: new Text('http://www.appblog.cn'),
      ),
      menuItems: <Widget>[
        new Container(
          color: Colors.red,
          child: new IconButton(
            icon: new Icon(Icons.delete),
            color: Colors.white,
            onPressed: () => Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text("$item Delete"))),
          ),
        ),
        new Container(
          color: Colors.blue,
          child: new IconButton(
            icon: new Icon(Icons.info),
            color: Colors.white,
            onPressed: () => Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text("$item Info"))),
          ),
        ),
      ],
    );
  }
}

class SlideMenu extends StatefulWidget {
  final Widget child;
  final List<Widget> menuItems;

  SlideMenu({required this.child, required this.menuItems});

  @override
  _SlideMenuState createState() => new _SlideMenuState();
}

class _SlideMenuState extends State<SlideMenu>
    with SingleTickerProviderStateMixin {
late  AnimationController _controller;

  @override
  initState() {
    super.initState();
    _controller = new AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final animation = new Tween(
            begin: const Offset(0.0, 0.0), end: const Offset(-0.4, 0.0))
        .animate(new CurveTween(curve: Curves.linear).animate(_controller));
    return new GestureDetector(
      onHorizontalDragUpdate: (data) {
        // we can access context.size here
        setState(() {
          double width = 1;
          if(context.size!=null){
            width = context.size!.width;
          }
          _controller.value -= data.primaryDelta??0 / width;
        });
      },
      onHorizontalDragEnd: (data) {

        print("速度:${data.primaryVelocity}, value:${_controller.value}" );


        if (data.primaryVelocity! > 500 )
          _controller
              .animateTo(.0); //close menu on fast swipe in the right direction
        else if (_controller.value >= .2 ||
            data.primaryVelocity! < -500) // fully open if dragged a lot to left or on fast swipe to left
          _controller.animateTo(1.0);
        else // close if none of above
          _controller.animateTo(.0);
      },
      child: new Stack(
        children: <Widget>[
          new SlideTransition(position: animation, child: widget.child),
          new Positioned.fill(
            child: new LayoutBuilder(
              builder: (context, constraint) {
                return new AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return new Stack(
                      children: <Widget>[
                        new Positioned(
                          right: .0,
                          top: .0,
                          bottom: .0,
                          width: constraint.maxWidth * animation.value.dx * -1,
                          child: Row(
                            children: widget.menuItems.map((child) {
                              return Expanded(
                                child: Container(
                                  height: double.infinity,
                                  child: child,
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
