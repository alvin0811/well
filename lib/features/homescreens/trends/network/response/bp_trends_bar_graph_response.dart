import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bp_trends_bar_graph_response.g.dart';

enum BloodPressureCategory {
  @JsonValue(0)
  hypotension,
  @JsonValue(1)
  normal,
  @JsonValue(2)
  hypertensionStageOne,
  @JsonValue(3)
  hypertensionStageTwo,
  @JsonValue(4)
  hypertensiveCrisis,
  @JsonValue(5)
  dangerouslyHigh
}

extension BloodPressureCategoryExtension on BloodPressureCategory {
  String get title {
    switch (this) {
      case BloodPressureCategory.hypotension:
        return 'Hypotension';
      case BloodPressureCategory.normal:
        return 'Normal';
      case BloodPressureCategory.hypertensionStageOne:
        return 'Stage 1';
      case BloodPressureCategory.hypertensionStageTwo:
        return 'Stage 2';
      case BloodPressureCategory.hypertensiveCrisis:
        return 'Hypo Crisis';
      default:
        return '';
    }
  }

  Color get barColor {
    switch (this) {
      case BloodPressureCategory.hypotension:
        return const Color(0xffCAFFE9);
      case BloodPressureCategory.normal:
        return const Color(0xffF7FFC9);
      case BloodPressureCategory.hypertensionStageOne:
        return const Color(0xffFFE3C9);
      case BloodPressureCategory.hypertensionStageTwo:
        return const Color(0xffFFC9C9);
      case BloodPressureCategory.hypertensiveCrisis:
        return const Color(0xffC9EAFF);
      default:
        return const Color(0xffC9EAFF);
    }
  }
}

@JsonSerializable(fieldRename: FieldRename.pascal)
class BPTrendsBarChartListItem {
  BPTrendsBarChartListItem(
      {required this.percentage,
      required this.categoryBP,
      required this.categoryName});

  factory BPTrendsBarChartListItem.fromJson(Map<String, dynamic> json) =>
      _$BPTrendsBarChartListItemFromJson(json);
  Map<String, dynamic> toJson() => _$BPTrendsBarChartListItemToJson(this);

  // static const jsonFactory = _$BPTrendsBarChartListItemFromJson;

  final double percentage;
  final BloodPressureCategory categoryBP;
  final String categoryName;
}
