// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_picture.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfilePicture _$ProfilePictureFromJson(Map<String, dynamic> json) =>
    ProfilePicture(
      id: json['Id'] as int,
      path: json['Path'] as String,
      thumbPath: json['ThumbPath'] as String,
    );

Map<String, dynamic> _$ProfilePictureToJson(ProfilePicture instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'Path': instance.path,
      'ThumbPath': instance.thumbPath,
    };
