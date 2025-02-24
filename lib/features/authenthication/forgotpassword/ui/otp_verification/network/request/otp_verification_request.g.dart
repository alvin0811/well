// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_verification_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OtpVerificationRequest _$OtpVerificationRequestFromJson(
        Map<String, dynamic> json) =>
    OtpVerificationRequest(
      token: json['Token'] as String,
      code: json['Code'] as String,
    );

Map<String, dynamic> _$OtpVerificationRequestToJson(
        OtpVerificationRequest instance) =>
    <String, dynamic>{
      'Token': instance.token,
      'Code': instance.code,
    };
