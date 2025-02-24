// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_upload_init_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MediaUploadInItRequest _$MediaUploadInItRequestFromJson(
        Map<String, dynamic> json) =>
    MediaUploadInItRequest(
      name: json['Name'] as String,
      size: json['Size'] as int,
      type: json['Type'] as String,
    );

Map<String, dynamic> _$MediaUploadInItRequestToJson(
        MediaUploadInItRequest instance) =>
    <String, dynamic>{
      'Name': instance.name,
      'Size': instance.size,
      'Type': instance.type,
    };
