// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lifestyle_elements_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LifestyleElementsResponse _$LifestyleElementsResponseFromJson(
        Map<String, dynamic> json) =>
    LifestyleElementsResponse(
      lifestyleIds:
          (json['LifestyleIds'] as List<dynamic>).map((e) => e as int).toList(),
    );

Map<String, dynamic> _$LifestyleElementsResponseToJson(
        LifestyleElementsResponse instance) =>
    <String, dynamic>{
      'LifestyleIds': instance.lifestyleIds,
    };
