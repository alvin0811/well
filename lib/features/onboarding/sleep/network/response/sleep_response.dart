import 'package:freezed_annotation/freezed_annotation.dart';

part 'sleep_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.pascal)
class SleepResponse {
  SleepResponse(
      {required this.sleepHours,
      required this.fellWellRested,
      required this.sleepSameTime,
      required this.sleepInterruptions,
      required this.dayNap});

  factory SleepResponse.fromJson(Map<String, dynamic> json) =>
      _$SleepResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SleepResponseToJson(this);

  static const jsonFactory = _$SleepResponseFromJson;

  final int? sleepHours;
  final bool? fellWellRested;
  final bool? sleepSameTime;
  final int? sleepInterruptions;
  final bool? dayNap;
}
