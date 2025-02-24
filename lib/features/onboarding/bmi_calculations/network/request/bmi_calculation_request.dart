import 'package:freezed_annotation/freezed_annotation.dart';

part 'bmi_calculation_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.pascal)
class BmiCalculationRequest {
  BmiCalculationRequest({
    required this.heightFt,
    required this.heightIn,
    required this.heightCm,
    required this.weightKg,
    required this.weightLb,
    required this.IdealWeight,
    required this.IdealWeightLb,
    required this.WeeklyGoalWeight,
    required this.WeeklyGoalWeightLb,
    // required this.idealWeight,
    // required this.weeklyGoalWeight,
  });

  factory BmiCalculationRequest.fromJson(Map<String, dynamic> json) =>
      _$BmiCalculationRequestFromJson(json);
  Map<String, dynamic> toJson() => _$BmiCalculationRequestToJson(this);

  final int heightFt;
  final int heightIn;
  final double heightCm;
  final int weightKg;
  final double weightLb;
  final int IdealWeight;
  final double IdealWeightLb;
  final int WeeklyGoalWeight;
  final double WeeklyGoalWeightLb;
  // final int idealWeight;
  // final int weeklyGoalWeight;
}
