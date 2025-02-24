import 'package:collection/collection.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:well_path/colors/colors.dart';
import 'package:well_path/features/homescreens/trends/network/response/bp_trends_line_graph_domain_model.dart';
import 'package:well_path/features/homescreens/trends/ui/bp_trends/bp_trends_view.dart';
import 'package:well_path/helper/helpers.dart';

import '../charts_data/line_chart_data.dart';

List<FlSpot> systolicSpots = [];
List<FlSpot> diastolicSpots = [];

// List<String> labels = [];
List<VerticalRangeAnnotation> verticalRangeAnnotationData = [];

class LineChartContent extends StatelessWidget {
  LineChartContent(
      {super.key,
      required this.bpTrendsData,
      required this.selectedTimePeriod,
      required this.filteredData});

  List<BPTrendLineGraphUiModel> bpTrendsData;
  TimePeriod selectedTimePeriod;
  Map<DateTime, List<BPTrendLineGraphUiModel>> filteredData;
  List<String> weekDays = const [
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun'
  ];

  List<String> monthInYears = const [
    'Jan',
    'Feb',
    'Mar',
    'April',
    'May',
    'Jun',
    'July',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];

  List<String> get weeksInMonth =>
      const ['Week 1', 'Week 2', 'Week 3', 'Week 4'];
  bool fitInsideBottomTitle = true;

  List<String> get xAxisLabels {
    final List<String> labels = [];
    filteredData.forEach((key, value) {
      if (value.isNotEmpty) {
        labels.add(value.first.dayName);
      }
    });
    return labels;
  }

  List<String> get xAxisLabelsYear {
    final List<String> labels = [];
    filteredData.forEach((key, value) {
      if (value.isNotEmpty) {
        labels.add(value.first.yearName);
      }
    });
    return labels;
  }

  double? get maxX {
    switch (selectedTimePeriod) {
      case TimePeriod.week:
        return filteredData.isNotEmpty ? null : 6;
      case TimePeriod.month:
        return 30;
      case TimePeriod.year:
        return filteredData.isNotEmpty ? null : 11;
      default:
        return null;
    }
  }

  List<BPTrendLineGraphUiModel> dictValues = [];
  @override
  Widget build(BuildContext context) {
    // List<BloodPressureData> data = getBloodPressureData();

    systolicSpots = [];
    diastolicSpots = [];
    verticalRangeAnnotationData = [];
    List<VerticalRangeData> verticalRangeData =
        getVerticalRangeData(selectedTimePeriod);

    // int count = 0;

    // final dictionary = groupBy(bpTrendsData, (item) => item.date);

    // systolicSpots = bpTrendsData.asMap().entries.map((e) {
    //   return FlSpot(e.key.toDouble(), e.value.systolicBP.toDouble());
    // }).toList();

    // diastolicSpots = bpTrendsData.asMap().entries.map((e) {
    //   return FlSpot(e.key.toDouble(), e.value.diastolicBP.toDouble());
    // }).toList();
    List<Object?> keys = filteredData.keys.toList();

    // dictValues = dictionary.values.cast<BPTrendLineGraphUiModel>().toList();
    filteredData.forEach((key, value) {
      // weekDays.add(key.toString());
      systolicSpots.addAll(value
          .map((e) =>
              FlSpot(keys.indexOf(key).toDouble(), e.systolicBP.toDouble()))
          .toList());

      diastolicSpots.addAll(value
          .map((e) =>
              FlSpot(keys.indexOf(key).toDouble(), e.diastolicBP.toDouble()))
          .toList());
      // diastolicSpots.add(
      //     FlSpot((count).toDouble(), bpTrendsData[i].diastolicBP.toDouble()));
    });

    // for (int i = 0; i < dictionary.keys.length; i++) {

    //   final key = dictionary.;

    //   systolicSpots.add(
    //       FlSpot((count).toDouble(), dictionary[i].systolicBP.toDouble()));
    //   diastolicSpots.add(
    //       FlSpot((count).toDouble(), bpTrendsData[i].diastolicBP.toDouble()));
    //   // labels.add(data[i].date.day.toString());
    //   count += 4;
    // }

    for (int i = 0; i < verticalRangeData.length; i++) {
      verticalRangeAnnotationData.add(VerticalRangeAnnotation(
          x1: verticalRangeData[i].x1,
          x2: verticalRangeData[i].x2,
          color: const Color(0xffF6F6F6)));
    }

    debugPrint('$systolicSpots');

    debugPrint('$diastolicSpots');
    debugPrint('$selectedTimePeriod');
    return LineChart(
      LineChartData(
        rangeAnnotations: rangeAnnotations,
        borderData: borderData,
        gridData: FlGridData(show: false),
        titlesData: titlesData,
        minX: 0,
        minY: 0,
        maxX: maxX,
        maxY: 300,
        lineBarsData: [
          LineChartBarData(
            spots: systolicSpots,
            isCurved: true,
            color: appPrimaryColor,
            barWidth: 1,
            isStrokeCapRound: true,
            dotData: FlDotData(show: true),
            show: bpTrendsData.isNotEmpty,
            belowBarData: BarAreaData(show: false),
          ),
          LineChartBarData(
            spots: diastolicSpots,
            isCurved: true,
            color: appPrimaryBlueColor,
            barWidth: 1,
            isStrokeCapRound: true,
            dotData: FlDotData(show: true),
            show: bpTrendsData.isNotEmpty,
            belowBarData: BarAreaData(show: false),
          ),
        ],
      ),
    );
  }

  RangeAnnotations get rangeAnnotations =>
      RangeAnnotations(verticalRangeAnnotations: verticalRangeAnnotationData);

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
        interval: selectedTimePeriod == TimePeriod.month ? 5 : 1,
        getTitlesWidget: getBottomTitles,
      );

  SideTitles get leftTitles => SideTitles(
      showTitles: true,
      reservedSize: 30,
      interval: 50,
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
    String label;
    switch (selectedTimePeriod) {
      case TimePeriod.week:
        // print(dictValues);
        label = filteredData.isNotEmpty
            ? xAxisLabels[value.toInt()]
            : weekDays[value.toInt()];
        break;
      case TimePeriod.month:
        label = value.toInt().toString();
        break;
      case TimePeriod.year:
        label = filteredData.isNotEmpty
            ? xAxisLabelsYear[value.toInt()]
            : monthInYears[value.toInt()];
        break;
      default:
        label = value.toInt().toString();
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 0,
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0),
          child: Text(
            label,
            style: style,
          ) // text,
          ),
    );
  }

  Widget getLeftTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xffA9A9A9),
      fontWeight: FontWeight.w400,
      fontSize: 10,
    );
    Widget text;
    if (value.toInt() == 0) {
      return Container();
    }
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
}
