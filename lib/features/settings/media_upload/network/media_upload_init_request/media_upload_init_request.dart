import 'package:freezed_annotation/freezed_annotation.dart';

part 'media_upload_init_request.g.dart';

@JsonSerializable()
class MediaUploadInItRequest {
  MediaUploadInItRequest({
    required this.name,
    required this.size,
    required this.type,
  });

  factory MediaUploadInItRequest.fromJson(Map<String, dynamic> json) =>
      _$MediaUploadInItRequestFromJson(json);
  Map<String, dynamic> toJson() => _$MediaUploadInItRequestToJson(this);

  static const jsonFactory = _$MediaUploadInItRequestFromJson;

  @JsonKey(name: 'Name')
  final String name;
  @JsonKey(name: 'Size')
  final int size;
  @JsonKey(name: 'Type')
  final String type;
}
