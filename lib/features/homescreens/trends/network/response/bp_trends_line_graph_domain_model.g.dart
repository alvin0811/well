// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bp_trends_line_graph_domain_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BPTrendLineGraphUiModelImpl _$$BPTrendLineGraphUiModelImplFromJson(
        Map<String, dynamic> json) =>
    _$BPTrendLineGraphUiModelImpl(
      formattedDate: json['formattedDate'] as String?,
      date: DateTime.parse(json['date'] as String),
      dateWithYear: DateTime.parse(json['dateWithYear'] as String),
      yearName: json['yearName'] as String,
      formattedTime: json['formattedTime'] as String?,
      dayName: json['dayName'] as String,
      id: json['id'] as int,
      createdAt: json['createdAt'] as String,
      systolicBP: json['systolicBP'] as int,
      diastolicBP: json['diastolicBP'] as int,
      pulse: json['pulse'] as int,
      categoryBP: json['categoryBP'] as int,
      weekNumber: json['weekNumber'] as int,
    );

Map<String, dynamic> _$$BPTrendLineGraphUiModelImplToJson(
        _$BPTrendLineGraphUiModelImpl instance) =>
    <String, dynamic>{
      'formattedDate': instance.formattedDate,
      'date': instance.date.toIso8601String(),
      'dateWithYear': instance.dateWithYear.toIso8601String(),
      'yearName': instance.yearName,
      'formattedTime': instance.formattedTime,
      'dayName': instance.dayName,
      'id': instance.id,
      'createdAt': instance.createdAt,
      'systolicBP': instance.systolicBP,
      'diastolicBP': instance.diastolicBP,
      'pulse': instance.pulse,
      'categoryBP': instance.categoryBP,
      'weekNumber': instance.weekNumber,
    };
