// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteUserResponse _$DeleteUserResponseFromJson(Map<String, dynamic> json) =>
    DeleteUserResponse(
      data: json['data'] as bool,
      message: json['message'] as String?,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$DeleteUserResponseToJson(DeleteUserResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
      'error': instance.error,
    };
