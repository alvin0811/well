import 'package:freezed_annotation/freezed_annotation.dart';

part 'bp_trends_line_graph_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.pascal)
class BloodPressureTrendsLineGraphRequest {
  BloodPressureTrendsLineGraphRequest(
      {required this.startDate,
      required this.endDate,
      this.timeFilter,
      required this.amStartTime,
      required this.amEndTime,
      required this.pmStartTime,
      required this.pmEndTime});

  factory BloodPressureTrendsLineGraphRequest.fromJson(
          Map<String, dynamic> json) =>
      _$BloodPressureTrendsLineGraphRequestFromJson(json);
  Map<String, dynamic> toJson() =>
      _$BloodPressureTrendsLineGraphRequestToJson(this);

  static const jsonFactory = _$BloodPressureTrendsLineGraphRequestFromJson;

  String timeZoneOffset = '';
  int? timeFilter;
  final String startDate;
  final String endDate;
  final String amStartTime;
  final String amEndTime;
  final String pmStartTime;
  final String pmEndTime;
}
