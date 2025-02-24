// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bmi_calculation_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BmiCalculationRequest _$BmiCalculationRequestFromJson(
        Map<String, dynamic> json) =>
    BmiCalculationRequest(
      heightFt: json['HeightFt'] as int,
      heightIn: json['HeightIn'] as int,
      heightCm: (json['HeightCm'] as num).toDouble(),
      weightKg: json['WeightKg'] as int,
      weightLb: (json['WeightLb'] as num).toDouble(),
      IdealWeight: json['IdealWeight'] as int,
      IdealWeightLb: (json['IdealWeightLb'] as num).toDouble(),
      WeeklyGoalWeight: json['WeeklyGoalWeight'] as int,
      WeeklyGoalWeightLb: (json['WeeklyGoalWeightLb'] as num).toDouble(),
    );

Map<String, dynamic> _$BmiCalculationRequestToJson(
        BmiCalculationRequest instance) =>
    <String, dynamic>{
      'HeightFt': instance.heightFt,
      'HeightIn': instance.heightIn,
      'HeightCm': instance.heightCm,
      'WeightKg': instance.weightKg,
      'WeightLb': instance.weightLb,
      'IdealWeight': instance.IdealWeight,
      'IdealWeightLb': instance.IdealWeightLb,
      'WeeklyGoalWeight': instance.WeeklyGoalWeight,
      'WeeklyGoalWeightLb': instance.WeeklyGoalWeightLb,
    };
