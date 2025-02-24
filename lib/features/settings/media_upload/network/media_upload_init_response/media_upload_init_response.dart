import 'package:json_annotation/json_annotation.dart';

part 'media_upload_init_response.g.dart';

@JsonSerializable()
class MediaUploadInItResponse {
  MediaUploadInItResponse({
    required this.accessKeyId,
    required this.secretAccessKey,
    required this.sessionToken,
    required this.mediaId,
    required this.location,
    required this.region,
    required this.bucket,
  });

  factory MediaUploadInItResponse.fromJson(Map<String, dynamic> json) =>
      _$MediaUploadInItResponseFromJson(json);
  Map<String, dynamic> toJson() => _$MediaUploadInItResponseToJson(this);

  static const jsonFactory = _$MediaUploadInItResponseFromJson;

  @JsonKey(name: 'AccessKeyId')
  final String accessKeyId;
  @JsonKey(name: 'SecretAccessKey')
  final String secretAccessKey;
  @JsonKey(name: 'SessionToken')
  final String sessionToken;
  @JsonKey(name: 'MediaId')
  final int mediaId;
  @JsonKey(name: 'Location')
  final String location;
  @JsonKey(name: 'Region')
  final String region;
  @JsonKey(name: 'Bucket')
  final String bucket;
}
