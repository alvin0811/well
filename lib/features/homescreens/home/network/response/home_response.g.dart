// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeResponse _$HomeResponseFromJson(Map<String, dynamic> json) => HomeResponse(
      device: Device.fromJson(json['device'] as Map<String, dynamic>),
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HomeResponseToJson(HomeResponse instance) =>
    <String, dynamic>{
      'user': instance.user,
      'device': instance.device,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      Id: json['Id'] as int,
      FullName: json['FullName'] as String,
      Email: json['Email'] as String,
      IsFirstStepCompleted: json['IsFirstStepCompleted'] as bool?,
      IsSecondStepCompleted: json['IsSecondStepCompleted'] as bool?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'Id': instance.Id,
      'FullName': instance.FullName,
      'Email': instance.Email,
      'IsFirstStepCompleted': instance.IsFirstStepCompleted,
      'IsSecondStepCompleted': instance.IsSecondStepCompleted,
    };

Device _$DeviceFromJson(Map<String, dynamic> json) => Device(
      deviceUUID: json['deviceUUID'] as String,
    );

Map<String, dynamic> _$DeviceToJson(Device instance) => <String, dynamic>{
      'deviceUUID': instance.deviceUUID,
    };
