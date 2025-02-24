// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'demographics_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DemographicResponse _$DemographicResponseFromJson(Map<String, dynamic> json) =>
    DemographicResponse(
      id: json['Id'] as int?,
      userId: json['UserId'] as int?,
      gender: $enumDecodeNullable(_$GenderStatusEnumMap, json['Gender']),
      dateOfBirth: json['DateOfBirth'] as String?,
      ethnicity:
          $enumDecodeNullable(_$EthnicityStatusEnumMap, json['Ethnicity']),
    );

Map<String, dynamic> _$DemographicResponseToJson(
        DemographicResponse instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'UserId': instance.userId,
      'Gender': _$GenderStatusEnumMap[instance.gender],
      'DateOfBirth': instance.dateOfBirth,
      'Ethnicity': _$EthnicityStatusEnumMap[instance.ethnicity],
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
