import 'package:fconsole/fconsole.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widget/logger.dart';
import 'package:flutter_widget/simple_widget/chip/some_tool_tip_widget.dart';
import 'package:flutter_widget/simple_widget/list_view/use_scrollable.dart';
import 'package:flutter_widget/complex_widget/complex_widget_home.dart';
import 'simple_widget/simple_widget_home.dart';
import 'simple_widget/list_view/fix_header_listview.dart';
import 'simple_widget/list_view/use_custom_scroll_view.dart';
import 'third_part/third_part_home.dart';
import 'simple_widget/all_widget_in_project.dart';

void main() {
//  debugPaintSizeEnabled = true;

  runAppWithFConsole(
      ProviderScope(
        observers: [RiverpodLogger()],
        child: MyApp(),
      ), beforeRun: () async {
    WidgetsFlutterBinding.ensureInitialized();
    // Do some init before runApp
  });

  // runAppWithFConsole(MyApp(), beforeRun: () async {
  //   WidgetsFlutterBinding.ensureInitialized();
  // });

  // runApp(SizedBox(width: 100,height: 200,child: ColoredBox(color: Colors.black12,),));

  // FlutterError.onError = (FlutterErrorDetails details) async {
  //   Zone.current.handleUncaughtError(details.exception, details.stack);
  // };

  // runZoned<Future<Null>>(() async {
  //   runApp(MyApp());
  // }, onError: (error, stackTrace) async {
  //   //在这里处理异常
  //   print("-------");
  //   print(error);
  //   print(stackTrace);
  //   print("-------");
  // });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ErrorWidget.builder = (FlutterErrorDetails flutterErrorDetails) {
      return Scaffold(
        body: Center(
          child: Text("${flutterErrorDetails.exception}"),
        ),
      );
    };

    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeWidget(),
        routes: {
          "Checkbox": (BuildContext context) {
            return CheckBoxWidget();
          },
          "Box": (BuildContext context) {
            return BoxWidget();
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
          "UseCustomScrollView": (BuildContext context) {
            return UseCustomScrollView();
          },
          "UseScrollable": (BuildContext context) {
            return UseScrollable();
          },
          "FixHeaderListView": (BuildContext context) {
            return FixHeaderListView();
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
          "SomeToolTip": (BuildContext context) {
            return SomeToolTipWidget();
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
          "FutureBuild": (BuildContext context) {
            return FutureBuildWidget();
          },
          "Animation": (BuildContext context) {
            return AnimationPageWidget();
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
    _myTabs
        .add(BottomNavigationBarItem(icon: Icon(Icons.widgets), label: "基础控件"));
    _myTabs
        .add(BottomNavigationBarItem(icon: Icon(Icons.build), label: "复杂控件"));
    _myTabs
        .add(BottomNavigationBarItem(icon: Icon(Icons.all_out), label: "三方库"));

    bodyChildren.add(SimpleWidgetHome());
    bodyChildren.add(ComplexWidgetHome());
    bodyChildren.add(ThirdPartHome());
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
