// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bmi_calculation_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BmiCalculationResponse _$BmiCalculationResponseFromJson(
        Map<String, dynamic> json) =>
    BmiCalculationResponse(
      id: json['Id'] as int?,
      userId: json['UserId'] as int?,
      heightFt: json['HeightFt'] as int?,
      heightIn: json['HeightIn'] as int?,
      heightCm: (json['HeightCm'] as num?)?.toDouble(),
      weightKg: json['WeightKg'] as int?,
      weightLb: (json['WeightLb'] as num?)?.toDouble(),
      bmi: (json['BMI'] as num?)?.toDouble(),
      idealWeight: json['IdealWeight'] as int?,
      weeklyGoalWeight: json['WeeklyGoalWeight'] as int?,
      IdealWeightLb: (json['IdealWeightLb'] as num?)?.toDouble(),
      WeeklyGoalWeightLb: (json['WeeklyGoalWeightLb'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$BmiCalculationResponseToJson(
        BmiCalculationResponse instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'UserId': instance.userId,
      'HeightFt': instance.heightFt,
      'HeightIn': instance.heightIn,
      'HeightCm': instance.heightCm,
      'WeightKg': instance.weightKg,
      'WeightLb': instance.weightLb,
      'BMI': instance.bmi,
      'IdealWeight': instance.idealWeight,
      'WeeklyGoalWeight': instance.weeklyGoalWeight,
      'IdealWeightLb': instance.IdealWeightLb,
      'WeeklyGoalWeightLb': instance.WeeklyGoalWeightLb,
    };
