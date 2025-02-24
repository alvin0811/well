// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bp_trends_line_graph_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BloodPressureTrendsLineGraphResponse
    _$BloodPressureTrendsLineGraphResponseFromJson(Map<String, dynamic> json) =>
        BloodPressureTrendsLineGraphResponse(
          lineChartData: (json['LineChartData'] as List<dynamic>?)
              ?.map((e) =>
                  BPTrendsLineChartListItem.fromJson(e as Map<String, dynamic>))
              .toList(),
          barChartData: (json['BarChartData'] as List<dynamic>?)
              ?.map((e) =>
                  BPTrendsBarChartListItem.fromJson(e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$BloodPressureTrendsLineGraphResponseToJson(
        BloodPressureTrendsLineGraphResponse instance) =>
    <String, dynamic>{
      'LineChartData': instance.lineChartData,
      'BarChartData': instance.barChartData,
    };

BPTrendsLineChartListItem _$BPTrendsLineChartListItemFromJson(
        Map<String, dynamic> json) =>
    BPTrendsLineChartListItem(
      id: json['Id'] as int,
      createdAt: json['CreatedAt'] as String,
      systolicBP: json['SystolicBP'] as int,
      diastolicBP: json['DiastolicBP'] as int,
      pulse: json['Pulse'] as int,
      categoryBP: json['CategoryBP'] as int,
    );

Map<String, dynamic> _$BPTrendsLineChartListItemToJson(
        BPTrendsLineChartListItem instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'CreatedAt': instance.createdAt,
      'SystolicBP': instance.systolicBP,
      'DiastolicBP': instance.diastolicBP,
      'Pulse': instance.pulse,
      'CategoryBP': instance.categoryBP,
    };
