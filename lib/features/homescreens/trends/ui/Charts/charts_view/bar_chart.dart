import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:well_path/features/homescreens/trends/network/response/bp_trends_bar_graph_response.dart';

class BarChartContent extends StatelessWidget {
  BarChartContent({super.key, required this.bpTrendsBarChartData});
  double barWidth = 30;
  List<BPTrendsBarChartListItem> bpTrendsBarChartData;

  List<BarChartGroupData> barChartGroupData = [];
  @override
  Widget build(BuildContext context) {
    return BarChart(BarChartData(
      titlesData: titlesData,
      borderData: borderData,
      gridData: FlGridData(show: false),
      alignment: BarChartAlignment.spaceEvenly,
      maxY: 100,
      barGroups: getBarsData(), // barChartGroupData,
      barTouchData: getBarTouchData(context),
    ));
  }

  FlTitlesData get titlesData => FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: bottomTitles,
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: leftTitles,
        ),
      );

  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 20,
        getTitlesWidget: getBottomTitles,
      );

  SideTitles get leftTitles => SideTitles(
      showTitles: true,
      reservedSize: 30,
      interval: 20,
      getTitlesWidget: getLeftTitles);

  FlBorderData get borderData => FlBorderData(
        show: true,
        border: const Border(
          bottom: BorderSide(color: Color(0xffD0D0D0), width: 1),
          left: BorderSide(color: Color(0xffD0D0D0), width: 1),
          right: BorderSide(color: Colors.transparent),
          top: BorderSide(color: Colors.transparent),
        ),
      );

  Widget getBottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xffA9A9A9),
      fontWeight: FontWeight.w400,
      fontSize: 10,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('Hypotension', style: style);
        break;
      case 1:
        text = const Text('Normal', style: style);
        break;
      case 2:
        text = const Text('Stage 1', style: style);
        break;
      case 3:
        text = const Text('Stage 2', style: style);
        break;
      case 4:
        text = const Text('Hyper Crisis', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 0,
      child: text,
    );
  }

  Widget getLeftTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xffA9A9A9),
      fontWeight: FontWeight.w400,
      fontSize: 10,
    );
    Widget text;
    text = Text(value.toInt().toString(), style: style);

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: text,
      ),
    );
  }

  BarTouchData getBarTouchData(BuildContext context) {
    return BarTouchData(
      touchCallback: (FlTouchEvent event, barTouchResponse) {
        if (event is FlTapDownEvent && barTouchResponse?.spot != null) {
          final index = barTouchResponse!.spot!.touchedBarGroup.x;
          final bpCategorydetail = bpTrendsBarChartData.elementAt(index);
          Navigator.of(context)
              .pushNamed('/detail', arguments: bpCategorydetail);
        }
      },
    );
  }

  List<BarChartGroupData> getBarsData() {
    bpTrendsBarChartData.asMap().forEach((index, barItem) {
      if (index != 5) {
        barChartGroupData.add(BarChartGroupData(x: index, barRods: [
          BarChartRodData(
            toY: barItem.percentage,
            color: barItem.categoryBP.barColor, // const Color(0xffC9EAFF),
            width: barWidth,
            borderRadius: BorderRadius.zero,
          ),
        ]));
      }
      ;
    });
    return barChartGroupData;
    //  [
    //   BarChartGroupData(x: 1, barRods: [
    //     BarChartRodData(
    //       toY: 90,
    //       color: const Color(0xffC9EAFF),
    //       width: barWidth,
    //       borderRadius: BorderRadius.zero,
    //     ),
    //   ]),
    //   BarChartGroupData(x: 2, barRods: [
    //     BarChartRodData(
    //         toY: 70,
    //         color: const Color(0xffCAFFE9),
    //         width: barWidth,
    //         borderRadius: BorderRadius.zero),
    //   ]),
    //   BarChartGroupData(x: 3, barRods: [
    //     BarChartRodData(
    //         toY: 83,
    //         color: const Color(0xffF7FFC9),
    //         width: barWidth,
    //         borderRadius: BorderRadius.zero),
    //   ]),
    //   BarChartGroupData(x: 4, barRods: [
    //     BarChartRodData(
    //         toY: 40,
    //         color: const Color(0xffFFE3C9),
    //         width: barWidth,
    //         borderRadius: BorderRadius.zero),
    //   ]),
    //   BarChartGroupData(x: 5, barRods: [
    //     BarChartRodData(
    //         toY: 22,
    //         color: const Color(0xffFFC9C9),
    //         width: barWidth,
    //         borderRadius: BorderRadius.zero),
    //   ]),
    // ];
  }
}
