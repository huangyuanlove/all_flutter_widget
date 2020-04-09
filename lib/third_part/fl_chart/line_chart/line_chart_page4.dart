import 'package:flutter_widget/third_part/fl_chart/bar_chart/samples/bar_chart_sample4.dart';
import 'package:flutter_widget/third_part/fl_chart/bar_chart/samples/bar_chart_sample5.dart';
import 'package:flutter/material.dart';

import 'package:flutter_widget/third_part/fl_chart/bar_chart/samples/bar_chart_sample3.dart';

class LineChartPage4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff3f3f5),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: <Widget>[
          BarChartSample3(),
          const SizedBox(
            height: 18,
          ),
          BarChartSample4(),
          const SizedBox(
            height: 18,
          ),
          BarChartSample5(),
        ],
      ),
    );
  }
}
