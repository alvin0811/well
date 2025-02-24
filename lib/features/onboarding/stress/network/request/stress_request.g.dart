// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stress_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StressRequest _$StressRequestFromJson(Map<String, dynamic> json) =>
    StressRequest(
      stressIds:
          (json['StressIds'] as List<dynamic>).map((e) => e as int).toList(),
      copingMechanisms: (json['CopingMechanisms'] as List<dynamic>)
          .map((e) => e as int)
          .toList(),
    );

Map<String, dynamic> _$StressRequestToJson(StressRequest instance) =>
    <String, dynamic>{
      'StressIds': instance.stressIds,
      'CopingMechanisms': instance.copingMechanisms,
    };
