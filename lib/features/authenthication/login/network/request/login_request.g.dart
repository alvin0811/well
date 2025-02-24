// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRequest _$LoginRequestFromJson(Map<String, dynamic> json) => LoginRequest(
      email: json['Email'] as String,
      password: json['Password'] as String,
      fcmToken: json['FCMToken'] as String,
    );

Map<String, dynamic> _$LoginRequestToJson(LoginRequest instance) =>
    <String, dynamic>{
      'Email': instance.email,
      'Password': instance.password,
      'FCMToken': instance.fcmToken,
    };
