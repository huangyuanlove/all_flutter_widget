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
          },
          "Canvas": (BuildContext context) {
            return CanvasWidget();
          },
          "ListView": (BuildContext context) {
            return ListViewWidget();
          },
          "ListBody": (BuildContext context) {
            return ListBodyWidget();
          },
          "AnimatedList": (BuildContext context) {
            return AnimatedListViewWidget();
          },
          "AppBar": (BuildContext context) {
            return AppBarWidget();
          },
          "SnackBar": (BuildContext context) {
            return AppBarWidget();
          },
          "SnackBarAction": (BuildContext context) {
            return AppBarWidget();
          },
          "SliverAppBar": (BuildContext context) {
            return SliverAppbarWidget();
          },
          "FlexbleSpaceBar": (BuildContext context) {
            return SliverAppbarWidget();
          },
          "AlertDialog": (BuildContext context) {
            return DialogWidget();
          },
          "Dialog": (BuildContext context) {
            return DialogWidget();
          },
          "AboutDialog": (BuildContext context) {
            return DialogWidget();
          },
          "SimpleDialog": (BuildContext context) {
            return DialogWidget();
          },
          "GridTile": (BuildContext context) {
            return GridTileWidget();
          },
          "GridView": (BuildContext context) {
            return GridViewWidget();
          },
          "GridPaper": (BuildContext context) {
            return GridTileWidget();
          },
          "GridTileBar": (BuildContext context) {
            return GridTileWidget();
          },
          "SliverGrid": (BuildContext context) {
            return SliverGridWidget();
          },
          "ScrollMetrics": (BuildContext context) {
            return ScrollMetricsWidget();
          },
          "ScrollPhysics": (BuildContext context) {
            return ScrollPhysicsWidget();
          },
          "CheckedPopupMenuItem": (BuildContext context) {
            return SomeMenuWidget();
          },
          "DropdownMenuItem": (BuildContext context) {
            return SomeMenuWidget();
          },
          "PopupMenuButton": (BuildContext context) {
            return SomeMenuWidget();
          },
          "PopupMenuDivider": (BuildContext context) {
            return SomeMenuWidget();
          },
          "PopupMenuEntry": (BuildContext context) {
            return SomeMenuWidget();
          },
          "PopupMenuItem": (BuildContext context) {
            return SomeMenuWidget();
          },
          "DayPicker": (BuildContext context) {
            return SomePickWidget();
          },
          "MonthPicker": (BuildContext context) {
            return SomePickWidget();
          },
          "YearPicker": (BuildContext context) {
            return SomePickWidget();
          },
          "ShowdatePicker": (BuildContext context) {
            return SomePickWidget();
          },
          "Chip": (BuildContext context) {
            return SomeChipWidget();
          },
          "ChipTheme": (BuildContext context) {
            return SomeChipWidget();
          },
          "ChipThemeData": (BuildContext context) {
            return SomeChipWidget();
          },
          "ChoiceChip": (BuildContext context) {
            return SomeChipWidget();
          },
          "FilterChip": (BuildContext context) {
            return SomeChipWidget();
          },
          "InputChip": (BuildContext context) {
            return SomeChipWidget();
          },
          "RawChip": (BuildContext context) {
            return SomeChipWidget();
          },
          "LinearProgressIndicator": (BuildContext context) {
            return SomeProgressWidget();
          },
          "CircularProgressIndicator": (BuildContext context) {
            return SomeProgressWidget();
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
