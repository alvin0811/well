import 'package:json_annotation/json_annotation.dart';
import 'package:well_path/colors/colors.dart';

import 'package:well_path/data/local/models/auth_user.dart';

part 'sign_up_response.g.dart';

@JsonSerializable()
class SignUpResponse {
  SignUpResponse({
    required this.token,
    required this.user,
    required this.deviceUUID,
    required this.message,
  });

  factory SignUpResponse.fromJson(Map<String, dynamic> json) => _$SignUpResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SignUpResponseToJson(this);

  static const jsonFactory = _$SignUpResponseFromJson;

  @JsonKey(name: 'Token')
  String token;
  @JsonKey(name: 'User')
  final SignUpResponseData user;
  @JsonKey(name: 'DeviceUUID')
  String deviceUUID;
  final String? message;
}

@JsonSerializable()
class SignUpResponseData {
  SignUpResponseData({
    required this.fullName,
    required this.phoneNumber,
    required this.email,
    required this.userType,
    required this.userId,
    required this.isFirstStepCompleted,
    required this.isSecondStepCompleted,
    required this.isOnboardingCompleted,
  });

  @JsonKey(name: 'FullName')
  String fullName;
  @JsonKey(name: 'PhoneNumber')
  String phoneNumber;
  @JsonKey(name: 'Email')
  String email;
  @JsonKey(name: 'Type')
  String? userType;
  @JsonKey(name: 'Id')
  int userId;
  @JsonKey(name: 'IsFirstStepCompleted')
  bool isFirstStepCompleted;
  @JsonKey(name: 'IsSecondStepCompleted')
  bool isSecondStepCompleted;
  @JsonKey(name: 'IsOnboardingCompleted')
  bool isOnboardingCompleted;

  factory SignUpResponseData.fromJson(Map<String, dynamic> json) => _$SignUpResponseDataFromJson(json);
  Map<String, dynamic> toJson() => _$SignUpResponseDataToJson(this);
}

extension ToAuthStoreModel on SignUpResponseData {
  AuthUser toAuthStoreModel() {
    userGlobalId = userId;
    return AuthUser(
      id: userId,
      fullName: fullName,
      email: email,
      phoneNumber: phoneNumber,
    );
  }
}
