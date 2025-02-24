import 'package:json_annotation/json_annotation.dart';

part 'media_upload_finalize_response.g.dart';

@JsonSerializable()
class MediaUploadFinalizeResponse {
  MediaUploadFinalizeResponse({
    required this.id,
    required this.userId,
    required this.name,
    required this.extension,
    required this.size,
    required this.location,
    required this.path,
    required this.thumbPath,
  });

  @JsonKey(name: 'Id')
  final int id;
  @JsonKey(name: 'UserId')
  final int userId;
  @JsonKey(name: 'Name')
  final String name;
  @JsonKey(name: 'Extension')
  final String extension;
  @JsonKey(name: 'Size')
  final int size;
  @JsonKey(name: 'Location')
  final String location;
  @JsonKey(name: 'Path')
  final String path;
  @JsonKey(name: 'ThumbPath')
  final String thumbPath;

  static const jsonFactory = _$MediaUploadFinalizeResponseFromJson;

  factory MediaUploadFinalizeResponse.fromJson(Map<String, dynamic> json) =>
      _$MediaUploadFinalizeResponseFromJson(json);
  Map<String, dynamic> toJson() => _$MediaUploadFinalizeResponseToJson(this);
}
