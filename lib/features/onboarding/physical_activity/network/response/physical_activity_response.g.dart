// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'physical_activity_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDisabilitiesListResponse _$GetDisabilitiesListResponseFromJson(
        Map<String, dynamic> json) =>
    GetDisabilitiesListResponse(
      disabilityList: (json['DisabilityList'] as List<dynamic>)
          .map((e) => DisabilityItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetDisabilitiesListResponseToJson(
        GetDisabilitiesListResponse instance) =>
    <String, dynamic>{
      'DisabilityList': instance.disabilityList,
    };

DisabilityItem _$DisabilityItemFromJson(Map<String, dynamic> json) =>
    DisabilityItem(
      id: json['Id'] as int,
      title: json['Title'] as String,
      isSelected: json['IsSelected'] as bool?,
    );

Map<String, dynamic> _$DisabilityItemToJson(DisabilityItem instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'Title': instance.title,
      'IsSelected': instance.isSelected,
    };

PhysicalActivityResponse _$PhysicalActivityResponseFromJson(
        Map<String, dynamic> json) =>
    PhysicalActivityResponse(
      activeTime: json['ActiveTime'] as int?,
      haveDisability: json['HaveDisability'] as bool?,
      disabilityIds: (json['DisabilityIds'] as List<dynamic>)
          .map((e) => e as int)
          .toList(),
    );

Map<String, dynamic> _$PhysicalActivityResponseToJson(
        PhysicalActivityResponse instance) =>
    <String, dynamic>{
      'ActiveTime': instance.activeTime,
      'HaveDisability': instance.haveDisability,
      'DisabilityIds': instance.disabilityIds,
    };
