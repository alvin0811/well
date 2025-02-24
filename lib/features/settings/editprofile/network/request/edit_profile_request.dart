import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_profile_request.g.dart';

@JsonSerializable()
class EditProfileRequest {
  EditProfileRequest({
    required this.name,
    required this.profilePictureId,
    required this.email,
    required this.phone,
  });

  factory EditProfileRequest.fromJson(Map<String, dynamic> json) =>
      _$EditProfileRequestFromJson(json);
  Map<String, dynamic> toJson() => _$EditProfileRequestToJson(this);

  @JsonKey(name: 'FullName')
  final String name;
  @JsonKey(name: 'Email')
  final String email;
  @JsonKey(name: 'PhoneNumber')
  final String phone;
  @JsonKey(name: 'ProfilePictureId')
  final int profilePictureId;
}
