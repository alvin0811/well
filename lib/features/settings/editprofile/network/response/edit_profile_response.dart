import 'package:json_annotation/json_annotation.dart';

part 'edit_profile_response.g.dart';

@JsonSerializable()
class EditProfileResponse {
  EditProfileResponse({
    required this.data,
  });

  factory EditProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$EditProfileResponseFromJson(json);
  Map<String, dynamic> toJson() => _$EditProfileResponseToJson(this);

  static const jsonFactory = _$EditProfileResponseFromJson;
  @JsonKey(name: 'data')
  final bool data;
}
