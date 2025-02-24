// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_selected_lifestyle_elements_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSelectedLifestyleElementsResponse
    _$GetSelectedLifestyleElementsResponseFromJson(Map<String, dynamic> json) =>
        GetSelectedLifestyleElementsResponse(
          lifeStyle: (json['LifeStyle'] as List<dynamic>)
              .map((e) =>
                  SelectedLifestyleItem.fromJson(e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$GetSelectedLifestyleElementsResponseToJson(
        GetSelectedLifestyleElementsResponse instance) =>
    <String, dynamic>{
      'LifeStyle': instance.lifeStyle,
    };

SelectedLifestyleItem _$SelectedLifestyleItemFromJson(
        Map<String, dynamic> json) =>
    SelectedLifestyleItem(
      id: json['Id'] as int,
      userId: json['UserId'] as int,
      lifestyleId: json['LifestyleId'] as int,
      priorityNumber: json['PriorityNumber'] as int?,
      lifestyleList: LifestyleListItem.fromJson(
          json['LifestyleList'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SelectedLifestyleItemToJson(
        SelectedLifestyleItem instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'UserId': instance.userId,
      'LifestyleId': instance.lifestyleId,
      'PriorityNumber': instance.priorityNumber,
      'LifestyleList': instance.lifestyleList,
    };

ChangeLifestyleElementPriorityResponse
    _$ChangeLifestyleElementPriorityResponseFromJson(
            Map<String, dynamic> json) =>
        ChangeLifestyleElementPriorityResponse(
          success: json['success'] as bool?,
          message: json['message'] as String?,
        );

Map<String, dynamic> _$ChangeLifestyleElementPriorityResponseToJson(
        ChangeLifestyleElementPriorityResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
    };
