import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:well_path/features/homescreens/trends/network/response/bp_trends_bar_graph_response.dart';
import 'package:well_path/features/homescreens/trends/network/response/bp_trends_line_graph_domain_model.dart';

part 'bp_trends_line_graph_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.pascal)
class BloodPressureTrendsLineGraphResponse {
  const BloodPressureTrendsLineGraphResponse(
      {required this.lineChartData, required this.barChartData});

  factory BloodPressureTrendsLineGraphResponse.fromJson(
          Map<String, dynamic> json) =>
      _$BloodPressureTrendsLineGraphResponseFromJson(json);
  Map<String, dynamic> toJson() =>
      _$BloodPressureTrendsLineGraphResponseToJson(this);

  static const jsonFactory = _$BloodPressureTrendsLineGraphResponseFromJson;

  final List<BPTrendsLineChartListItem>? lineChartData;
  final List<BPTrendsBarChartListItem>? barChartData;
}

@JsonSerializable(fieldRename: FieldRename.pascal)
class BPTrendsLineChartListItem {
  BPTrendsLineChartListItem(
      {required this.id,
      required this.createdAt,
      required this.systolicBP,
      required this.diastolicBP,
      required this.pulse,
      required this.categoryBP});

  factory BPTrendsLineChartListItem.fromJson(Map<String, dynamic> json) =>
      _$BPTrendsLineChartListItemFromJson(json);
  Map<String, dynamic> toJson() => _$BPTrendsLineChartListItemToJson(this);

  // static const jsonFactory = _$BPTrendsLineChartListItemFromJson;

  final int id;
  final String createdAt;
  final int systolicBP;
  final int diastolicBP;
  final int pulse;
  final int categoryBP;
}

extension ToDomain on BPTrendsLineChartListItem {
  BPTrendLineGraphUiModel toDomain() {
    DateTime dateTime = DateTime.parse(createdAt).toLocal();
    String dayName = DateFormat.E().format(dateTime);
    String yearName = DateFormat.LLL().format(dateTime);
    String formattedDate = DateFormat("MM/dd/yyyy").format(dateTime);
    String formattedTime = DateFormat("hh:mm a").format(dateTime);

    DateTime date = DateTime(dateTime.year, dateTime.month, dateTime.day);
    DateTime dateWithYear = DateTime(dateTime.year, dateTime.month);

    int weekNumber = (date.day + 6) ~/ 7;

    return BPTrendLineGraphUiModel(
        formattedDate: formattedDate,
        formattedTime: formattedTime,
        dayName: dayName,
        id: id,
        createdAt: createdAt,
        systolicBP: systolicBP,
        diastolicBP: diastolicBP,
        pulse: pulse,
        categoryBP: categoryBP,
        date: date,
        dateWithYear: dateWithYear,
        weekNumber: weekNumber,
        yearName: yearName);
  }
}
