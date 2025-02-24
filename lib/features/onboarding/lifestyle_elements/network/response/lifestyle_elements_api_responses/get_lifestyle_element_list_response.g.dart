// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_lifestyle_element_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetLifestyleElementListResponse _$GetLifestyleElementListResponseFromJson(
        Map<String, dynamic> json) =>
    GetLifestyleElementListResponse(
      lifestyleList: (json['LifestyleList'] as List<dynamic>)
          .map((e) => LifestyleListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetLifestyleElementListResponseToJson(
        GetLifestyleElementListResponse instance) =>
    <String, dynamic>{
      'LifestyleList': instance.lifestyleList,
    };

LifestyleListItem _$LifestyleListItemFromJson(Map<String, dynamic> json) =>
    LifestyleListItem(
      id: json['Id'] as int,
      title: json['Title'] as String,
      imageUrl: json['ImageUrl'] as String,
      coverImageUrl: json['CoverImageUrl'] as String,
      isSelected: json['IsSelected'] as bool?,
    );

Map<String, dynamic> _$LifestyleListItemToJson(LifestyleListItem instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'Title': instance.title,
      'ImageUrl': instance.imageUrl,
      'IsSelected': instance.isSelected,
      'CoverImageUrl': instance.coverImageUrl,
    };
