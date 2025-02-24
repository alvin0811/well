import 'package:freezed_annotation/freezed_annotation.dart';

part 'weight_loss_settings_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.pascal)
class WeightLossSettingResponse {
  WeightLossSettingResponse(
      {required this.id,
      required this.userId,
      required this.heightFt,
      required this.heightIn,
      required this.heightCm,
      required this.weightKg,
      required this.weightLb,
      required this.bmi,
      required this.idealWeight,
      required this.weeklyGoalWeight,
      required this.weightGain, 
      required this.bmiGain});

  factory WeightLossSettingResponse.fromJson(Map<String, dynamic> json) =>
      _$WeightLossSettingResponseFromJson(json);
  Map<String, dynamic> toJson() => _$WeightLossSettingResponseToJson(this);

  static const jsonFactory = _$WeightLossSettingResponseFromJson;

  final int? id;
  final int? userId;
  final int? heightFt;
  final int? heightIn;
  final double? heightCm;
  final double? weightKg;
  final double? weightLb;
  @JsonKey(name: 'BMI')
  final double? bmi;
  final int? idealWeight;
  final int? weeklyGoalWeight;
  final int? weightGain;
  @JsonKey(name: 'BMIGain')
  final double? bmiGain;
}
