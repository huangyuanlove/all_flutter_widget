import 'package:flutter/material.dart';
import 'bar_chart/bar_chart_page.dart';
import 'bar_chart/bar_chart_page2.dart';
import 'line_chart/line_chart_page.dart';
import 'line_chart/line_chart_page2.dart';
import 'line_chart/line_chart_page3.dart';
import 'line_chart/line_chart_page4.dart';
import 'pie_chart/pie_chart_page.dart';
import 'scatter_chart/scatter_chart_page.dart';

class FLChart extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return PageView(
      children: <Widget>[
        LineChartPage(),
        BarChartPage(),
        BarChartPage2(),
        PieChartPage(),
        LineChartPage2(),
        LineChartPage3(),
        LineChartPage4(),
        ScatterChartPage(),
      ],
    );
  }

}