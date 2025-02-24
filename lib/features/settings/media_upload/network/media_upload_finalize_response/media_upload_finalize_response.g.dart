// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_upload_finalize_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MediaUploadFinalizeResponse _$MediaUploadFinalizeResponseFromJson(
        Map<String, dynamic> json) =>
    MediaUploadFinalizeResponse(
      id: json['Id'] as int,
      userId: json['UserId'] as int,
      name: json['Name'] as String,
      extension: json['Extension'] as String,
      size: json['Size'] as int,
      location: json['Location'] as String,
      path: json['Path'] as String,
      thumbPath: json['ThumbPath'] as String,
    );

Map<String, dynamic> _$MediaUploadFinalizeResponseToJson(
        MediaUploadFinalizeResponse instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'UserId': instance.userId,
      'Name': instance.name,
      'Extension': instance.extension,
      'Size': instance.size,
      'Location': instance.location,
      'Path': instance.path,
      'ThumbPath': instance.thumbPath,
    };
