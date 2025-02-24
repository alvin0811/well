// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stress_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StressResponse _$StressResponseFromJson(Map<String, dynamic> json) =>
    StressResponse(
      stressIds:
          (json['StressIds'] as List<dynamic>).map((e) => e as int).toList(),
      copingMechanisms: (json['CopingMechanisms'] as List<dynamic>)
          .map((e) => e as int)
          .toList(),
    );

Map<String, dynamic> _$StressResponseToJson(StressResponse instance) =>
    <String, dynamic>{
      'StressIds': instance.stressIds,
      'CopingMechanisms': instance.copingMechanisms,
    };
