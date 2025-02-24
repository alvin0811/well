// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'physical_activity_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhysicalActivityRequest _$PhysicalActivityRequestFromJson(
        Map<String, dynamic> json) =>
    PhysicalActivityRequest(
      activeTime: json['ActiveTime'] as int,
      haveDisability: json['HaveDisability'] as bool?,
      disabilityIds: (json['DisabilityIds'] as List<dynamic>)
          .map((e) => e as int)
          .toList(),
    );

Map<String, dynamic> _$PhysicalActivityRequestToJson(
        PhysicalActivityRequest instance) =>
    <String, dynamic>{
      'ActiveTime': instance.activeTime,
      'HaveDisability': instance.haveDisability,
      'DisabilityIds': instance.disabilityIds,
    };
