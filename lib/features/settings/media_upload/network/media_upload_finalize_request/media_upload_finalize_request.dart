import 'package:freezed_annotation/freezed_annotation.dart';

part 'media_upload_finalize_request.g.dart';

@JsonSerializable()
class MediaUploadFinalizeRequest {
  MediaUploadFinalizeRequest({
    required this.id,
  });

  @JsonKey(name: 'Id')
  final int id;

  factory MediaUploadFinalizeRequest.fromJson(Map<String, dynamic> json) =>
      _$MediaUploadFinalizeRequestFromJson(json);
  Map<String, dynamic> toJson() => _$MediaUploadFinalizeRequestToJson(this);
}
