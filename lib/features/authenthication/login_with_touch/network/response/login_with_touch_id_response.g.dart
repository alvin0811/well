// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_with_touch_id_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginWithTouchIdResponse _$LoginWithTouchIdResponseFromJson(
        Map<String, dynamic> json) =>
    LoginWithTouchIdResponse(
      token: json['Token'] as String,
      deviceUUID: json['DeviceUUID'] as String,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$LoginWithTouchIdResponseToJson(
        LoginWithTouchIdResponse instance) =>
    <String, dynamic>{
      'Token': instance.token,
      'DeviceUUID': instance.deviceUUID,
      'message': instance.message,
    };
