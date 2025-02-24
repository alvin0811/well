// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sleep_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SleepResponse _$SleepResponseFromJson(Map<String, dynamic> json) =>
    SleepResponse(
      sleepHours: json['SleepHours'] as int?,
      fellWellRested: json['FellWellRested'] as bool?,
      sleepSameTime: json['SleepSameTime'] as bool?,
      sleepInterruptions: json['SleepInterruptions'] as int?,
      dayNap: json['DayNap'] as bool?,
    );

Map<String, dynamic> _$SleepResponseToJson(SleepResponse instance) =>
    <String, dynamic>{
      'SleepHours': instance.sleepHours,
      'FellWellRested': instance.fellWellRested,
      'SleepSameTime': instance.sleepSameTime,
      'SleepInterruptions': instance.sleepInterruptions,
      'DayNap': instance.dayNap,
    };
