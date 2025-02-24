// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bp_trends_line_graph_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BloodPressureTrendsLineGraphRequest
    _$BloodPressureTrendsLineGraphRequestFromJson(Map<String, dynamic> json) =>
        BloodPressureTrendsLineGraphRequest(
          startDate: json['StartDate'] as String,
          endDate: json['EndDate'] as String,
          timeFilter: json['TimeFilter'] as int?,
          amStartTime: json['AmStartTime'] as String,
          amEndTime: json['AmEndTime'] as String,
          pmStartTime: json['PmStartTime'] as String,
          pmEndTime: json['PmEndTime'] as String,
        )..timeZoneOffset = json['TimeZoneOffset'] as String;

Map<String, dynamic> _$BloodPressureTrendsLineGraphRequestToJson(
        BloodPressureTrendsLineGraphRequest instance) =>
    <String, dynamic>{
      'TimeZoneOffset': instance.timeZoneOffset,
      'TimeFilter': instance.timeFilter,
      'StartDate': instance.startDate,
      'EndDate': instance.endDate,
      'AmStartTime': instance.amStartTime,
      'AmEndTime': instance.amEndTime,
      'PmStartTime': instance.pmStartTime,
      'PmEndTime': instance.pmEndTime,
    };
