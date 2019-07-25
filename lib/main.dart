import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'all_widget.dart';
import 'third_part.dart';
import 'package:flutter_widget/widget_test/main.dart';
import 'all_widget_in_project.dart';

void main() {
//  debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeWidget(),
        routes: {
          "Checkbox": (BuildContext context) {
            return CheckBoxWidget();
          },
          "Button": (BuildContext context) {
            return ButtonWidget();
          },
          "Slider": (BuildContext context) {
            return SliderWidget();
          },
          "Switch": (BuildContext context) {
            return SwitchWidget();
          },
          "Row": (BuildContext context) {
            return AlignFrame();
          },
          "Column": (BuildContext context) {
            return AlignFrame();
          },
          "FutureBuild": (BuildContext context) {
            return FutureBuildWidget();
          },
          "Stack": (BuildContext context) {
            return StackWidget();
          },
          "Layout": (BuildContext context) {
            return ContainerAndCenter();
          },
          "Expanded": (BuildContext context) {
            return ExpandedWidget();
          },
          "Spacing": (BuildContext context) {
            return SpacingWidget();
          },
          "Table": (BuildContext context) {
            return TableWidget();
          },"Canvas": (BuildContext context) {
            return CanvasWidget();
          },"ListView": (BuildContext context) {
            return ListWidget();
          },
        });
  }
}

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  final List<BottomNavigationBarItem> _myTabs = [];
  int currentIndex = 0;
  final List<Widget> bodyChildren = [];

  @override
  void initState() {
    super.initState();
    _myTabs.add(
        BottomNavigationBarItem(icon: Icon(Icons.widgets), title: Text("控件")));
    _myTabs.add(
        BottomNavigationBarItem(icon: Icon(Icons.build), title: Text("Test")));
    _myTabs.add(
        BottomNavigationBarItem(icon: Icon(Icons.all_out), title: Text("三方库")));

    bodyChildren.add(AllWidget());
    bodyChildren.add(AppTestWidget());
    bodyChildren.add(ThirdPart());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: bodyChildren,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _myTabs,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
