// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting_reset_password_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SettingResetPasswordRequest _$SettingResetPasswordRequestFromJson(
        Map<String, dynamic> json) =>
    SettingResetPasswordRequest(
      token: json['Token'] as String,
      password: json['Password'] as String,
    );

Map<String, dynamic> _$SettingResetPasswordRequestToJson(
        SettingResetPasswordRequest instance) =>
    <String, dynamic>{
      'Token': instance.token,
      'Password': instance.password,
    };
