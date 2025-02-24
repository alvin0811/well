// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'demographics_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DemographicRequest _$DemographicRequestFromJson(Map<String, dynamic> json) =>
    DemographicRequest(
      gender: $enumDecode(_$GenderStatusEnumMap, json['Gender']),
      dateOfBirth: json['DateOfBirth'] as String,
      ethnicity: $enumDecode(_$EthnicityStatusEnumMap, json['Ethnicity']),
    );

Map<String, dynamic> _$DemographicRequestToJson(DemographicRequest instance) =>
    <String, dynamic>{
      'Gender': _$GenderStatusEnumMap[instance.gender]!,
      'DateOfBirth': instance.dateOfBirth,
      'Ethnicity': _$EthnicityStatusEnumMap[instance.ethnicity]!,
    };

const _$GenderStatusEnumMap = {
  GenderStatus.male: 1,
  GenderStatus.feMale: 0,
  GenderStatus.others: 2,
};

const _$EthnicityStatusEnumMap = {
  EthnicityStatus.white: 0,
  EthnicityStatus.africanAmerican: 1,
  EthnicityStatus.asian: 2,
  EthnicityStatus.americanIndian: 3,
  EthnicityStatus.nativeHawaiian: 4,
  EthnicityStatus.other: 5,
};
