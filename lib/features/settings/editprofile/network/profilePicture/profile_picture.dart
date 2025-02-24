import 'package:json_annotation/json_annotation.dart';

part 'profile_picture.g.dart';

@JsonSerializable()
class ProfilePicture {
  ProfilePicture({
    required this.id,
    required this.path,
    required this.thumbPath,
  });

  factory ProfilePicture.fromJson(Map<String, dynamic> json) =>
      _$ProfilePictureFromJson(json);
  Map<String, dynamic> toJson() => _$ProfilePictureToJson(this);

  static const jsonFactory = _$ProfilePictureFromJson;
  @JsonKey(name: 'Id')
  final int id;
  @JsonKey(name: 'Path')
  final String path;
  @JsonKey(name: 'ThumbPath')
  final String thumbPath;
}
