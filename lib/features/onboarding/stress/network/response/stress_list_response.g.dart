// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stress_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StressListResponse _$StressListResponseFromJson(Map<String, dynamic> json) =>
    StressListResponse(
      stressList: (json['StressList'] as List<dynamic>)
          .map((e) => StressItems.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StressListResponseToJson(StressListResponse instance) =>
    <String, dynamic>{
      'StressList': instance.stressList,
    };

StressItems _$StressItemsFromJson(Map<String, dynamic> json) => StressItems(
      id: json['Id'] as int,
      title: json['Title'] as String,
      selected: json['Selected'] as bool? ?? false,
    );

Map<String, dynamic> _$StressItemsToJson(StressItems instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'Title': instance.title,
      'Selected': instance.selected,
    };
