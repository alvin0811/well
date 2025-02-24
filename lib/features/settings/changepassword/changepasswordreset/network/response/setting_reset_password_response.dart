import 'package:json_annotation/json_annotation.dart';

part 'setting_reset_password_response.g.dart';

@JsonSerializable()
class SettingResetPasswordResponse {
  SettingResetPasswordResponse({
    required this.data,
  });

  factory SettingResetPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$SettingResetPasswordResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SettingResetPasswordResponseToJson(this);

  static const jsonFactory = _$SettingResetPasswordResponseFromJson;
  @JsonKey(name: 'data')
  final bool data;
}
