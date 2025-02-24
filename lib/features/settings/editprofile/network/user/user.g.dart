// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      fullName: json['FullName'] as String,
      email: json['Email'] as String,
      phoneNumber: json['PhoneNumber'] as String?,
      id: json['Id'] as int,
      type: json['Type'] as String?,
      profilePictureId: json['ProfilePictureId'] as int?,
      isFirstStepCompleted: json['IsFirstStepCompleted'] as bool?,
      isSecondStepCompleted: json['IsSecondStepCompleted'] as bool?,
      isOnboardingCompleted: json['IsOnboardingCompleted'] as bool?,
    )..profilePicture = json['ProfilePicture'] == null
        ? null
        : ProfilePicture.fromJson(
            json['ProfilePicture'] as Map<String, dynamic>);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'Id': instance.id,
      'FullName': instance.fullName,
      'Email': instance.email,
      'PhoneNumber': instance.phoneNumber,
      'Type': instance.type,
      'ProfilePictureId': instance.profilePictureId,
      'IsFirstStepCompleted': instance.isFirstStepCompleted,
      'IsSecondStepCompleted': instance.isSecondStepCompleted,
      'IsOnboardingCompleted': instance.isOnboardingCompleted,
      'ProfilePicture': instance.profilePicture,
    };
