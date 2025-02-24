// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sleep_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SleepRequest _$SleepRequestFromJson(Map<String, dynamic> json) => SleepRequest(
      sleepHours: json['SleepHours'] as int?,
      fellWellRested: json['FellWellRested'] as bool?,
      sleepSameTime: json['SleepSameTime'] as bool?,
      sleepInterruptions: json['SleepInterruptions'] as int?,
      dayNap: json['DayNap'] as bool?,
    );

Map<String, dynamic> _$SleepRequestToJson(SleepRequest instance) =>
    <String, dynamic>{
      'SleepHours': instance.sleepHours,
      'FellWellRested': instance.fellWellRested,
      'SleepSameTime': instance.sleepSameTime,
      'SleepInterruptions': instance.sleepInterruptions,
      'DayNap': instance.dayNap,
    };
