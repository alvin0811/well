import 'package:freezed_annotation/freezed_annotation.dart';

part 'weight_loss_settings_state.freezed.dart';

@freezed
class WeightLossSettingState with _$WeightLossSettingState {
  const factory WeightLossSettingState(
      {@Default(0) double valueWeight,
      @Default(0) double valueBmi,
      @Default(0) double weight,
      @Default(0) double bmi,
      @Default(0) int idealWeight,
      @Default(0) int weeklyWeightLoss,
      @Default(false) bool enableNext,
      @Default(false) bool formFieldsDataMapped,
      @Default(0) int weightGain,
      @Default(0) double bmiGain}) = _WeightLossSettingState;

  const WeightLossSettingState._();

  bool get isFormValid {
    return valueWeight.toString().isNotEmpty &&
        valueBmi.toString().isNotEmpty &&
        weight.toString().isNotEmpty &&
        bmi.toString().isNotEmpty &&
        weeklyWeightLoss.toString().isNotEmpty &&
        idealWeight.toString().isNotEmpty;
  }
}
