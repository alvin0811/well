import 'package:freezed_annotation/freezed_annotation.dart';

part 'setting_reset_password_request.g.dart';

@JsonSerializable()
class SettingResetPasswordRequest {
  SettingResetPasswordRequest({required this.token, required this.password});

  factory SettingResetPasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$SettingResetPasswordRequestFromJson(json);
  Map<String, dynamic> toJson() => _$SettingResetPasswordRequestToJson(this);

  static const jsonFactory = _$SettingResetPasswordRequestFromJson;

  @JsonKey(name: 'Token')
  final String token;
  @JsonKey(name: 'Password')
  final String password;
}
