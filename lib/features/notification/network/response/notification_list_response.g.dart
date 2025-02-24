// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetNotificationListResponse _$GetNotificationListResponseFromJson(
        Map<String, dynamic> json) =>
    GetNotificationListResponse(
      data: (json['Data'] as List<dynamic>?)
          ?.map((e) => NotificationListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalCount: json['TotalCount'] as int?,
    );

Map<String, dynamic> _$GetNotificationListResponseToJson(
        GetNotificationListResponse instance) =>
    <String, dynamic>{
      'Data': instance.data,
      'TotalCount': instance.totalCount,
    };

NotificationListItem _$NotificationListItemFromJson(
        Map<String, dynamic> json) =>
    NotificationListItem(
      id: json['Id'] as int,
      title: json['Title'] as String,
      description: json['Description'] as String,
      createdAt: json['CreatedAt'] as String,
    );

Map<String, dynamic> _$NotificationListItemToJson(
        NotificationListItem instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'Title': instance.title,
      'Description': instance.description,
      'CreatedAt': instance.createdAt,
    };
