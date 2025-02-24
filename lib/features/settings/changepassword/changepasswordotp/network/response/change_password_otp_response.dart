import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_password_otp_response.g.dart';

@JsonSerializable()
class ChangePasswordOtpResponse {
  ChangePasswordOtpResponse({
    required this.token,
    required this.message,
  });

  factory ChangePasswordOtpResponse.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordOtpResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ChangePasswordOtpResponseToJson(this);

  static const jsonFactory = _$ChangePasswordOtpResponseFromJson;

  @JsonKey(name: 'Token')
  String token;
  final String? message;
}
