import 'package:flutter/material.dart';
import 'app_config.dart';
import 'home.dart';
class ChartPage extends StatefulWidget {
  ChartPage({Key key}) : super(key: key);

  @override
  ChartPageState createState() => new ChartPageState();
}

class ChartPageState extends State<ChartPage> {
  // Initialize app settings from the default configuration.
  bool _showPerformanceOverlay = defaultConfig.showPerformanceOverlay;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: defaultConfig.appName,
        theme: defaultConfig.theme,
        showPerformanceOverlay: _showPerformanceOverlay,
        home: new Home(
          showPerformanceOverlay: _showPerformanceOverlay,
          onShowPerformanceOverlayChanged: (bool value) {
            setState(() {
              _showPerformanceOverlay = value;
            });
          },
        ));
  }
}