import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class LineCharDemo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("fl_chart 0.7.0"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 140,
          child: Stack(
            alignment: AlignmentDirectional.topEnd,
            children: <Widget>[
              Column(
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 50,
                    height: 50,
                    child: Container(
                      color: Colors.limeAccent,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 50,
                    height: 60,
                    child: Container(
                      color: Colors.lightGreenAccent,
                    ),
                  )
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 140,
                child: LineChart(
                  sampleData1(),
                  swapAnimationDuration: const Duration(milliseconds: 250),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  LineChartData sampleData1() {
    return LineChartData(
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
        ),
        touchCallback: (LineTouchResponse touchResponse) {
          print(touchResponse);
        },
        handleBuiltInTouches: false,
      ),
      gridData: const FlGridData(show: true),
      titlesData: FlTitlesData(
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          textStyle: const TextStyle(
            color: Color(0xff72719b),
            fontWeight: FontWeight.normal,
            fontSize: 16,
          ),
          margin: 10,
          getTitles: (value) {
//            switch (value.toInt()) {
//              case 2:
//                return 'SEPT';
//              case 7:
//                return 'OCT';
//              case 12:
//                return 'DEC';
//            }
            return value.toInt().toString();
          },
        ),
        leftTitles: SideTitles(
          showTitles: true,
          textStyle: const TextStyle(
            color: Color(0xff75729e),
            fontWeight: FontWeight.normal,
            fontSize: 14,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '1m';
              case 2:
                return '2m';
              case 3:
                return '3m';
              case 4:
                return '4m';
            }
            return '';
          },
          margin: 8,
          reservedSize: 20,
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: const Border(
          bottom: BorderSide(
            color: Color(0xff4e4965),
            width: 1,
          ),
          left: BorderSide(
            color: Colors.transparent,
          ),
          right: BorderSide(
            color: Colors.transparent,
          ),
          top: BorderSide(
            color: Colors.transparent,
          ),
        ),
      ),
      minX: 1,
      maxX: 13,
      maxY: 4,
      minY: 1,
      lineBarsData: linesBarData1(),
    );
  }

  List<LineChartBarData> linesBarData1() {
    const LineChartBarData lineChartBarData1 = LineChartBarData(
      spots: [
        FlSpot(1, 1),
        FlSpot(2, 2),
        FlSpot(3, 1.5),
        FlSpot(4, 1.5),
        FlSpot(5, 1.4),
        FlSpot(6, 1.4),
        FlSpot(7, 3.4),
        FlSpot(8, 3.4),
        FlSpot(9, 3.4),
        FlSpot(10, 2),
        FlSpot(11, 2),
        FlSpot(12, 2.2),
        FlSpot(13, 1.8),
      ],
      isCurved: true,
      colors: [
        Color(0xff4af699),
      ],
      barWidth: 2,
      isStrokeCapRound: false,
      dotData: FlDotData(
        show: true,
      ),
      belowBarData: BarAreaData(
        show: false,
      ),
    );
    const LineChartBarData lineChartBarData2 = LineChartBarData(
      spots: [
        FlSpot(1, 1),
        FlSpot(3, 2.8),
        FlSpot(7, 1.2),
        FlSpot(10, 2.8),
        FlSpot(12, 2.6),
        FlSpot(13, 3.9),
      ],
      isCurved: true,
      colors: [
        Color(0xffaa4cfc),
      ],
      barWidth: 2,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: false,
      ),
      belowBarData: BarAreaData(show: false, colors: [
        Color(0x00aa4cfc),
      ]),
    );
    const LineChartBarData lineChartBarData3 = LineChartBarData(
      spots: [
        FlSpot(1, 2.8),
        FlSpot(3, 1.9),
        FlSpot(6, 3),
        FlSpot(10, 1.3),
        FlSpot(13, 2.5),
      ],
      isCurved: true,
      colors: [
        Color(0xff27b6fc),
      ],
      barWidth: 2,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: false,
      ),
      belowBarData: BarAreaData(
        show: false,
      ),
    );
    return [
      lineChartBarData1,
      lineChartBarData2,
      lineChartBarData3,
    ];
  }
}
