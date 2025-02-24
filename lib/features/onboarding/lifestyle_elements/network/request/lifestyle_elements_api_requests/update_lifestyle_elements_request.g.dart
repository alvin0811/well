// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_lifestyle_elements_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateLifestyleElementsRequest _$UpdateLifestyleElementsRequestFromJson(
        Map<String, dynamic> json) =>
    UpdateLifestyleElementsRequest(
      lifestyleIds:
          (json['LifestyleIds'] as List<dynamic>).map((e) => e as int).toList(),
    );

Map<String, dynamic> _$UpdateLifestyleElementsRequestToJson(
        UpdateLifestyleElementsRequest instance) =>
    <String, dynamic>{
      'LifestyleIds': instance.lifestyleIds,
    };
