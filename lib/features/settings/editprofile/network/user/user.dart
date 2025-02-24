import 'package:json_annotation/json_annotation.dart';
import 'package:well_path/data/local/models/auth_user.dart';
import 'package:well_path/features/settings/editprofile/network/profilePicture/profile_picture.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  User({
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.id,
    required this.type,
    required this.profilePictureId,
    required this.isFirstStepCompleted,
    required this.isSecondStepCompleted,
    required this.isOnboardingCompleted,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  static const jsonFactory = _$UserFromJson;
  @JsonKey(name: 'Id')
  final int id;
  @JsonKey(name: 'FullName')
  final String fullName;
  @JsonKey(name: 'Email')
  final String email;
  @JsonKey(name: 'PhoneNumber')
  final String? phoneNumber;
  @JsonKey(name: 'Type')
  final String? type;
  @JsonKey(name: 'ProfilePictureId')
  final int? profilePictureId;
  @JsonKey(name: 'IsFirstStepCompleted')
  final bool? isFirstStepCompleted;
  @JsonKey(name: 'IsSecondStepCompleted')
  final bool? isSecondStepCompleted;
  @JsonKey(name: 'IsOnboardingCompleted')
  final bool? isOnboardingCompleted;
  @JsonKey(name: 'ProfilePicture')
  ProfilePicture? profilePicture;
}

extension ToAuthUser on User {
  AuthUser toAuthUser() {
    return AuthUser(
      id: id,
      fullName: fullName,
      email: email,
      phoneNumber: phoneNumber,
      path: profilePicture?.path,
      thumbPath: profilePicture?.thumbPath,
    );
  }
}
