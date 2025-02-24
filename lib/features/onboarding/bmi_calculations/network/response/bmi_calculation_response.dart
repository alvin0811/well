import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:well_path/features/onboarding/bmi_calculations/network/response/bmi_calculation_response_ui_model.dart';

part 'bmi_calculation_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.pascal)
class BmiCalculationResponse {
  BmiCalculationResponse({
    required this.id,
    required this.userId,
    required this.heightFt,
    required this.heightIn,
    required this.heightCm,
    required this.weightKg,
    required this.weightLb,
    required this.bmi,
    required this.idealWeight,
    required this.weeklyGoalWeight,
    required this.IdealWeightLb,
    required this.WeeklyGoalWeightLb,
  });

  factory BmiCalculationResponse.fromJson(Map<String, dynamic> json) =>
      _$BmiCalculationResponseFromJson(json);
  Map<String, dynamic> toJson() => _$BmiCalculationResponseToJson(this);

  static const jsonFactory = _$BmiCalculationResponseFromJson;

  final int? id;
  final int? userId;
  final int? heightFt;
  final int? heightIn;
  final double? heightCm;
  final int? weightKg;
  final double? weightLb;
  @JsonKey(name: 'BMI')
  final double? bmi;
  final int? idealWeight;
  final int? weeklyGoalWeight;
  final double? IdealWeightLb;
final double? WeeklyGoalWeightLb;
}

extension ToBmiCalculationResponseUiModel on BmiCalculationResponse {
  BmiCalculationResponseUiModel toBmiCalculationResponseUiModel() {
    return BmiCalculationResponseUiModel(
      heightFt: heightFt ?? 0,
      heightIn: heightIn ?? 0,
      heightCm: int.parse(heightCm.toString()),
      weightKg: weightKg ?? 0,
      weightLb: int.parse(weightLb.toString()),
    );
  }
}
