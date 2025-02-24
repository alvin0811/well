// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medications_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MeditationResponse _$MeditationResponseFromJson(Map<String, dynamic> json) =>
    MeditationResponse(
      medicationLevel: json['MedicationLevel'] as int?,
      activityLevel: json['ActivityLevel'] as int?,
      medicationIds: (json['MedicationIds'] as List<dynamic>)
          .map((e) => e as int)
          .toList(),
    );

Map<String, dynamic> _$MeditationResponseToJson(MeditationResponse instance) =>
    <String, dynamic>{
      'MedicationLevel': instance.medicationLevel,
      'ActivityLevel': instance.activityLevel,
      'MedicationIds': instance.medicationIds,
    };

MedicationListResponse _$MedicationListResponseFromJson(
        Map<String, dynamic> json) =>
    MedicationListResponse(
      medicationList: (json['MedicationList'] as List<dynamic>)
          .map((e) => MedicationItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MedicationListResponseToJson(
        MedicationListResponse instance) =>
    <String, dynamic>{
      'MedicationList': instance.medicationList,
    };

MedicationItem _$MedicationItemFromJson(Map<String, dynamic> json) =>
    MedicationItem(
      id: json['Id'] as int,
      title: json['Title'] as String,
      isSelected: json['IsSelected'] as bool?,
    );

Map<String, dynamic> _$MedicationItemToJson(MedicationItem instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'Title': instance.title,
      'IsSelected': instance.isSelected,
    };
