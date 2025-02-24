// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weight_loss_settings_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeightLossSettingResponse _$WeightLossSettingResponseFromJson(
        Map<String, dynamic> json) =>
    WeightLossSettingResponse(
      id: json['Id'] as int?,
      userId: json['UserId'] as int?,
      heightFt: json['HeightFt'] as int?,
      heightIn: json['HeightIn'] as int?,
      heightCm: (json['HeightCm'] as num?)?.toDouble(),
      weightKg: (json['WeightKg'] as num?)?.toDouble(),
      weightLb: (json['WeightLb'] as num?)?.toDouble(),
      bmi: (json['BMI'] as num?)?.toDouble(),
      idealWeight: json['IdealWeight'] as int?,
      weeklyGoalWeight: json['WeeklyGoalWeight'] as int?,
      weightGain: json['WeightGain'] as int?,
      bmiGain: (json['BMIGain'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$WeightLossSettingResponseToJson(
        WeightLossSettingResponse instance) =>
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
      'WeightGain': instance.weightGain,
      'BMIGain': instance.bmiGain,
    };
