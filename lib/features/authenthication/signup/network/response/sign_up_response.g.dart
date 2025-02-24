// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpResponse _$SignUpResponseFromJson(Map<String, dynamic> json) =>
    SignUpResponse(
      token: json['Token'] as String,
      user: SignUpResponseData.fromJson(json['User'] as Map<String, dynamic>),
      deviceUUID: json['DeviceUUID'] as String,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$SignUpResponseToJson(SignUpResponse instance) =>
    <String, dynamic>{
      'Token': instance.token,
      'User': instance.user,
      'DeviceUUID': instance.deviceUUID,
      'message': instance.message,
    };

SignUpResponseData _$SignUpResponseDataFromJson(Map<String, dynamic> json) =>
    SignUpResponseData(
      fullName: json['FullName'] as String,
      phoneNumber: json['PhoneNumber'] as String,
      email: json['Email'] as String,
      userType: json['Type'] as String?,
      userId: json['Id'] as int,
      isFirstStepCompleted: json['IsFirstStepCompleted'] as bool,
      isSecondStepCompleted: json['IsSecondStepCompleted'] as bool,
      isOnboardingCompleted: json['IsOnboardingCompleted'] as bool,
    );

Map<String, dynamic> _$SignUpResponseDataToJson(SignUpResponseData instance) =>
    <String, dynamic>{
      'FullName': instance.fullName,
      'PhoneNumber': instance.phoneNumber,
      'Email': instance.email,
      'Type': instance.userType,
      'Id': instance.userId,
      'IsFirstStepCompleted': instance.isFirstStepCompleted,
      'IsSecondStepCompleted': instance.isSecondStepCompleted,
      'IsOnboardingCompleted': instance.isOnboardingCompleted,
    };
