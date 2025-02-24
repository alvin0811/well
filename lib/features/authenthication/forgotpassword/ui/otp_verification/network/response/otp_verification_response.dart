import 'package:freezed_annotation/freezed_annotation.dart';

part 'otp_verification_response.g.dart';

@JsonSerializable()
class OtpVerificationResponse {
  OtpVerificationResponse({
    required this.token,
    required this.message,
  });

  factory OtpVerificationResponse.fromJson(Map<String, dynamic> json) =>
      _$OtpVerificationResponseFromJson(json);
  Map<String, dynamic> toJson() => _$OtpVerificationResponseToJson(this);

  static const jsonFactory = _$OtpVerificationResponseFromJson;

  @JsonKey(name: 'Token')
  String token;
  final String? message;
}
