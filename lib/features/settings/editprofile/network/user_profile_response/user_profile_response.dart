import 'package:json_annotation/json_annotation.dart';
import 'package:well_path/features/settings/editprofile/network/device/device.dart';
import 'package:well_path/features/settings/editprofile/network/user/user.dart';

part 'user_profile_response.g.dart';

@JsonSerializable()
class UserProfileResponse {
  UserProfileResponse({
    required this.user,
    required this.device,
  });

  factory UserProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$UserProfileResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UserProfileResponseToJson(this);

  static const jsonFactory = _$UserProfileResponseFromJson;
  @JsonKey(name: 'user')
  User? user;
  @JsonKey(name: 'device')
  Device? device;
}
