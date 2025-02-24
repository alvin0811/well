// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_otp_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangePasswordOtpRequest _$ChangePasswordOtpRequestFromJson(
        Map<String, dynamic> json) =>
    ChangePasswordOtpRequest(
      token: json['Token'] as String,
      code: json['Code'] as String,
    );

Map<String, dynamic> _$ChangePasswordOtpRequestToJson(
        ChangePasswordOtpRequest instance) =>
    <String, dynamic>{
      'Token': instance.token,
      'Code': instance.code,
    };
