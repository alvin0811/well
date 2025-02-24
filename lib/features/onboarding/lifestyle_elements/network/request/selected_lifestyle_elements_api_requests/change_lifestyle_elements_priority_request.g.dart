// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_lifestyle_elements_priority_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangeLifestyleElementsPriorityRequest
    _$ChangeLifestyleElementsPriorityRequestFromJson(
            Map<String, dynamic> json) =>
        ChangeLifestyleElementsPriorityRequest(
          data: (json['data'] as List<dynamic>)
              .map((e) => ChangeElementPriorityRequestItem.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$ChangeLifestyleElementsPriorityRequestToJson(
        ChangeLifestyleElementsPriorityRequest instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

ChangeElementPriorityRequestItem _$ChangeElementPriorityRequestItemFromJson(
        Map<String, dynamic> json) =>
    ChangeElementPriorityRequestItem(
      lifestyleId: json['LifestyleId'] as int,
      priorityNumber: json['PriorityNumber'] as int,
    );

Map<String, dynamic> _$ChangeElementPriorityRequestItemToJson(
        ChangeElementPriorityRequestItem instance) =>
    <String, dynamic>{
      'LifestyleId': instance.lifestyleId,
      'PriorityNumber': instance.priorityNumber,
    };
