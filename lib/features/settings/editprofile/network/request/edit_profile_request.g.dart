// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_profile_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditProfileRequest _$EditProfileRequestFromJson(Map<String, dynamic> json) =>
    EditProfileRequest(
      name: json['FullName'] as String,
      profilePictureId: json['ProfilePictureId'] as int,
      email: json['Email'] as String,
      phone: json['PhoneNumber'] as String,
    );

Map<String, dynamic> _$EditProfileRequestToJson(EditProfileRequest instance) =>
    <String, dynamic>{
      'FullName': instance.name,
      'Email': instance.email,
      'PhoneNumber': instance.phone,
      'ProfilePictureId': instance.profilePictureId,
    };
