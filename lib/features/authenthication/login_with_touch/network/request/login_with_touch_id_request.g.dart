// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_with_touch_id_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginWithTouchIdRequest _$LoginWithTouchIdRequestFromJson(
        Map<String, dynamic> json) =>
    LoginWithTouchIdRequest(
      email: json['Email'] as String,
      password: json['Password'] as String,
    );

Map<String, dynamic> _$LoginWithTouchIdRequestToJson(
        LoginWithTouchIdRequest instance) =>
    <String, dynamic>{
      'Email': instance.email,
      'Password': instance.password,
    };
