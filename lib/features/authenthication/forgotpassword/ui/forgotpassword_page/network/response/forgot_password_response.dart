import 'package:freezed_annotation/freezed_annotation.dart';

part 'forgot_password_response.g.dart';

@JsonSerializable()
class ForgotPasswordResponse {
  ForgotPasswordResponse({
    required this.token,
    required this.message,
  });

  factory ForgotPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ForgotPasswordResponseToJson(this);

  static const jsonFactory = _$ForgotPasswordResponseFromJson;

  @JsonKey(name: 'Token')
  String token;
  final String? message;
}
