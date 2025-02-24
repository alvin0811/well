import 'package:freezed_annotation/freezed_annotation.dart';

part 'bmi_calculation_response_ui_model.freezed.dart';

@freezed
class BmiCalculationResponseUiModel with _$BmiCalculationResponseUiModel {
  const factory BmiCalculationResponseUiModel({
    required int heightFt,
    required int heightIn,
    required int heightCm,
    required int weightKg,
    required int weightLb,
  }) = BmiCalculationResponseUiModelItem;
}
