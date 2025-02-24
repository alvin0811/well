// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_upload_init_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MediaUploadInItResponse _$MediaUploadInItResponseFromJson(
        Map<String, dynamic> json) =>
    MediaUploadInItResponse(
      accessKeyId: json['AccessKeyId'] as String,
      secretAccessKey: json['SecretAccessKey'] as String,
      sessionToken: json['SessionToken'] as String,
      mediaId: json['MediaId'] as int,
      location: json['Location'] as String,
      region: json['Region'] as String,
      bucket: json['Bucket'] as String,
    );

Map<String, dynamic> _$MediaUploadInItResponseToJson(
        MediaUploadInItResponse instance) =>
    <String, dynamic>{
      'AccessKeyId': instance.accessKeyId,
      'SecretAccessKey': instance.secretAccessKey,
      'SessionToken': instance.sessionToken,
      'MediaId': instance.mediaId,
      'Location': instance.location,
      'Region': instance.region,
      'Bucket': instance.bucket,
    };
