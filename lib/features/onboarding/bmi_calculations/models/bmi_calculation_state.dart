import 'package:freezed_annotation/freezed_annotation.dart';

part 'bmi_calculation_state.freezed.dart';

@freezed
class BmiCalculationState with _$BmiCalculationState {
  const factory BmiCalculationState({
    @Default(0) int heightFt,
    @Default(0) int heightIn,
    @Default(0) double heightCm,
    @Default(0) int weightKg,
    @Default(0) double weightLb,
    @Default(0) int idealWeightKg,
    @Default(0) double idealWeightLb,
    @Default(0) int weeklyGoalWeightKg,
    @Default(0) double weeklyGoalWeightLb,

    // @Default(0) int idealWeight,
    // @Default(0) int weeklyGoalWeight,
    @Default(0) double bmi,
    @Default(false) bool enableNext,
    @Default(false) bool formFieldsDataMapped,
  }) = _BmiCalculationState;

  const BmiCalculationState._();

  bool get isFormValid {
    return heightFt.toString().isNotEmpty &&
        heightIn.toString().isNotEmpty &&
        heightCm.toString().isNotEmpty &&
        // weeklyGoalWeight.toString().isNotEmpty &&
        // idealWeight.toString().isNotEmpty &&
        idealWeightKg.toString().isNotEmpty &&
        idealWeightLb.toString().isNotEmpty &&
        weeklyGoalWeightKg.toString().isNotEmpty &&
        weeklyGoalWeightLb.toString().isNotEmpty &&
        weightKg.toString().isNotEmpty &&
        weightLb.toString().isNotEmpty;
  }
}
