// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_otp_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangePasswordOtpResponse _$ChangePasswordOtpResponseFromJson(
        Map<String, dynamic> json) =>
    ChangePasswordOtpResponse(
      token: json['Token'] as String,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ChangePasswordOtpResponseToJson(
        ChangePasswordOtpResponse instance) =>
    <String, dynamic>{
      'Token': instance.token,
      'message': instance.message,
    };
