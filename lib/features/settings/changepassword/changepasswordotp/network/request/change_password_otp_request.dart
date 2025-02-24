import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_password_otp_request.g.dart';

@JsonSerializable()
class ChangePasswordOtpRequest {
  ChangePasswordOtpRequest({required this.token, required this.code});

  factory ChangePasswordOtpRequest.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordOtpRequestFromJson(json);
  Map<String, dynamic> toJson() => _$ChangePasswordOtpRequestToJson(this);

  static const jsonFactory = _$ChangePasswordOtpRequestFromJson;

  @JsonKey(name: 'Token')
  final String token;
  @JsonKey(name: 'Code')
  final String code;
}
