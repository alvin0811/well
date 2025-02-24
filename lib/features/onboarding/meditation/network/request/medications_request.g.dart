// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medications_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MeditationRequest _$MeditationRequestFromJson(Map<String, dynamic> json) =>
    MeditationRequest(
      medicationLevel: json['MedicationLevel'] as int?,
      activityLevel: json['ActivityLevel'] as int?,
      medicationIds: (json['MedicationIds'] as List<dynamic>)
          .map((e) => e as int)
          .toList(),
    );

Map<String, dynamic> _$MeditationRequestToJson(MeditationRequest instance) =>
    <String, dynamic>{
      'MedicationLevel': instance.medicationLevel,
      'ActivityLevel': instance.activityLevel,
      'MedicationIds': instance.medicationIds,
    };
