import 'package:freezed_annotation/freezed_annotation.dart';

part 'otp_verification_request.g.dart';

@JsonSerializable()
class OtpVerificationRequest {
  OtpVerificationRequest({
    required this.token,
    required this.code,
  });

  factory OtpVerificationRequest.fromJson(Map<String, dynamic> json) =>
      _$OtpVerificationRequestFromJson(json);
  Map<String, dynamic> toJson() => _$OtpVerificationRequestToJson(this);

  static const jsonFactory = _$OtpVerificationRequestFromJson;

  @JsonKey(name: 'Token')
  String token;
  @JsonKey(name: 'Code')
  String code;
}
