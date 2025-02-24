import 'package:well_path/features/homescreens/trends/ui/bp_trends/bp_trends_view.dart';

class BloodPressureData {
  final DateTime date;
  final int systolic;
  final int diastolic;

  BloodPressureData(this.date, this.systolic, this.diastolic);
}

List<BloodPressureData> getBloodPressureData() {
  return [
    // BloodPressureData(DateTime(2023, 5, 1), 120, 80),
    // BloodPressureData(DateTime(2023, 5, 2), 118, 78),
    // BloodPressureData(DateTime(2023, 5, 3), 122, 82),
    // BloodPressureData(DateTime(2023, 5, 4), 130, 85),
    // BloodPressureData(DateTime(2023, 5, 5), 135, 88),
    // BloodPressureData(DateTime(2023, 5, 6), 128, 82),
    // BloodPressureData(DateTime(2023, 5, 7), 125, 80),

    BloodPressureData(DateTime(2022, 1, 1), 120, 80),
    BloodPressureData(DateTime(2022, 1, 2), 118, 78),
    BloodPressureData(DateTime(2022, 1, 3), 122, 82),
    // ... additional data for 2022
    BloodPressureData(DateTime(2023, 1, 1), 125, 80),
    BloodPressureData(DateTime(2023, 1, 2), 128, 82),
    BloodPressureData(DateTime(2023, 1, 3), 130, 85),
    // ... additional data for 2023
    BloodPressureData(DateTime(2023, 5, 1), 120, 80),
    // BloodPressureData(DateTime(2023, 5, 2), 118, 78),
    // BloodPressureData(DateTime(2023, 5, 3), 122, 82),
    // BloodPressureData(DateTime(2023, 5, 4), 130, 85),
    // BloodPressureData(DateTime(2023, 5, 5), 135, 88),
    // BloodPressureData(DateTime(2023, 5, 6), 128, 82),
    // BloodPressureData(DateTime(2023, 5, 7), 125, 80),
  ];
}

// Color lineColor = Color(0xfff3f169);

// List<LineChartBarData> lineChartBarData = [
//   LineChartBarData(color: lineColor, isCurved: true, spots: [
//     FlSpot(1, 8),
//     FlSpot(2, 12.4),
//     FlSpot(3, 10.8),
//     FlSpot(4, 9),
//     FlSpot(5, 8),
//     FlSpot(6, 8.6),
//     FlSpot(7, 10)
//   ])
// ];

class VerticalRangeData {
  final double x1;
  final double x2;

  VerticalRangeData(this.x1, this.x2);
}

List<VerticalRangeData> getVerticalRangeData(TimePeriod timePeriod) {
  List<VerticalRangeData> list = [];

  int startRange = 0;
  int endRange = 0;
  int limit = 3;

  switch (timePeriod) {
    case TimePeriod.week:
      startRange = 2;
      endRange = 1;
      break;
    case TimePeriod.month:
      startRange = 10;
      endRange = 5;
      break;
    case TimePeriod.year:
      startRange = 2;
      endRange = 1;
      limit = 6;
      break;
  }

  for (int i = 0; i < limit; i++) {
    int start = i * startRange;
    int end = start + endRange;
    list.add(VerticalRangeData(start.toDouble(), end.toDouble()));
  }

  return list;
}
