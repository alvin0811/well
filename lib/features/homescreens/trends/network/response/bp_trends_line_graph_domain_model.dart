import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:well_path/helper/helpers.dart';

part 'bp_trends_line_graph_domain_model.freezed.dart';
part 'bp_trends_line_graph_domain_model.g.dart';

@freezed
class BPTrendLineGraphUiModel with _$BPTrendLineGraphUiModel {
  factory BPTrendLineGraphUiModel({
    required String? formattedDate,
    required DateTime date,
    required DateTime dateWithYear,
    required String yearName,
    required String? formattedTime,
    required String dayName,
    required int id,
    required String createdAt,
    required int systolicBP,
    required int diastolicBP,
    required int pulse,
    required int categoryBP,
    required int weekNumber,
  }) = _BPTrendLineGraphUiModel;
  factory BPTrendLineGraphUiModel.fromJson(Map<String, dynamic> json) =>
      _$BPTrendLineGraphUiModelFromJson(json);
}
