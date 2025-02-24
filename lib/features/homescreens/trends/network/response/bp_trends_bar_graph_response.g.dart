// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bp_trends_bar_graph_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BPTrendsBarChartListItem _$BPTrendsBarChartListItemFromJson(
        Map<String, dynamic> json) =>
    BPTrendsBarChartListItem(
      percentage: (json['Percentage'] as num).toDouble(),
      categoryBP:
          $enumDecode(_$BloodPressureCategoryEnumMap, json['CategoryBP']),
      categoryName: json['CategoryName'] as String,
    );

Map<String, dynamic> _$BPTrendsBarChartListItemToJson(
        BPTrendsBarChartListItem instance) =>
    <String, dynamic>{
      'Percentage': instance.percentage,
      'CategoryBP': _$BloodPressureCategoryEnumMap[instance.categoryBP]!,
      'CategoryName': instance.categoryName,
    };

const _$BloodPressureCategoryEnumMap = {
  BloodPressureCategory.hypotension: 0,
  BloodPressureCategory.normal: 1,
  BloodPressureCategory.hypertensionStageOne: 2,
  BloodPressureCategory.hypertensionStageTwo: 3,
  BloodPressureCategory.hypertensiveCrisis: 4,
  BloodPressureCategory.dangerouslyHigh: 5,
};
