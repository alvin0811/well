import 'package:json_annotation/json_annotation.dart';

part 'sleep_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.pascal)
class SleepRequest {
  SleepRequest(
      {required this.sleepHours,
      required this.fellWellRested,
      required this.sleepSameTime,
      required this.sleepInterruptions,
      required this.dayNap});

  factory SleepRequest.fromJson(Map<String, dynamic> json) =>
      _$SleepRequestFromJson(json);
  Map<String, dynamic> toJson() => _$SleepRequestToJson(this);

  static const jsonFactory = _$SleepRequestFromJson;

  final int? sleepHours;
  final bool? fellWellRested;
  final bool? sleepSameTime;
  final int? sleepInterruptions;
  final bool? dayNap;
}
