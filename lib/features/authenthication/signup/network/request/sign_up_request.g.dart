// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpRequest _$SignUpRequestFromJson(Map<String, dynamic> json) =>
    SignUpRequest(
      name: json['FullName'] as String,
      email: json['Email'] as String,
      phone: json['PhoneNumber'] as String,
      password: json['Password'] as String,
      fcmToken: json['FCMToken'] as String,
    );

Map<String, dynamic> _$SignUpRequestToJson(SignUpRequest instance) =>
    <String, dynamic>{
      'FullName': instance.name,
      'Email': instance.email,
      'PhoneNumber': instance.phone,
      'Password': instance.password,
      'FCMToken': instance.fcmToken,
    };
